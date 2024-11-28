clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o trVecAccum.bc -c trVecAccum.cpp
llvm-dis trVecAccum.bc -o trVecAccum.ll
