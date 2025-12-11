# GPU architectures and concepts & GPU

**CUDA Error**  
During the CUDA run, I encountered the following error:

<img width="770" height="832" alt="Screenshot from 2025-12-11 15-30-08" src="https://github.com/user-attachments/assets/088ae53c-c1ad-4362-a5f0-e757a3054504" />

The CUDA program failed to produce correct results because the system does not have an NVIDIA GPU, which is required to run CUDA programs. CUDA is designed to utilize the GPU for parallel computation, and without a compatible NVIDIA GPU, the program cannot perform the necessary calculations, leading to errors in the output.

**OpenMP Error**  
During the OpenMP run, I encountered the following error:

<img width="971" height="295" alt="Screenshot from 2025-12-11 15-23-08" src="https://github.com/user-attachments/assets/8af86544-c35f-4d9e-8202-cee6402ba068" />

This error was caused by the use of an unrecognized command-line option -qthreaded in the Makefile. The -qthreaded flag is specific to the Intel compiler and is not supported by the default GCC compiler, which is installed on the system. The error message suggests using the -pthread option instead.

**OpenACC**  
During the OpenACC run, I got this results:

<img width="770" height="832" alt="Screenshot from 2025-12-11 15-48-23" src="https://github.com/user-attachments/assets/0b380d3d-1c97-4187-864d-b2d591f591fb" />

During the execution of the OpenACC-based StreamTriad benchmark, multiple parallelized versions of the kernel were tested. Each kernel showed a similar average runtime for the stream triad operation, ranging from approximately 0.0407 to 0.0412 seconds. These results suggest that the parallelization using OpenACC was successful, but the performance improvement was modest, likely due to the simplicity of the StreamTriad operation and the nature of the system's CPU or available GPU resources.

**OpenCL Error**  
During the OpenMP run, I encountered the following error:

<img width="766" height="275" alt="Screenshot from 2025-12-11 15-52-00" src="https://github.com/user-attachments/assets/ddcb3ac2-0d5a-4fb9-83b1-f0c674471e4c" />

This error happened because the system couldn't find or use an OpenCL device (like a GPU). The most likely reason is that the OpenCL software or drivers are not set up correctly, or the system doesn't have a compatible GPU to run OpenCL on. Without a GPU, OpenCL can't start properly.

**OpenACC on Lab PC**  
During the OpenACC run on ssh lab pc, I got this results:

<img width="742" height="489" alt="image" src="https://github.com/user-attachments/assets/8a178c42-5c84-4f69-9321-24b007482afd" />

The OpenACC benchmark was successfully executed on the remote machine, and the performance of the StreamTriad operation was measured under various configurations. Below are the average runtimes for each configuration:

StreamTriad: 0.022503 seconds

StreamTriad_kern1: 0.022445 seconds

StreamTriad_kern2: 0.022413 seconds

StreamTriad_kern3: 0.022602 seconds

StreamTriad_par1: 0.022477 seconds

StreamTriad_par2: 0.022585 seconds

StreamTriad_par3: 0.022455 seconds

StreamTriad_par4: 0.022617 seconds

As shown in the terminal output, the execution of the OpenACC-based program was successful without errors. The times for all variations of the StreamTriad loop are very close to each other, indicating efficient parallel execution across the different configurations. The system handled the computation well, and the minor differences in runtime suggest that different parallelization techniques (kernels and loops) have a similar impact on performance for this benchmark.

**OpenACC: Local vs Remote Machine**

On the local PC, the OpenACC benchmark showed average runtimes between 0.0407 and 0.0412 seconds. This indicates that parallelization was effective, but the performance improvements were modest, likely due to limited hardware resources, such as the absence of a dedicated GPU.

On the remote lab machine, the runtimes were faster, ranging from 0.0224 to 0.0226 seconds. This suggests better performance, likely due to stronger hardware, such as a more capable CPU or GPU.

The remote lab machine was approximately 2x faster than the local PC for the OpenACC benchmark. The performance gap is likely due to the lab machine’s superior hardware resources.
