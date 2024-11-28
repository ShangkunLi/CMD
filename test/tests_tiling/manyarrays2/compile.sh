clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o manyarrays2.bc -c manyarrays2.cpp
llvm-dis manyarrays2.bc -o manyarrays2.ll
