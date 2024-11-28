clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o gemm.bc -c gemm.c
llvm-dis gemm.bc -o gemm.ll
