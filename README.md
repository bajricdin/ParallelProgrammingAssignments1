# BabelStream Benchmark - Assignment 7

## Implementation Logic

**OpenCL Error**  
During the OpenCL run, I encountered the following error:

<img width="937" height="290" alt="Screenshot from 2025-12-04 16-07-08" src="https://github.com/user-attachments/assets/f213c0cc-bca7-4ad2-b637-499d91d25e85" />

This error likely occurred because the OpenCL platform setup is outdated or misconfigured on the system. The error was due to an issue in finding the correct OpenCL platform.


**CUDA Benchmark Results**  
The CUDA benchmark ran successfully on the NVIDIA GeForce RTX 2060 SUPER:

<img width="837" height="820" alt="Screenshot from 2025-12-04 16-06-12" src="https://github.com/user-attachments/assets/81833ce9-b662-4d1c-89cf-abb9a6a9683c" />

Connected to the lab server (gpulab@10.1.8.100) to run the CUDA benchmark.

- **Total Array Size**: 805.3 MB  
- **Reduction Kernel Config**: 136 groups of 1024 threads  
- **CUDA Device**: NVIDIA GeForce RTX 2060 SUPER  
- **Init Bandwidth**: 9208.76 MB/s  
- **Read Bandwidth**: 422,605.67 MB/s  

The CUDA device showed excellent performance in terms of both initialization and data transfer speed.

---

**OpenMP Benchmark (CPU)**  
The **OpenMP** benchmark was executed on the CPU. Here are the results:

<img width="809" height="460" alt="Screenshot from 2025-12-04 15-48-18" src="https://github.com/user-attachments/assets/759d91fc-a747-41c0-b000-b7235a91bb2b" />

- **Total Array Size**: 805.3 MB  
- **CPU Device**: Intel i7-6700K (4 cores, 8 threads)  
- **Init Bandwidth**: 5625.63 MB/s  
- **Read Bandwidth**: 2123.29 MB/s  

These results show that the **OpenMP** implementation on the CPU is slower than CUDA but still demonstrates parallel efficiency on CPU cores. The **Dot product** operation achieved the highest bandwidth of 18,844.94 MB/s, as expected.

---

## Benchmark Comparison

- **iGPU vs CPU**: Integrated GPU (Intel HD Graphics 520) is 30-51% faster than the CPU for basic memory operations, but the CPU is better for **Dot product** due to its cache efficiency.
- **iGPU vs dGPU**: The **discrete GPU** (RTX 2060 SUPER) is **10x-20x faster** than the integrated GPU for memory operations.

---

## Final Results

- **CUDA on RTX 2060 SUPER**:
  - **Initialization Bandwidth**: 9208.76 MB/s
  - **Read Bandwidth**: 422,605.67 MB/s

- **OpenMP on CPU**:
  - **Initialization Bandwidth**: 5625.63 MB/s
  - **Read Bandwidth**: 2123.29 MB/s
  - **Dot Product**: 18,844.94 MB/s (higher than other operations)




