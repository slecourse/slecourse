CLASSPATH = -classpath ".:antlr-3.2.jar"

all:
	-make $(patsubst %.g,%.gen,$(wildcard *.g))

%.gen:
	-java ${CLASSPATH} org.antlr.Tool $*.g

clean:
	rm -f *.class
	rm -f *.tokens
	rm -f *Lexer.java
	rm -f *Parser.java
