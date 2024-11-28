clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o matrixadd.bc -c matrixadd.cpp
llvm-dis matrixadd.bc -o matrixadd.ll
