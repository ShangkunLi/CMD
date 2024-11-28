clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o seidel-2d.bc -c seidel-2d.c
llvm-dis seidel-2d.bc -o seidel-2d.ll

