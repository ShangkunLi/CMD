clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o fft.bc -c fft.cpp
llvm-dis fft.bc -o fft.ll
