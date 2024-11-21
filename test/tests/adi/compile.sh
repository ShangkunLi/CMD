clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o adi.bc -c adi.c
llvm-dis adi.bc -o adi.ll
