# kernel=kernel.bc
kernel_unroll=*_unroll.bc
# opt -load ../../build/src/libgenDFGPass.so -genDFGPass ${kernel}
opt -load ../../build/src/libgenDFGPass.so -genDFGPass ${kernel_unroll}
