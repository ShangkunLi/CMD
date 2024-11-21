clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o 2mm.bc -c 2mm.c
llvm-dis 2mm.bc -o 2mm.ll
