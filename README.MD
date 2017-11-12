
# ALGLIB+

This is a extension of [ALGLIB 3.12.0](http://www.alglib.net). ALGLIB+ will provide static liberary and some new functions which look like MATLAB function, such as interp1d, interp2d, etc.

# Background
When I use [deal.ii](https://www.dealii.org/8.4.1/doxygen/deal.II/index.html) to develop a hydrothermal system simulator, the interpolation functions must be used to calculate fluid thermal properties at each pressure and temperture point. While the original ALGLIB does not provide a static or dynamic library to invoke and the arguments of interpolation function is a string type(you can see the examples), rather than a general C++ array. But I want a much easier way to invoke the interpolation function, to this end, I must to add some new functions, which simlar with MATLAB's function, to implement to my codes.

**Therefore, ALGLIB+ is developed.**

# Compilation
ALGLIB just use the standard C++ library (that's very nice), so that makes compilation very easy. I have create a `Makefile` to do that. 
My system is MAC OS. Just change dir to ALGLIB+ dir, then use the following command: `make` to compile it. I think for the other UNIX/Linux system is similar.

# How to use
Just include the `src` dir and add link of `alglib.a`.
## Simple example
The source code of the example is in the `example` dir. The `makefile` as following.
```makefile

CC = g++

INC_DIR = ../../src
LIB_DIR = ../../lib
interp1d: $(INC_DIR)/*.h obj
	$(CC) -o interp1d  splin_interp_1d.o $(LIB_DIR)/alglib.a 

obj: *.cpp 
	$(CC) -c  splin_interp_1d.cpp -I$(INC_DIR)

clean:
	rm *.o
```

## With Deal.ii
Because the simple to use Deal.ii on Mac OS is as the example, do a little changes in the **CMakeLists.txt** to generate **Makefile**. You just use these two variables: `INCLUDE_DIRECTORIES` and `link_libraries`, to add include files and library. The cmake file just as following.

```cmake
##
#  CMake script for the step-1 tutorial program:
##

# Set the name of the project and target:
SET(TARGET "dofs_play")
INCLUDE_DIRECTORIES("/Users/kakushi/Study/Programing/ALGlib/src")
link_libraries("/Users/kakushi/Study/Programing/ALGlib/lib/alglib.a")
# Declare all source files the target consists of. Here, this is only
# the one step-X.cc file, but as you expand your project you may wish
# to add other source files as well. If your project becomes much larger,
# you may want to either replace the following statement by something like
FILE(GLOB_RECURSE TARGET_SRC  "*.cc")

SET(TARGET_SRC
  ${TARGET_SRC}
  )

# Usually, you will not need to modify anything beyond this point...

CMAKE_MINIMUM_REQUIRED(VERSION 2.8.8)

FIND_PACKAGE(deal.II 8.5.0 QUIET
  HINTS ${deal.II_DIR} ${DEAL_II_DIR} ../ ../../ $ENV{DEAL_II_DIR}
  )
IF(NOT ${deal.II_FOUND})
  MESSAGE(FATAL_ERROR "\n"
    "*** Could not locate a (sufficiently recent) version of deal.II. ***\n\n"
    "You may want to either pass a flag -DDEAL_II_DIR=/path/to/deal.II to cmake\n"
    "or set an environment variable \"DEAL_II_DIR\" that contains this path."
    )
ENDIF()

DEAL_II_INITIALIZE_CACHED_VARIABLES()
PROJECT(${TARGET})
DEAL_II_INVOKE_AUTOPILOT()

```

Then use command of `cmake .` and `make run` to run the program of deal.ii example.