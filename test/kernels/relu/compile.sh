clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o relu.bc -c relu.c
llvm-dis relu.bc -o relu.ll
opt --loop-unroll --unroll-count=4 relu.bc -o relu_unroll.bc
llvm-dis relu_unroll.bc -o relu_unroll.ll
