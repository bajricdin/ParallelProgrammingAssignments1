
### Graph Explanation
Graph shows that execution time rises when number of elements increases from 1K to 10M. Large data takes longer to initialize when comparing to less data because of higher memory usage. Because I used AoSoA layout to store data, CPU access data more efficiently using cache and vecotrization which makes time grow smoothly instead of linearly, because data is stored next to each other which makes reading and writing data faster especially when dataset is bigger.

---

### Graph

<img width="706" height="375" alt="Screenshot from 2025-10-23 15-30-21" src="https://github.com/user-attachments/assets/e399d268-d386-4b9c-a03d-570a72265d24" />

**Link of the spreadsheet:** https://docs.google.com/spreadsheets/d/1sg4-vvgEMsv23llZdO6A2Qfi29FnQ9HAHyXtc2vKfYI/edit?usp=sharing

---

### Code explanation
SoA_type *AoSoA = new SoA_type[num_blocks];
**This line of code creates an array in memory to store rgb values.**

AoSoA[j].R[i] = rand();
AoSoA[j].G[i] = rand();
AoSoA[j].B[i] = rand();
**These lines fill each element with random values**

delete[] AoSoA;
**This frees up the memory after finisihing**

TARGET_SRC = aosoa_measurement.cpp
**This line is added in makefile to select source cpp file.**
