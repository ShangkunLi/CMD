clang -emit-llvm -O3 -fno-unroll-loops -fno-builtin-memcpy -fno-vectorize -o gpt2-reduction-sum.bc -c gpt2-reduction-sum.cpp
llvm-dis gpt2-reduction-sum.bc -o gpt2-reduction-sum.ll
opt --loop-unroll --unroll-count=2 gpt2-reduction-sum.bc -o gpt2-reduction-sum-unroll.bc
llvm-dis gpt2-reduction-sum-unroll.bc -o gpt2-reduction-sum-unroll.ll
