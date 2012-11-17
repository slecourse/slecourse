// $ANTLR 3.2 Sep 23, 2009 12:02:23 Acceptor.g 2012-11-17 23:03:07

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class AcceptorParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "ID", "WS", "'state'", "';'", "'trans'", "'->'"
    };
    public static final int WS=5;
    public static final int ID=4;
    public static final int EOF=-1;
    public static final int T__9=9;
    public static final int T__8=8;
    public static final int T__7=7;
    public static final int T__6=6;

    // delegates
    // delegators


        public AcceptorParser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public AcceptorParser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return AcceptorParser.tokenNames; }
    public String getGrammarFileName() { return "Acceptor.g"; }



    // Throw if any error was emitted
    private boolean error = false;

    public boolean getError() { return error; }

    @Override
    public void emitErrorMessage(String msg) 
    {
      error = true;
      super.emitErrorMessage(msg);
    }



    // $ANTLR start "fsm"
    // Acceptor.g:22:1: fsm : ( state )* ( trans )* EOF ;
    public final void fsm() throws RecognitionException {
        try {
            // Acceptor.g:22:5: ( ( state )* ( trans )* EOF )
            // Acceptor.g:22:7: ( state )* ( trans )* EOF
            {
            // Acceptor.g:22:7: ( state )*
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( (LA1_0==6) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // Acceptor.g:22:7: state
            	    {
            	    pushFollow(FOLLOW_state_in_fsm30);
            	    state();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop1;
                }
            } while (true);

            // Acceptor.g:22:14: ( trans )*
            loop2:
            do {
                int alt2=2;
                int LA2_0 = input.LA(1);

                if ( (LA2_0==8) ) {
                    alt2=1;
                }


                switch (alt2) {
            	case 1 :
            	    // Acceptor.g:22:14: trans
            	    {
            	    pushFollow(FOLLOW_trans_in_fsm33);
            	    trans();

            	    state._fsp--;


            	    }
            	    break;

            	default :
            	    break loop2;
                }
            } while (true);

            match(input,EOF,FOLLOW_EOF_in_fsm36); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "fsm"


    // $ANTLR start "state"
    // Acceptor.g:24:1: state : 'state' ID ';' ;
    public final void state() throws RecognitionException {
        try {
            // Acceptor.g:24:7: ( 'state' ID ';' )
            // Acceptor.g:25:2: 'state' ID ';'
            {
            match(input,6,FOLLOW_6_in_state45); 
            match(input,ID,FOLLOW_ID_in_state48); 
            match(input,7,FOLLOW_7_in_state51); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "state"


    // $ANTLR start "trans"
    // Acceptor.g:29:1: trans : 'trans' ID '->' ID ';' ;
    public final void trans() throws RecognitionException {
        try {
            // Acceptor.g:29:7: ( 'trans' ID '->' ID ';' )
            // Acceptor.g:30:2: 'trans' ID '->' ID ';'
            {
            match(input,8,FOLLOW_8_in_trans62); 
            match(input,ID,FOLLOW_ID_in_trans65); 
            match(input,9,FOLLOW_9_in_trans68); 
            match(input,ID,FOLLOW_ID_in_trans71); 
            match(input,7,FOLLOW_7_in_trans74); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return ;
    }
    // $ANTLR end "trans"

    // Delegated rules


 

    public static final BitSet FOLLOW_state_in_fsm30 = new BitSet(new long[]{0x0000000000000140L});
    public static final BitSet FOLLOW_trans_in_fsm33 = new BitSet(new long[]{0x0000000000000100L});
    public static final BitSet FOLLOW_EOF_in_fsm36 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_6_in_state45 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_ID_in_state48 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_7_in_state51 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_8_in_trans62 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_ID_in_trans65 = new BitSet(new long[]{0x0000000000000200L});
    public static final BitSet FOLLOW_9_in_trans68 = new BitSet(new long[]{0x0000000000000010L});
    public static final BitSet FOLLOW_ID_in_trans71 = new BitSet(new long[]{0x0000000000000080L});
    public static final BitSet FOLLOW_7_in_trans74 = new BitSet(new long[]{0x0000000000000002L});

}