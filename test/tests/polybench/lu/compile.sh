clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o lu.bc -c lu.c
llvm-dis lu.bc -o lu.ll
