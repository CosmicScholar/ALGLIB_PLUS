
CC = g++

INC_DIR = ../../src
LIB_DIR = ../../lib
interp1d: $(INC_DIR)/*.h obj
	$(CC) -o interp1d  splin_interp_1d.o $(LIB_DIR)/alglib.a 

obj: *.cpp 
	$(CC) -c  splin_interp_1d.cpp -I$(INC_DIR)

clean:
	rm *.o