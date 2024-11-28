clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o correlation.bc -c correlation.c
llvm-dis correlation.bc -o correlation.ll
