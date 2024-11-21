clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o fdtd-2d.bc -c fdtd-2d.c
llvm-dis fdtd-2d.bc -o fdtd-2d.ll
