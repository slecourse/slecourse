import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;

public class LL1 {

	private static void parse(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        Lexer lexer = new LL1Lexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        LL1Parser parser = new LL1Parser(tokens);
        parser.s();
	}

	public static void main(String[] args) throws IOException, RecognitionException {
		parse("LL1.txt");
	}
	
}
