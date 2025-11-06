CC=gcc
CFLAGS=-g -O3 -fstrict-aliasing -ftree-vectorize -fopenmp-simd \
 -march=native -mtune=native -mprefer-vector-width=256 \
 -fopt-info-vec-optimized -fopt-info-vec-missed

stream_triad: main.o timestep.o timer.o
	$(CC) $(CFLAGS) -o $@ $^ -lm


all: timestep_opt1 timestep_opt2 timestep_opt3

timestep_opt1: main.o timestep_opt1.o timer.o
	$(CC) $(CFLAGS) -o $@ $^ -lm

timestep_opt2: main.o timestep_opt2.o timer.o
	$(CC) $(CFLAGS) -o $@ $^ -lm

timestep_opt3: main.o timestep_opt3.o timer.o
	$(CC) $(CFLAGS) -fno-trapping-math -fno-math-errno -o $@ $^ -lm

clean:
	rm -rf ./stream_triad ./stream_triad.o ./timer.o ./main.o ./timestep.o