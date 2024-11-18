clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o gemm.bc -c gemm.c
llvm-dis gemm.bc -o gemm.ll
opt --loop-unroll --unroll-count=4 gemm.bc -o gemm_unroll.bc
llvm-dis gemm_unroll.bc -o gemm_unroll.ll
