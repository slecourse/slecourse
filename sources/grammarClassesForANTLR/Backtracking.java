import java.io.FileInputStream;
import java.io.IOException;
import org.antlr.runtime.*;

public class Backtracking {

	private static void parse(String s) throws IOException, RecognitionException {
		FileInputStream stream = new FileInputStream(s);
        ANTLRInputStream antlr = new ANTLRInputStream(stream);
        Lexer lexer = new BacktrackingLexer(antlr);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        BacktrackingParser parser = new BacktrackingParser(tokens);
        parser.s();
	}

	public static void main(String[] args) throws IOException, RecognitionException {
		parse("Backtracking.txt");
	}
	
}
