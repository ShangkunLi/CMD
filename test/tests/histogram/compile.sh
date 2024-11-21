clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o histogram.bc -c histogram.cpp
llvm-dis histogram.bc -o histogram.ll