// $ANTLR 3.2 Sep 23, 2009 12:02:23 AttributesForEBNF__.g 2012-11-17 22:53:41

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class AttributesForEBNFLexer extends Lexer {
    public static final int EOF=-1;
    public static final int T__6=6;
    public static final int T__5=5;
    public static final int T__4=4;

    // delegates
    // delegators

    public AttributesForEBNFLexer() {;} 
    public AttributesForEBNFLexer(CharStream input) {
        this(input, new RecognizerSharedState());
    }
    public AttributesForEBNFLexer(CharStream input, RecognizerSharedState state) {
        super(input,state);

    }
    public String getGrammarFileName() { return "AttributesForEBNF__.g"; }

    // $ANTLR start "T__4"
    public final void mT__4() throws RecognitionException {
        try {
            int _type = T__4;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // AttributesForEBNF__.g:3:6: ( '.' )
            // AttributesForEBNF__.g:3:8: '.'
            {
            match('.'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__4"

    // $ANTLR start "T__5"
    public final void mT__5() throws RecognitionException {
        try {
            int _type = T__5;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // AttributesForEBNF__.g:4:6: ( '0' )
            // AttributesForEBNF__.g:4:8: '0'
            {
            match('0'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__5"

    // $ANTLR start "T__6"
    public final void mT__6() throws RecognitionException {
        try {
            int _type = T__6;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // AttributesForEBNF__.g:5:6: ( '1' )
            // AttributesForEBNF__.g:5:8: '1'
            {
            match('1'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__6"

    public void mTokens() throws RecognitionException {
        // AttributesForEBNF__.g:1:8: ( T__4 | T__5 | T__6 )
        int alt1=3;
        switch ( input.LA(1) ) {
        case '.':
            {
            alt1=1;
            }
            break;
        case '0':
            {
            alt1=2;
            }
            break;
        case '1':
            {
            alt1=3;
            }
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("", 1, 0, input);

            throw nvae;
        }

        switch (alt1) {
            case 1 :
                // AttributesForEBNF__.g:1:10: T__4
                {
                mT__4(); 

                }
                break;
            case 2 :
                // AttributesForEBNF__.g:1:15: T__5
                {
                mT__5(); 

                }
                break;
            case 3 :
                // AttributesForEBNF__.g:1:20: T__6
                {
                mT__6(); 

                }
                break;

        }

    }


 

}