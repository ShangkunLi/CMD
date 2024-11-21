clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o symm.bc -c symm.c
llvm-dis symm.bc -o symm.ll
