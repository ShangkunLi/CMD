#
# ======================================================================
# CMakeLists.txt
# ======================================================================
# CMakeLists for mapper pass.
#
# Author : Cheng Tan
#  Date : July 16, 2019
#

add_library(genDFGPass MODULE
    # List your source files here.
    DFGNode.cpp
    DFGEdge.cpp
    DFG.cpp
    DataMemNode.cpp
    genDFGPass.cpp
    CGRA.cpp
    CGRALink.cpp
    CGRANode.cpp
    CGRAMem.cpp
    Mapper.cpp
    json.hpp
)

# Use C++11 to compile our pass (i.e., supply -std=c++11).
#if (NOT CMAKE_VERSION VERSION_LESS 3.1)
#  target_compile_features(mapperPass PRIVATE cxx_range_for cxx_auto_type)
#endif ()

# LLVM is (typically) built with no C++ RTTI. We need to match that;
# otherwise, we'll get linker errors about missing RTTI data.
set_target_properties(genDFGPass PROPERTIES
    COMPILE_FLAGS "-fno-rtti"
)


# Get proper shared-library behavior (where symbols are not necessarily
# resolved when the shared library is linked) on OS X.
if(APPLE)
    set_target_properties(genDFGPass PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
    )
endif(APPLE)
