# OpenMP that performs

## Execution Results

| Program | Threads | Total Time (ms) |
|----------|----------|----------------|
| stencil_opt2 | 4 | 221.283 |
| stencil_opt4 | 4 | 224.313 |
| stencil_opt6 | 4 | 224.776 |

## Analysis

**1. Threads Used**

Each program executed using 4 threads.

**2. Improved code parts and strategies:**  

Optimized initialization and stencil loops using OpenMP parallel for.  
Applied memory first touch and reduced barriers where possible.  
Used conditional thread execution (if thread_id==0) to reduce overhead.

**3. Barriers**

**Implicit Barrier:** Automatically occurs at the end of each omp for loop. It forces all threads to wait before continuing.

**Explicit Barrier:** Manually inserted using #pragma omp barrier. It ensures synchronization when needed.

In **stencil_opt4**, nowait removes some implicit barriers to reduce synchronization costs.

These examples had implicit barriers in parallel loops.


## Screenshot

<img width="835" height="956" alt="Screenshot from 2025-11-13 15-35-35" src="https://github.com/user-attachments/assets/90c12c3a-89cd-4b07-b9aa-92b01ea0bb85" />






