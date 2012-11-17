import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;
import org.junit.Test;

public class Demo {
		
	private static String posSample = "sample.number";
		
	@Test
	public void acceptBNF() throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(posSample);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        BNFLexer lexer = new BNFLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        BNFParser parser = new BNFParser(tokens);
        parser.number();
        if (parser.getError()) throw new RecognitionException();
	}

	@Test
	public void acceptEBNF() throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(posSample);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        EBNFLexer lexer = new EBNFLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        EBNFParser parser = new EBNFParser(tokens);
        parser.number();
        if (parser.getError()) throw new RecognitionException();
	}
	
	@Test
	public void tranlateWithBNF() throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(posSample);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        AttributesForEBNFLexer lexer = new AttributesForEBNFLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        AttributesForEBNFParser parser = new AttributesForEBNFParser(tokens);
        float val = parser.number();
        if (parser.getError()) throw new RecognitionException();
        System.out.println(val);
	}		
}
