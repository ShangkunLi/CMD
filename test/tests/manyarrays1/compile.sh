clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o manyarrays1.bc -c manyarrays1.cpp
llvm-dis manyarrays1.bc -o manyarrays1.ll
