clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o bf.bc -c bf_test.c
llvm-dis bf.bc -o bf.ll
