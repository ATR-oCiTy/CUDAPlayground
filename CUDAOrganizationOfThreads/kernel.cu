
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include "stdio.h"

__global__ void print_details() {

	printf("threadIdx.x : %d, threadIdx.y : %d, threadIdx.z : %d \nblockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d \nblockDim.x : %d, blockDim.y : %d \ngridDim.x : %d, gridDim.y : %d \n\n", 
		threadIdx.x, threadIdx.y, threadIdx.z, blockIdx.x, blockIdx.y, blockIdx.z, blockDim.x, blockDim.y, gridDim.x, gridDim.y);
}

int main() {
	int nx, ny;
	nx = 16;
	ny = 16;

	dim3 block(8, 8);
	dim3 grid(nx / block.x, ny / block.y);

	print_details << <grid, block >> > ();
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;
}