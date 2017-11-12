# **********************************************
# create static and dynamic library of GLALIB
# Author: Zhikui Guo
# Date: 12.11.2017
# Version: 1.0
# **********************************************

TOP_DIR=$(PWD)
SRC_DIR = $(PWD)/src
LIB_DIR = $(TOP_DIR)/lib
OBJECT_DIR = $(TOP_DIR)/obj

# **************
CC = g++
AR = ar rc
# **************
SRC_OBJECT = $(SRC_DIR)/alglibinternal.cpp $(SRC_DIR)/dataanalysis.cpp $(SRC_DIR)/integration.cpp $(SRC_DIR)/optimization.cpp $(SRC_DIR)/statistics.cpp $(SRC_DIR)/alglibmisc.cpp $(SRC_DIR)/diffequations.cpp  $(SRC_DIR)/interpolation.cpp $(SRC_DIR)/solvers.cpp $(SRC_DIR)/ap.cpp $(SRC_DIR)/fasttransforms.cpp $(SRC_DIR)/linalg.cpp $(SRC_DIR)/specialfunctions.cpp
H_OBJECT = $(SRC_DIR)/*.h
OBJECT = alglibinternal.o dataanalysis.o integration.o optimization.o statistics.o alglibmisc.o diffequations.o  interpolation.o solvers.o ap.o fasttransforms.o linalg.o specialfunctions.o
LIB_OBJECT = alglib.a

$(LIB_OBJECT):$(OBJECT)
	$(AR) $(LIB_OBJECT) $(OBJECT)
	mv $(LIB_OBJECT) $(LIB_DIR)
	mv $(OBJECT) $(OBJECT_DIR)
$(OBJECT):$(SRC_OBJECT) $(H_OBJECT)
	$(CC) -c $(SRC_OBJECT)

clean :
	rm $(LIB_DIR)/*.*
	rm $(OBJECT_DIR)/*.o