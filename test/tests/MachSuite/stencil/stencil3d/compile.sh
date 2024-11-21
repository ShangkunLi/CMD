clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o stencil.bc -c stencil.c
llvm-dis stencil.bc -o stencil.ll
