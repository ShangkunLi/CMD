clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o doitgen.bc -c doitgen.c
llvm-dis doitgen.bc -o doitgen.ll
