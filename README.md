# File operations for a parallel world

## Dataset generation

Before running the examples, the dataset was generated using the provided `file_generator.c` program. It produced a large CSV file of approximately 1.1 GB. The file contains 15,000,000 records and is named `temperature_data.csv`. This dataset was used by all examples in order to obtain realistic and comparable I/O performance results. The file was generated in the root directory of the project, as required by the example implementations.

<img width="824" height="158" alt="Screenshot 2025-12-25 180704" src="https://github.com/user-attachments/assets/a858bd98-4863-45af-8dfe-2e574c82cb39" />

---

## Example 01 – Serial I/O

In this example, only rank 0 performs all file operations. Rank 0 reads the entire CSV file, distributes data using `MPI_Scatter`, gathers results using `MPI_Gather`, and writes the output using standard file I/O.

As the number of processes increases, the read time and total execution time increase significantly. This happens because rank 0 becomes a bottleneck for both memory and communication, while other processes remain idle during file I/O. This example clearly shows that serial file I/O does not scale in parallel programs.

<img width="519" height="914" alt="Screenshot 2025-12-25 181016" src="https://github.com/user-attachments/assets/d6f4868c-d3f4-4b1b-8891-f6e9649d8a17" />

---

## Example 02 – MPI-IO Independent

In this example, each process opens the input file independently, reads its own portion of the data, and writes directly to its part of a shared output file using MPI-IO. No scatter or gather operations are used.

Compared to Example 01, execution time is much lower and scales better with more processes. The workload is evenly distributed, memory usage is balanced, and the rank 0 bottleneck is removed. This demonstrates the benefit of independent parallel file I/O.

<img width="822" height="664" alt="Screenshot 2025-12-25 181301" src="https://github.com/user-attachments/assets/b14e11c6-38ba-4cbc-a10c-db695179640f" />

---

## Example 03 – MPI-IO Collective with Hints

This example uses collective MPI-IO operations together with performance hints such as collective buffering and aggregator processes. All processes coordinate file writes using `MPI_File_write_all`.

The coordinated writes reduce unstructured I/O access and improve performance consistency. On the local WSL environment, Example 02 is sometimes faster due to lower overhead. However, Example 03 is better suited for real HPC systems with parallel filesystems, where collective buffering significantly improves I/O efficiency.

<img width="855" height="636" alt="Screenshot 2025-12-25 181403" src="https://github.com/user-attachments/assets/97dc3b3f-0410-4dde-80c3-df6ebe2f7555" />

---

## Comparison of Results

The table below compares total execution time and write bandwidth for all three examples using different numbers of processes.

| Example | Processes | Total Time (s) | Write Time (s) | Write Bandwidth (MB/s) |
|-------|-----------|----------------|---------------|------------------------|
| Serial I/O | 1 | 11.09 | 0.42 | 822.60 |
| Serial I/O | 2 | 11.97 | 0.39 | 877.74 |
| Serial I/O | 4 | 17.13 | 0.44 | 772.50 |
| Serial I/O | 8 | 22.94 | 0.85 | 402.57 |
| MPI-IO Independent | 1 | 11.42 | 0.31 | 1125.35 |
| MPI-IO Independent | 2 | 6.22 | 0.40 | 855.19 |
| MPI-IO Independent | 4 | 4.81 | 0.48 | 718.83 |
| MPI-IO Independent | 8 | 4.02 | 0.84 | 406.83 |
| MPI-IO Collective | 1 | 11.07 | 0.31 | 1117.02 |
| MPI-IO Collective | 2 | 7.17 | 1.18 | 290.32 |
| MPI-IO Collective | 4 | 4.92 | 0.86 | 397.04 |
| MPI-IO Collective | 8 | 3.95 | 0.65 | 531.51 |

---

