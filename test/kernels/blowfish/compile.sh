clang -emit-llvm -O3 -fno-unroll-loops -o bf_test.bc -c bf_test.c
llvm-dis bf_test.bc -o bf_test.ll