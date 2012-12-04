build = clang++ -g -O3 toy.cpp `llvm-config --cppflags --ldflags --libs core`

run:
	make inc.run
	make trivialConstantFolding.run
	make constantFolding.run

include ../Makefile.common

