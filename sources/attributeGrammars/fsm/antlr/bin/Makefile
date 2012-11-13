CLASSPATH = -classpath ".:../antlr-3.2.jar"

generate:
	java ${CLASSPATH} org.antlr.Tool Acceptor.g
	java ${CLASSPATH} org.antlr.Tool NameAnalysis.g

clean:
	rm -f *.class
	rm -f *.tokens
	rm -f *Lexer.java
	rm -f *Parser.java
