clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o latnrm.bc -c latnrm.c
llvm-dis latnrm.bc -o latnrm.ll
