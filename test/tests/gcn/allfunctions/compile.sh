clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o main.bc -c main.cpp
llvm-dis main.bc -o main.ll
