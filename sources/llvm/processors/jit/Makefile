build = clang++ -g toy.cpp `llvm-config --cppflags --ldflags --libs core jit native` -O3

run:
	make trivialConstantFolding.run
	make constantFolding.run

include ../Makefile.common

