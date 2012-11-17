// $ANTLR 3.2 Sep 23, 2009 12:02:23 EBNF.g 2012-11-17 22:53:40

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class EBNFParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "'.'", "'0'", "'1'"
    };
    public static final int EOF=-1;
    public static final int T__6=6;
    public static final int T__5=5;
    public static final int T__4=4;

    // delegates
    // delegators


        public EBNFParser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public EBNFParser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return EBNFParser.tokenNames; }
    public String getGrammarFileName() { return "EBNF.g"; }



    // Throw if any error was emitted
    private boolean error = false;

    public boolean getError() { return error; }

    @Override
    public void emitErrorMessage(String msg) 
    {
      error = true;
      super.emitErrorMessage(msg);
    }



    // $ANTLR start "number"
    // EBNF.g:22:1: number : ( bit )+ ( '.' ( bit )+ )? EOF ;
    public final void number() throws RecognitionException {
        try {
            // EBNF.g:22:10: ( ( bit )+ ( '.' ( bit )+ )? EOF )
            // EBNF.g:22:12: ( bit )+ ( '.' ( bit )+ )? EOF
            {
            // EBNF.g:22:12: ( bit )+
            int cnt1=0;
            loop1:
            do {
                int alt1=2;
                int LA1_0 = input.LA(1);

                if ( ((LA1_0>=5 && LA1_0<=6)) ) {
                    alt1=1;
                }


                switch (alt1) {
            	case 1 :
            	    // EBNF.g:22:12: bit
            	    {
            	    pushFollow(FOLLOW_bit_in_number32);
            	    bit();

            	    state._fsp--;


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

            // EBNF.g:22:17: ( '.' ( bit )+ )?
            int alt3=2;
            int LA3_0 = input.LA(1);

            if ( (LA3_0==4) ) {
                alt3=1;
            }
            switch (alt3) {
                case 1 :
                    // EBNF.g:22:18: '.' ( bit )+
                    {
                    match(input,4,FOLLOW_4_in_number36); 
                    // EBNF.g:22:22: ( bit )+
                    int cnt2=0;
                    loop2:
                    do {
                        int alt2=2;
                        int LA2_0 = input.LA(1);

                        if ( ((LA2_0>=5 && LA2_0<=6)) ) {
                            alt2=1;
                        }


                        switch (alt2) {
                    	case 1 :
                    	    // EBNF.g:22:22: bit
                    	    {
                    	    pushFollow(FOLLOW_bit_in_number38);
                    	    bit();

                    	    state._fsp--;


                    	    }
                    	    break;

                    	default :
                    	    if ( cnt2 >= 1 ) break loop2;
                                EarlyExitException eee =
                                    new EarlyExitException(2, input);
                                throw eee;
                        }
                        cnt2++;
                    } while (true);


                    }
                    break;

            }

            match(input,EOF,FOLLOW_EOF_in_number43); 

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
    // $ANTLR end "number"


    // $ANTLR start "bit"
    // EBNF.g:23:1: bit : ( '0' | '1' );
    public final void bit() throws RecognitionException {
        try {
            // EBNF.g:23:7: ( '0' | '1' )
            // EBNF.g:
            {
            if ( (input.LA(1)>=5 && input.LA(1)<=6) ) {
                input.consume();
                state.errorRecovery=false;
            }
            else {
                MismatchedSetException mse = new MismatchedSetException(null,input);
                throw mse;
            }


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
    // $ANTLR end "bit"

    // Delegated rules


 

    public static final BitSet FOLLOW_bit_in_number32 = new BitSet(new long[]{0x0000000000000070L});
    public static final BitSet FOLLOW_4_in_number36 = new BitSet(new long[]{0x0000000000000070L});
    public static final BitSet FOLLOW_bit_in_number38 = new BitSet(new long[]{0x0000000000000070L});
    public static final BitSet FOLLOW_EOF_in_number43 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_bit0 = new BitSet(new long[]{0x0000000000000002L});

}