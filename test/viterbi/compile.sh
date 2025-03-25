clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o viterbi.bc -c viterbi.c
llvm-dis viterbi.bc -o viterbi.ll
