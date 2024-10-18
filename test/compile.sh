file=*.cpp
for f in $file; do
  kernel=${f%.*}
done
clang -emit-llvm -fno-unroll-loops -O3 -o ${kernel}.bc -c ${file}
llvm-dis ${kernel}.bc -o ${kernel}.ll
