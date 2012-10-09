import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;

public class Desperate {

	private static void parse(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        Lexer lexer = new DesperateLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        DesperateParser parser = new DesperateParser(tokens);
        parser.s();
	}

	public static void main(String[] args) throws IOException, RecognitionException {
		parse("Desperate.txt");
	}
	
}
