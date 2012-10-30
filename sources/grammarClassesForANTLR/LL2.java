import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;

public class LL2 {

	private static void parse(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        Lexer lexer = new LL2Lexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        LL2Parser parser = new LL2Parser(tokens);
        parser.s();
	}

	public static void main(String[] args) throws IOException, RecognitionException {
		parse("LL2.txt");
	}
	
}
