clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o manyarrays.bc -c manyarrays.cpp
llvm-dis manyarrays.bc -o manyarrays.ll
