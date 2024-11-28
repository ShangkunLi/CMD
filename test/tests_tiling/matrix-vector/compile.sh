clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o matrix-vector1.bc -c matrix-vector1.cpp
llvm-dis matrix-vector1.bc -o matrix-vector1.ll

# opt --loop-unroll --unroll-count=2 manyarrays3.bc -o manyarrays3_unroll.bc
# llvm-dis manyarrays3_unroll.bc -o manyarrays3_unroll.ll
