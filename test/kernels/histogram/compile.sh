clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o histogram.bc -c histogram.cpp
llvm-dis histogram.bc -o histogram.ll
opt --loop-unroll --unroll-count=4 histogram.bc -o histogram_unroll.bc
llvm-dis histogram_unroll.bc -o histogram_unroll.ll
