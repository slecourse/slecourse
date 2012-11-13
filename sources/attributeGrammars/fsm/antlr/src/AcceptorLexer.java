// $ANTLR 3.2 Sep 23, 2009 12:02:23 Acceptor.g 2012-11-13 11:35:37

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class AcceptorLexer extends Lexer {
    public static final int WS=5;
    public static final int ID=4;
    public static final int EOF=-1;
    public static final int T__9=9;
    public static final int T__8=8;
    public static final int T__7=7;
    public static final int T__6=6;

    // delegates
    // delegators

    public AcceptorLexer() {;} 
    public AcceptorLexer(CharStream input) {
        this(input, new RecognizerSharedState());
    }
    public AcceptorLexer(CharStream input, RecognizerSharedState state) {
        super(input,state);

    }
    public String getGrammarFileName() { return "Acceptor.g"; }

    // $ANTLR start "T__6"
    public final void mT__6() throws RecognitionException {
        try {
            int _type = T__6;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // Acceptor.g:3:6: ( 'state' )
            // Acceptor.g:3:8: 'state'
            {
            match("state"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__6"

    // $ANTLR start "T__7"
    public final void mT__7() throws RecognitionException {
        try {
            int _type = T__7;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // Acceptor.g:4:6: ( ';' )
            // Acceptor.g:4:8: ';'
            {
            match(';'); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__7"

    // $ANTLR start "T__8"
    public final void mT__8() throws RecognitionException {
        try {
            int _type = T__8;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // Acceptor.g:5:6: ( 'trans' )
            // Acceptor.g:5:8: 'trans'
            {
            match("trans"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__8"

    // $ANTLR start "T__9"
    public final void mT__9() throws RecognitionException {
        try {
            int _type = T__9;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // Acceptor.g:6:6: ( '->' )
            // Acceptor.g:6:8: '->'
            {
            match("->"); 


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "T__9"

    // $ANTLR start "ID"
    public final void mID() throws RecognitionException {
        try {
            int _type = ID;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // Acceptor.g:36:6: ( ( 'A' .. 'Z' | '0' .. '9' )+ )
            // Acceptor.g:36:10: ( 'A' .. 'Z' | '0' .. '9' )+
            {
            // Acceptor.g:36:10: ( 'A' .. 'Z' | '0' .. '9' )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( ((LA1_0>='0' && LA1_0<='9')||(LA1_0>='A' && LA1_0<='Z')) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // Acceptor.g:
            	    {
            	    if ( (input.LA(1)>='0' && input.LA(1)<='9')||(input.LA(1)>='A' && input.LA(1)<='Z') ) {
            	        input.consume();

            	    }
            	    else {
            	        MismatchedSetException mse = new MismatchedSetException(null,input);
            	        recover(mse);
            	        throw mse;}


            	    }
            	    break;

            	default :
            	    if ( cnt1 >= 1 ) break loop1;
                        EarlyExitException eee =
                            new EarlyExitException(1, input);
                        throw eee;
                }
                cnt1++;
            } while (true);


            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "ID"

    // $ANTLR start "WS"
    public final void mWS() throws RecognitionException {
        try {
            int _type = WS;
            int _channel = DEFAULT_TOKEN_CHANNEL;
            // Acceptor.g:37:6: ( ( ' ' | ( '\\r' )? '\\n' | '\\t' )+ )
            // Acceptor.g:37:10: ( ' ' | ( '\\r' )? '\\n' | '\\t' )+
            {
            // Acceptor.g:37:10: ( ' ' | ( '\\r' )? '\\n' | '\\t' )+
            int cnt3=0;
            loop3:
            do {
                int alt3=4;
                switch ( input.LA(1) ) {
                case ' ':
                    {
                    alt3=1;
                    }
                    break;
                case '\n':
                case '\r':
                    {
                    alt3=2;
                    }
                    break;
                case '\t':
                    {
                    alt3=3;
                    }
                    break;

                }

                switch (alt3) {
            	case 1 :
            	    // Acceptor.g:37:11: ' '
            	    {
            	    match(' '); 

            	    }
            	    break;
            	case 2 :
            	    // Acceptor.g:37:15: ( '\\r' )? '\\n'
            	    {
            	    // Acceptor.g:37:15: ( '\\r' )?
            	    int alt2=2;
            	    int LA2_0 = input.LA(1);

            	    if ( (LA2_0=='\r') ) {
            	        alt2=1;
            	    }
            	    switch (alt2) {
            	        case 1 :
            	            // Acceptor.g:37:15: '\\r'
            	            {
            	            match('\r'); 

            	            }
            	            break;

            	    }

            	    match('\n'); 

            	    }
            	    break;
            	case 3 :
            	    // Acceptor.g:37:26: '\\t'
            	    {
            	    match('\t'); 

            	    }
            	    break;

            	default :
            	    if ( cnt3 >= 1 ) break loop3;
                        EarlyExitException eee =
                            new EarlyExitException(3, input);
                        throw eee;
                }
                cnt3++;
            } while (true);

             skip(); 

            }

            state.type = _type;
            state.channel = _channel;
        }
        finally {
        }
    }
    // $ANTLR end "WS"

    public void mTokens() throws RecognitionException {
        // Acceptor.g:1:8: ( T__6 | T__7 | T__8 | T__9 | ID | WS )
        int alt4=6;
        switch ( input.LA(1) ) {
        case 's':
            {
            alt4=1;
            }
            break;
        case ';':
            {
            alt4=2;
            }
            break;
        case 't':
            {
            alt4=3;
            }
            break;
        case '-':
            {
            alt4=4;
            }
            break;
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'L':
        case 'M':
        case 'N':
        case 'O':
        case 'P':
        case 'Q':
        case 'R':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
        case 'Z':
            {
            alt4=5;
            }
            break;
        case '\t':
        case '\n':
        case '\r':
        case ' ':
            {
            alt4=6;
            }
            break;
        default:
            NoViableAltException nvae =
                new NoViableAltException("", 4, 0, input);

            throw nvae;
        }

        switch (alt4) {
            case 1 :
                // Acceptor.g:1:10: T__6
                {
                mT__6(); 

                }
                break;
            case 2 :
                // Acceptor.g:1:15: T__7
                {
                mT__7(); 

                }
                break;
            case 3 :
                // Acceptor.g:1:20: T__8
                {
                mT__8(); 

                }
                break;
            case 4 :
                // Acceptor.g:1:25: T__9
                {
                mT__9(); 

                }
                break;
            case 5 :
                // Acceptor.g:1:30: ID
                {
                mID(); 

                }
                break;
            case 6 :
                // Acceptor.g:1:33: WS
                {
                mWS(); 

                }
                break;

        }

    }


 

}