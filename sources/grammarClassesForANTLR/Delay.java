import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;

public class Delay {

	private static void parse(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        Lexer lexer = new DelayLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        DelayParser parser = new DelayParser(tokens);
        parser.s();
	}

	public static void main(String[] args) throws IOException, RecognitionException {
		parse("Delay.txt");
	}
	
}
