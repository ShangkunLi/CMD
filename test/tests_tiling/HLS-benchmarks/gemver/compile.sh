clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o gemver.bc -c gemver.cpp
llvm-dis gemver.bc -o gemver.ll
