# Week 6 – Parallel Computing Assignment  

---

# Liquid doesnt work

<img width="835" height="147" alt="Screenshot from 2025-11-06 16-13-28" src="https://github.com/user-attachments/assets/12e3f87a-671e-4503-988e-a11e41ce6e92" />

# Used perf instead

<img width="831" height="829" alt="Screenshot from 2025-11-06 16-32-27" src="https://github.com/user-attachments/assets/de903ccd-ab87-4b1d-a74b-600882634eaf" />


---

## Performance Results

I ran all three versions with perf to measure cycles, instructions, cache references, and cache misses.

| Version       | Cycles        | Instructions  | IPC  | Cache References | Cache Misses | Time (s) |
|---------------|--------------|---------------|------|-----------------|--------------|-----------|
| opt1          | 1,565,823,633 | 869,298,024   | 0.56 | 9,173,913       | 7,096,235    | 0.477    |
| opt2          | 1,576,021,771 | 866,728,117   | 0.55 | 9,529,773       | 7,438,906    | 0.480    |
| opt3          | 1,641,815,229 | 865,735,832   | 0.53 | 9,518,510       | 7,519,421    | 0.501    |

---
### Explanation of the Assignment and Results

The goal of this assignment was to improve the timestep calculation in Example_03 by applying vectorization, which lets the CPU perform multiple calculations at the same time instead of one by one. The assignment asked to make three versions of the code:  

1. **`timestep_opt1.c`** – basic vectorization hints  
2. **`timestep_opt2.c`** – better vectorization with improvements like restrict and private reductions  
3. **`timestep_opt3.c`** – final version with compiler flags (-fno-trapping-math -fno-math-errno) to allow more aggressive vectorization  

I compiled and ran all three versions and measured performance with perf. All versions give the correct minimum timestep, so the program works properly. The performance numbers are slightly different, but that’s expected because:  

- Vectorization lets the CPU do multiple calculations at once.  
- This program is small, so the CPU spends more time reading data from memory than doing calculations.  
- Even with vectorization, the runtime may not improve much for small tests.  

The key takeaway is that I successfully applied vectorization to the timestep code and learned how to check if loops are vectorized and measure their performance.

---
