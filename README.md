# ParallelProgrammingAssignments
First I initilized ipos and ival to avoid uninitilized values error. After that I checked if malloc succseeded in recegonizing the null or undefined behaviour.
After that i changed the loop conditions from i <= 10 to i<10 to prevent out of bounds error. And at the end i freed allocated memory so it prevents memory leaks.


(base) student@itcenter-lab128:~/Desktop/din$ make valgrind
valgrind --leak-check=full --show-leak-kinds=all ./main
==136631== Memcheck, a memory error detector
==136631== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==136631== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
==136631== Command: ./main
==136631== 
==136631== Invalid write of size 4
==136631==    at 0x1091C6: main (main.c:7)
==136631==  Address 0x4a9e068 is 0 bytes after a block of size 40 alloc'd
==136631==    at 0x4848899: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
==136631==    by 0x109185: main (main.c:5)
==136631== 
==136631== Conditional jump or move depends on uninitialised value(s)
==136631==    at 0x1091F4: main (main.c:9)
==136631== 
==136631== Invalid read of size 4
==136631==    at 0x1091EF: main (main.c:9)
==136631==  Address 0x4a9e068 is 0 bytes after a block of size 40 alloc'd
==136631==    at 0x4848899: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
==136631==    by 0x109185: main (main.c:5)
==136631== 
==136631== 
==136631== HEAP SUMMARY:
==136631==     in use at exit: 40 bytes in 1 blocks
==136631==   total heap usage: 1 allocs, 0 frees, 40 bytes allocated
==136631== 
==136631== 40 bytes in 1 blocks are definitely lost in loss record 1 of 1
==136631==    at 0x4848899: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
==136631==    by 0x109185: main (main.c:5)
==136631== 
==136631== LEAK SUMMARY:
==136631==    definitely lost: 40 bytes in 1 blocks
==136631==    indirectly lost: 0 bytes in 0 blocks
==136631==      possibly lost: 0 bytes in 0 blocks
==136631==    still reachable: 0 bytes in 0 blocks
==136631==         suppressed: 0 bytes in 0 blocks
==136631== 
==136631== Use --track-origins=yes to see where uninitialised values come from
==136631== For lists of detected and suppressed errors, rerun with: -s
==136631== ERROR SUMMARY: 14 errors from 4 contexts (suppressed: 0 from 0)



after fix: 
(base) student@itcenter-lab128:~/Desktop/din$ make valgrind
gcc -Wall -g -o main main.c
valgrind --leak-check=full --show-leak-kinds=all ./main
==137769== Memcheck, a memory error detector
==137769== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==137769== Using Valgrind-3.18.1 and LibVEX; rerun with -h for copyright info
==137769== Command: ./main
==137769== 
Found value at position: -1
==137769== 
==137769== HEAP SUMMARY:
==137769==     in use at exit: 0 bytes in 0 blocks
==137769==   total heap usage: 2 allocs, 2 frees, 1,064 bytes allocated
==137769== 
==137769== All heap blocks were freed -- no leaks are possible
==137769== 
==137769== For lists of detected and suppressed errors, rerun with: -s
==137769== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
