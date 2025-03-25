# CMD
This repository contains the whole compilation and performance evaluation stack.

You can run the CMD compilation framework and performance simulator by building this repo.

## 1 Prerequisites
LLVM `10.0.0`
CMake `3.22.1`
Clang `10.0.0`
GNU Make `4.3`

## 2 Build the project
Clone this repository.
```
git clone https://github.com/ShangkunLi/CMD.git
```

Create the cmake files.
```
cd CMD
mkdir build && cd build
cmake ..
```

Build the project.
```
make
```

## 3 Run the compiler and simulator
Take `2mm` as an example.

Compile the source code to get the LLVM IR.
```
cd ${WORK_REPO}/CMD/test/2mm
bash compile.sh
```
You can get the LLVM IR `2mm.ll` in your current directory.

Modify the input parameter file `param.json` to set your input. Take the `${WORK_REPO}/CMD/test/2mm/param.json` as an example.
```
{
  "kernel"                : "kernel_2mm",
  "targetFunction"        : false,
  "targetNested"          : false,
  "targetLoopsID"         : [0],
  "doCGRAMapping"         : false,      // Set it as 'true' for mapping and simulation, 'false' for DFG Generation
  "row"                   : 6,      // Define a CGRA with 6 rows
  "column"                : 6,      // Define a CGRA with 6 columns
  "precisionAware"        : false,
  "heterogeneity"         : false,
  "isTrimmedDemo"         : true,
  "heuristicMapping"      : true,       // Use the heuristic mapping algorithm
  "parameterizableCGRA"   : false,
  "diagonalVectorization" : false,
  "bypassConstraint"      : 4,      // Set the number of bypass buffers
  "isStaticElasticCGRA"   : false,
  "ctrlMemConstraint"     : 25,     // Set the size of the control memory in each tile
  "regConstraint"         : 8,      // Set the number of register sets
  "optLatency"            : {
                              "load" : 1,
                              "store": 2
                            },      // Set the latency of different operations
  "optPipelined"          : ["load", "store"],
  "additionalFunc"        : {},
  "incrementalMapping"    : false,
  "supportMemory"         : true,       // 'true' to support the CMD CGRA, 'false' to support the conventional CGRA
  "clusterSize"           : 6,      // Cluster size
  "memorySize"            : 7168,       // Memory unit size in bytes
  "memoryArchitectureRefinement" : false        // 'true' to enable architecture DSE
}
```

Simulate the benchmark on this CGRA.
```
bash run.sh
```
