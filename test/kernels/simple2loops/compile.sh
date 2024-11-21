clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o simple2loops.bc -c simple2loops.c
llvm-dis simple2loops.bc -o simple2loops.ll