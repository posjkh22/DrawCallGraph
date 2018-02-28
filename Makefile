
output 			= 	DrawCallGraph
output_bitcode	=	testcase.bc
target_code		=	testcase5-6.c

run:
	./$(output) $(output_bitcode) > reader_out

#dot -Tpng graph.dot > output.png

all: clean foo
	clang++ -std=c++11 ReadBitCode.cpp -o $(output) \
	`llvm-config --cxxflags --libs --ldflags --system-libs`

foo:
	clang -S -emit-llvm -o $(output_bitcode) -c $(target_code)

clean:
	rm -f reader *.ll *.bc *.dot
