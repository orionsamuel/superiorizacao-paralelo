NVCC=nvcc
CUDA_FLAGS = -Xcompiler -fopenmp -I include -arch=sm_37
EXECUTABLE = exec

all: clean $(EXECUTABLE)

$(EXECUTABLE): functions.o tabu.o main.o
	$(NVCC) $(CUDA_FLAGS) -o build/$(EXECUTABLE) main.o tabu.o functions.o 

main.o: src/main.cu
	$(NVCC) $(CUDA_FLAGS) -c src/main.cu

tabu.o: src/tabu.cu include/tabu.hpp 
	$(NVCC) $(CUDA_FLAGS) -c src/tabu.cu

functions.o: src/functions.cu include/functions.hpp include/utils.hpp
	$(NVCC) $(CUDA_FLAGS) -c src/functions.cu

clean:
	rm -f *.o
	rm -f build/$(EXECUTABLE)
	rm -f build/out.txt
