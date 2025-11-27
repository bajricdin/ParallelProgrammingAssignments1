# MPI: The parallel backbone Assignment7

# Implementation Logic

**int base = ncells / nprocs;
int remainder = ncells % nprocs;
int nsize = (rank < remainder) ? base + 1 : base;**
This logic calculates the workload for each process dynamically, ensuring that if the total array size (10,000) does not divide evenly by the number of processes (e.g., 8), the "remainder" elements are distributed fairly to the first few ranks so no data is lost.


**MPI_Allgather(&nsize, 1, MPI_INT, nsizes, 1, MPI_INT, comm);**
Before the data can be distributed, the root process needs to know exactly how many elements every other process expects to receive, so MPI_Allgather is used to share the local nsize variable with every other process in the communicator.


**MPI_Scatterv(a_global, nsizes, offsets, MPI_DOUBLE, 
             a_local, nsize, MPI_DOUBLE, 0, comm);**
I used MPI_Scatterv instead of the standard MPI_Scatter because it accepts the nsizes and offsets arrays, allowing us to send different amounts of data to each process based on the load balancing logic.


**MPI_Reduce(&local_sum, &total_sum, 1, MPI_DOUBLE, MPI_SUM, 0, comm);**
This collective communication routine efficiently aggregates the local_sum calculated by every individual process and sums them up into the total_sum variable on Rank 0, replacing the need for manual send/receive loops.


**mpirun --oversubscribe -n 8 ./PartialSum** 
I had to use the --oversubscribe flag when running with 4 and 8 processes because the physical lab machine has fewer CPU cores than requested, so this flag forces MPI to time-slice the processes on the available hardware.


## Final Results:
  Total sum across all processes: 50005000.00
The final result of 50,005,000.00 was consistent across 2, 4, and 8 processes, verifying that the dynamic load balancing and collective communication logic functioned correctly.

## Screenshot
<img width="853" height="821" alt="Screenshot from 2025-11-27 16-11-32" src="https://github.com/user-attachments/assets/80bcdefd-563b-4842-98c1-926bf5a1f374" />

