clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o fft.bc -c fft.c
llvm-dis fft.bc -o fft.ll
