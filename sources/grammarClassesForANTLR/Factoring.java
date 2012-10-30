import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;

public class Factoring {

	private static void parse(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        Lexer lexer = new FactoringLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        FactoringParser parser = new FactoringParser(tokens);
        parser.s();
	}

	public static void main(String[] args) throws IOException, RecognitionException {
		parse("Factoring.txt");
	}
	
}
