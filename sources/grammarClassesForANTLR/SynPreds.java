import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;

public class SynPreds {

	private static void parse(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        Lexer lexer = new SynPredsLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        SynPredsParser parser = new SynPredsParser(tokens);
        parser.s();
	}

	public static void main(String[] args) throws IOException, RecognitionException {
		parse("SynPreds.txt");
	}
	
}
