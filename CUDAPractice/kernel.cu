
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include "stdio.h"

__global__ void hello_cuda() {
	printf("Hello CUDA world \n");
}

int main() {
	
	int nx, ny, nz;
	nx = 16;
	ny = 4;
	nz = 1;

	dim3 block(8, 2, 1);
	dim3 grid(nx/block.x, ny/block.y, nz/block.z);

	hello_cuda << <grid, block >> > (); //Async function call
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;
}
