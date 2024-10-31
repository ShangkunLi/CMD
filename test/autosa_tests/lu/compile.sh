clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o kernel.bc -c kernel.c
llvm-dis kernel.bc -o kernel.ll