clang -emit-llvm -O3 -fno-unroll-loops -o dtw.bc -c dtw.cpp
llvm-dis dtw.bc -o dtw.ll
# opt --loop-unroll --unroll-count=4 dtw.bc -o dtw_unroll.bc
# #clang-12 -emit-llvm -O3 -fno-unroll-loops -Rpass-analysis=loop-vectorize -o kernel.bc -c fft.c
# llvm-dis dtw_unroll.bc -o dtw_unroll.ll
