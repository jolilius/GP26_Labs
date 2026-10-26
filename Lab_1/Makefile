
NVCC        = nvcc
NVCC_FLAGS  = -O3 -arch=sm_90
LD_FLAGS    = -lcudart
EXE	        = device-query
OBJ	        = main.o

default: $(EXE)

main.o: main.cu
	$(NVCC) -c -o $@ main.cu $(NVCC_FLAGS)

$(EXE): $(OBJ)
	$(NVCC) $(OBJ) -o $(EXE) $(LD_FLAGS)

clean:
	rm -rf *.o $(EXE)
