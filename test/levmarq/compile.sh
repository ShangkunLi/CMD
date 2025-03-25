clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o levmarq.bc -c levmarq.cpp
llvm-dis levmarq.bc -o levmarq.ll
