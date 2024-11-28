clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o manyarrays3.bc -c manyarrays3.cpp
llvm-dis manyarrays3.bc -o manyarrays3.ll

opt --loop-unroll --unroll-count=2 manyarrays3.bc -o manyarrays3_unroll.bc
llvm-dis manyarrays3_unroll.bc -o manyarrays3_unroll.ll
