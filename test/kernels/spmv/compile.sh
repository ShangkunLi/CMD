clang -emit-llvm -O3 -fno-unroll-loops -o spmv.bc -c spmv.c
llvm-dis spmv.bc -o spmv.ll
