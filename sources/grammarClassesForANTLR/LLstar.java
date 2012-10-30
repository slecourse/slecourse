import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;

public class LLstar {

	private static void parse(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        Lexer lexer = new LLstarLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        LLstarParser parser = new LLstarParser(tokens);
        parser.s();
	}

	public static void main(String[] args) throws IOException, RecognitionException {
		parse("LLstar.txt");
	}
	
}
