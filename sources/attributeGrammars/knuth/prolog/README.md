Module Syntax.pro shows a DCG for the syntax of binary numbers.

Module Conversion.pro is Syntax.pro enriched with the semantic rules for conversion to decimal numbers.

All the semantic rules are enclosed in double braces.

The other level of braces is for the fact that these are semantic rules within a DCG.

The inner level of braces is for signaling that these are constraints according to CLP(R).

