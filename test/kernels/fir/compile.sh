clang -emit-llvm -fno-unroll-loops -O3 -fno-vectorize -o fir.bc -c fir.cpp
llvm-dis fir.bc -o fir.ll
opt --loop-unroll --unroll-count=4 fir.bc -o fir_unroll.bc
llvm-dis fir_unroll.bc -o fir_unroll.ll
