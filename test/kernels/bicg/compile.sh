clang -emit-llvm -O3 -fno-unroll-loops -o bicg.bc -c bicg.c
llvm-dis bicg.bc -o bicg.ll
