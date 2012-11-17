import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;
import org.junit.Test;

public class Demo {
		
	private static String posSample = "sample.fsm";
		
	private static void acceptFsm(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        AcceptorLexer lexer = new AcceptorLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        AcceptorParser parser = new AcceptorParser(tokens);
        parser.fsm();
        if (parser.getError()) throw new RecognitionException();
	}

	private static void analyzeNames(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        NameAnalysisLexer lexer = new NameAnalysisLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        NameAnalysisParser parser = new NameAnalysisParser(tokens);
        parser.fsm();
        if (parser.getError()) throw new RecognitionException();
        for (State state : parser.getFsm().getStates())
        	System.out.println("state " + state.getId() + ";");
        for (Trans trans : parser.getFsm().getTranss())
        	System.out.println("trans " + trans.getSource().getId() + " -> " + trans.getTarget().getId() + ";");
	}
		
	@Test
	public void testPositive() throws IOException, RecognitionException {
		acceptFsm(posSample);
		analyzeNames(posSample);
	}
}
