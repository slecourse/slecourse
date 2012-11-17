// $ANTLR 3.2 Sep 23, 2009 12:02:23 BNF.g 2012-11-17 22:53:40

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class BNFParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "'0'", "'1'", "'.'"
    };
    public static final int EOF=-1;
    public static final int T__6=6;
    public static final int T__5=5;
    public static final int T__4=4;

    // delegates
    // delegators


        public BNFParser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public BNFParser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return BNFParser.tokenNames; }
    public String getGrammarFileName() { return "BNF.g"; }



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
    // BNF.g:22:1: number : bits rest EOF ;
    public final void number() throws RecognitionException {
        try {
            // BNF.g:22:10: ( bits rest EOF )
            // BNF.g:22:12: bits rest EOF
            {
            pushFollow(FOLLOW_bits_in_number32);
            bits();

            state._fsp--;

            pushFollow(FOLLOW_rest_in_number34);
            rest();

            state._fsp--;

            match(input,EOF,FOLLOW_EOF_in_number36); 

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


    // $ANTLR start "bits"
    // BNF.g:23:1: bits : ( bit | bit bits );
    public final void bits() throws RecognitionException {
        try {
            // BNF.g:23:8: ( bit | bit bits )
            int alt1=2;
            int LA1_0 = input.LA(1);

            if ( ((LA1_0>=4 && LA1_0<=5)) ) {
                int LA1_1 = input.LA(2);

                if ( (LA1_1==EOF||LA1_1==6) ) {
                    alt1=1;
                }
                else if ( ((LA1_1>=4 && LA1_1<=5)) ) {
                    alt1=2;
                }
                else {
                    NoViableAltException nvae =
                        new NoViableAltException("", 1, 1, input);

                    throw nvae;
                }
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 1, 0, input);

                throw nvae;
            }
            switch (alt1) {
                case 1 :
                    // BNF.g:23:10: bit
                    {
                    pushFollow(FOLLOW_bit_in_bits45);
                    bit();

                    state._fsp--;


                    }
                    break;
                case 2 :
                    // BNF.g:23:16: bit bits
                    {
                    pushFollow(FOLLOW_bit_in_bits49);
                    bit();

                    state._fsp--;

                    pushFollow(FOLLOW_bits_in_bits51);
                    bits();

                    state._fsp--;


                    }
                    break;

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
    // $ANTLR end "bits"


    // $ANTLR start "bit"
    // BNF.g:24:1: bit : ( '0' | '1' );
    public final void bit() throws RecognitionException {
        try {
            // BNF.g:24:7: ( '0' | '1' )
            // BNF.g:
            {
            if ( (input.LA(1)>=4 && input.LA(1)<=5) ) {
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


    // $ANTLR start "rest"
    // BNF.g:25:1: rest : ( | '.' bits );
    public final void rest() throws RecognitionException {
        try {
            // BNF.g:25:8: ( | '.' bits )
            int alt2=2;
            int LA2_0 = input.LA(1);

            if ( (LA2_0==EOF) ) {
                alt2=1;
            }
            else if ( (LA2_0==6) ) {
                alt2=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 2, 0, input);

                throw nvae;
            }
            switch (alt2) {
                case 1 :
                    // BNF.g:25:10: 
                    {
                    }
                    break;
                case 2 :
                    // BNF.g:25:12: '.' bits
                    {
                    match(input,6,FOLLOW_6_in_rest75); 
                    pushFollow(FOLLOW_bits_in_rest77);
                    bits();

                    state._fsp--;


                    }
                    break;

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
    // $ANTLR end "rest"

    // Delegated rules


 

    public static final BitSet FOLLOW_bits_in_number32 = new BitSet(new long[]{0x0000000000000040L});
    public static final BitSet FOLLOW_rest_in_number34 = new BitSet(new long[]{0x0000000000000000L});
    public static final BitSet FOLLOW_EOF_in_number36 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_bit_in_bits45 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_bit_in_bits49 = new BitSet(new long[]{0x0000000000000030L});
    public static final BitSet FOLLOW_bits_in_bits51 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_set_in_bit0 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_6_in_rest75 = new BitSet(new long[]{0x0000000000000030L});
    public static final BitSet FOLLOW_bits_in_rest77 = new BitSet(new long[]{0x0000000000000002L});

}