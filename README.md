# Batch schedulers

**Top command during execition of sh files**
<img width="736" height="844" alt="Screenshot from 2025-12-18 16-14-36" src="https://github.com/user-attachments/assets/76e63688-ce47-473f-9a52-0930807d3640" />

This screenshot shows the system’s resource usage while executing the sh scripts. It displays CPU, memory, and process information. We can see how the system allocates resources to running jobs and which processes consume the most CPU and memory. The top command helps to understand resource consumption during parallel execution of the batch jobs.

**Results after running stress test** 

<img width="758" height="298" alt="Screenshot from 2025-12-18 16-19-38" src="https://github.com/user-attachments/assets/dd9e1ccb-42f9-441b-a8a1-85da627ee6e0" />

The screenshot shows the output after running the stress test on 4 CPU cores. The test successfully utilized the requested number of cores, demonstrating how SLURM schedules and allocates resources for parallel tasks. The system was under heavy load for 60 seconds, using all available CPU cores for computation.

**Screenshot of terminal after running squque for few times during execution of sh files**
<img width="736" height="844" alt="Screenshot from 2025-12-18 16-14-30" src="https://github.com/user-attachments/assets/a9132de1-a3cf-4986-b2ea-fd2e2d0c5844" />

This screenshot shows the output of the squeue command, which lists the jobs in the queue. You can observe the jobs in the "Running" (R) and "Pending" (PD) states. Pending jobs are waiting for resources (e.g., CPU or memory), while running jobs are actively using those resources. This helps understand how SLURM schedules jobs and handles resource allocation for multiple tasks.

**Summary**

In this assignment, SLURM was used to manage and schedule batch jobs, with the compute.sh and overload.sh scripts run to test system performance. The top command was utilized to monitor CPU and memory usage during execution, showing how system resources were allocated to running tasks. Stress tests were performed on 2 and 4 CPU cores to observe the system's behavior under load. The squeue command was used to track the job queue, displaying jobs in Running and Pending states, demonstrating how SLURM efficiently schedules jobs and handles resource allocation. These tests confirmed SLURM's ability to manage multiple tasks and balance system resources effectively.

