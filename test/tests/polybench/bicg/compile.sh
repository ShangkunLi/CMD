clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o bicg.bc -c bicg.c
llvm-dis bicg.bc -o bicg.ll
