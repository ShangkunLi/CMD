clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o conv.bc -c conv.c
llvm-dis conv.bc -o conv.ll
opt --loop-unroll --unroll-count=4 conv.bc -o conv_unroll.bc
llvm-dis conv_unroll.bc -o conv_unroll.ll
