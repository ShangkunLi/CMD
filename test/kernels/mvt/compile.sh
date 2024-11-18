clang -emit-llvm -O3 -fno-unroll-loops -fno-vectorize -o mvt.bc -c mvt.c
llvm-dis mvt.bc -o mvt.ll
opt --loop-unroll --unroll-count=4 mvt.bc -o mvt_unroll.bc
llvm-dis mvt_unroll.bc -o mvt_unroll.ll
