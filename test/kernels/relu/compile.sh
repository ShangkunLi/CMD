clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o relu.bc -c relu.c
llvm-dis relu.bc -o relu.ll
# opt-12 --loop-unroll --unroll-count=4 kernel.bc -o kernel_unroll.bc
# llvm-dis-12 kernel_unroll.bc -o kernel_unroll.ll
