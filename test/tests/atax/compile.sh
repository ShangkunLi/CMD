clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o atax.bc -c atax.c
llvm-dis atax.bc -o atax.ll
