all:
	make test

Main:
	ghc -XDeriveDataTypeable -XTypeSynonymInstances -XFlexibleInstances -XMultiParamTypeClasses --make Main.hs -o Main

test: Main
	make fowler.test
	make fowlerAssign.test
	make fowlerDoubles.test
	make fowlerWrongAssign.test
	make fowlerWrongReturn.test

%.test: Main
	./Main testsuite/$*.joos log
	diff testsuite/$*.correct log
	rm -f log

clean:
	rm -f *.o *.hi Main log
