clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o 3mm.bc -c 3mm.c
llvm-dis 3mm.bc -o 3mm.ll
