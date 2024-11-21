clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o mvt.bc -c mvt.c
llvm-dis mvt.bc -o mvt.ll
