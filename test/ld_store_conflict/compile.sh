clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o conflict.bc -c conflict.cpp
llvm-dis conflict.bc -o conflict.ll
opt --loop-unroll --unroll-count=4 conflict.bc -o conflict_unroll.bc
llvm-dis conflict_unroll.bc -o conflict_unroll.ll
