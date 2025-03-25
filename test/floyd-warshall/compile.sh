clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o floyd-warshall.bc -c floyd-warshall.c
llvm-dis floyd-warshall.bc -o floyd-warshall.ll
