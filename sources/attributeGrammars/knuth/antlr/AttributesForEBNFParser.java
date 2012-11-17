// $ANTLR 3.2 Sep 23, 2009 12:02:23 AttributesForEBNF.g 2012-11-17 22:53:41

import org.antlr.runtime.*;
import java.util.Stack;
import java.util.List;
import java.util.ArrayList;

public class AttributesForEBNFParser extends Parser {
    public static final String[] tokenNames = new String[] {
        "<invalid>", "<EOR>", "<DOWN>", "<UP>", "'.'", "'0'", "'1'"
    };
    public static final int EOF=-1;
    public static final int T__6=6;
    public static final int T__5=5;
    public static final int T__4=4;

    // delegates
    // delegators


        public AttributesForEBNFParser(TokenStream input) {
            this(input, new RecognizerSharedState());
        }
        public AttributesForEBNFParser(TokenStream input, RecognizerSharedState state) {
            super(input, state);
             
        }
        

    public String[] getTokenNames() { return AttributesForEBNFParser.tokenNames; }
    public String getGrammarFileName() { return "AttributesForEBNF.g"; }



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
    // AttributesForEBNF.g:22:1: number returns [float val] : (bit1= bit )+ ( '.' (bit2= bit )+ )? EOF ;
    public final float number() throws RecognitionException {
        float val = 0.0f;

        float bit1 = 0.0f;

        float bit2 = 0.0f;


        try {
            // AttributesForEBNF.g:22:28: ( (bit1= bit )+ ( '.' (bit2= bit )+ )? EOF )
            // AttributesForEBNF.g:23:3: (bit1= bit )+ ( '.' (bit2= bit )+ )? EOF
            {
             val = 0; 
            // AttributesForEBNF.g:24:2: (bit1= bit )+
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
            	    // AttributesForEBNF.g:24:4: bit1= bit
            	    {
            	    pushFollow(FOLLOW_bit_in_number44);
            	    bit1=bit();

            	    state._fsp--;

            	     val = val*2 + bit1; 

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

            // AttributesForEBNF.g:25:2: ( '.' (bit2= bit )+ )?
            int alt3=2;
            int LA3_0 = input.LA(1);

            if ( (LA3_0==4) ) {
                alt3=1;
            }
            switch (alt3) {
                case 1 :
                    // AttributesForEBNF.g:25:3: '.' (bit2= bit )+
                    {
                    match(input,4,FOLLOW_4_in_number54); 
                     float place = 0.5f; 
                    // AttributesForEBNF.g:25:31: (bit2= bit )+
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
                    	    // AttributesForEBNF.g:25:33: bit2= bit
                    	    {
                    	    pushFollow(FOLLOW_bit_in_number62);
                    	    bit2=bit();

                    	    state._fsp--;

                    	     val += bit2*place; place /= 2; 

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

            match(input,EOF,FOLLOW_EOF_in_number73); 

            }

        }
        catch (RecognitionException re) {
            reportError(re);
            recover(input,re);
        }
        finally {
        }
        return val;
    }
    // $ANTLR end "number"


    // $ANTLR start "bit"
    // AttributesForEBNF.g:28:1: bit returns [float val] : ( ( '0' ) | ( '1' ) );
    public final float bit() throws RecognitionException {
        float val = 0.0f;

        try {
            // AttributesForEBNF.g:28:25: ( ( '0' ) | ( '1' ) )
            int alt4=2;
            int LA4_0 = input.LA(1);

            if ( (LA4_0==5) ) {
                alt4=1;
            }
            else if ( (LA4_0==6) ) {
                alt4=2;
            }
            else {
                NoViableAltException nvae =
                    new NoViableAltException("", 4, 0, input);

                throw nvae;
            }
            switch (alt4) {
                case 1 :
                    // AttributesForEBNF.g:29:3: ( '0' )
                    {
                    // AttributesForEBNF.g:29:3: ( '0' )
                    // AttributesForEBNF.g:29:5: '0'
                    {
                    match(input,5,FOLLOW_5_in_bit90); 
                     val = 0; 

                    }


                    }
                    break;
                case 2 :
                    // AttributesForEBNF.g:30:5: ( '1' )
                    {
                    // AttributesForEBNF.g:30:5: ( '1' )
                    // AttributesForEBNF.g:30:7: '1'
                    {
                    match(input,6,FOLLOW_6_in_bit102); 
                     val = 1; 

                    }


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
        return val;
    }
    // $ANTLR end "bit"

    // Delegated rules


 

    public static final BitSet FOLLOW_bit_in_number44 = new BitSet(new long[]{0x0000000000000070L});
    public static final BitSet FOLLOW_4_in_number54 = new BitSet(new long[]{0x0000000000000070L});
    public static final BitSet FOLLOW_bit_in_number62 = new BitSet(new long[]{0x0000000000000070L});
    public static final BitSet FOLLOW_EOF_in_number73 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_5_in_bit90 = new BitSet(new long[]{0x0000000000000002L});
    public static final BitSet FOLLOW_6_in_bit102 = new BitSet(new long[]{0x0000000000000002L});

}