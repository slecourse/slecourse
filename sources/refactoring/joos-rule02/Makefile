all:
	make test

Main:
	ghc -XDeriveDataTypeable -XTypeSynonymInstances -XFlexibleInstances -XMultiParamTypeClasses --make Main.hs -o Main

test: Main
	make introduce-fine.test
	make introduce-wrong-def.test
	make eliminate-fine.test
	make eliminate-wrong.test
	make extract-fine.test
	make extract-wrong-assign.test
	make extract-wrong-return.test

%.test: Main
	./Main testsuite/$*.joos log
	diff testsuite/$*.correct log

clean:
	rm -f *.o *.hi Main
