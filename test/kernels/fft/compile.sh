clang -emit-llvm -O3 -fno-unroll-loops -o fft.bc -c fft.c
llvm-dis fft.bc -o fft.ll
opt --loop-unroll --unroll-count=4 fft.bc -o fft_unroll.bc
#clang-12 -emit-llvm -O3 -fno-unroll-loops -Rpass-analysis=loop-vectorize -o kernel.bc -c fft.c
llvm-dis fft_unroll.bc -o fft_unroll.ll
