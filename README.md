# Map Reduce

## Example 1

In this example, all computation is performed using a single process without parallelization. Words from every file in the dataset are read, grouped using a hash table, and counted.

Due to the dataset size and lack of parallelism, total execution time is significantly higher than in the MPI version. This implementation serves as a baseline for comparison with parallel results.

Execution time:
77.00 seconds

<img width="569" height="777" alt="Screenshot 2026-01-01 171002" src="https://github.com/user-attachments/assets/bd314a89-dadf-4ec1-b0e2-9cd6969d6a6b" />

---

## Example 2

The parallel program runs the same task using multiple MPI processes. Files are divided between processes, each process counts words independently, and at the end all partial results are combined. A hash table is used to store word counts because it allows fast updates while counting. Since the workload is shared, the program becomes faster as more processes are used. Communication between processes adds a small overhead, but the total runtime still decreases significantly compared to the sequential version.

# 2 Processes
<img width="589" height="803" alt="Screenshot 2026-01-01 171834" src="https://github.com/user-attachments/assets/f38e644d-7155-4807-8025-1992f878190c" />

# 4 Processes
<img width="529" height="784" alt="Screenshot 2026-01-01 171927" src="https://github.com/user-attachments/assets/a94ccafb-0af3-4452-866e-c3f16a03c940" />

# 8 Processes
<img width="591" height="799" alt="Screenshot 2026-01-01 172038" src="https://github.com/user-attachments/assets/1c231d7e-571f-4eff-9917-93e2365dca1c" />


---

## Comaprison between Sequential and Parallel

| Method        | Processes | Execution Time (s) |
|---------------|-----------|--------------------|
| Sequential    | 1         | 77.00             |
| Parallel      | 2         | 41.72             |
| Parallel      | 4         | 35.64             |
| Parallel      | 8         | 20.13             |

The parallel version runs much faster because multiple processes handle the dataset at the same time. The speedup increases when using more processes, up to 8 in this environment. The sequential version takes the longest since it processes everything alone. The overall improvement depends on available CPU cores and memory limits, but parallel execution clearly reduces the total time needed.

---

## Hash Table Grouping vs Sorting Grouping

We use hash tables to group words because they let us update word counts very fast (O(1)).
If we grouped by sorting first, it would take longer (O(N log N)), especially with lots of words.
So, hashing makes counting quicker and more efficient for big inputs.
