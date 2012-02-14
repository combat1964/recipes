CC=gcc
CFLAGS=-std=c99 -Wall -c -Wc++-compat -O3
LIBS=-lX11 -lGL
DEMOS=ClipPlanes DeepOpacity Raycast VoronoiPicking DistanceField FresnelGlass
SHARED=glew.o pez.o bstrlib.o

run: VoronoiPicking
	./VoronoiPicking

all: $(DEMOS)

VoronoiPicking: VoronoiPicking.o VoronoiPicking.glsl $(SHARED)
	$(CC) $@.o $(SHARED) -o $@ $(LIBS)

ClipPlanes: ClipPlanes.o ClipPlanes.glsl $(SHARED)
	$(CC) $@.o $(SHARED) -o $@ $(LIBS)

DeepOpacity: DeepOpacity.o DeepOpacity.glsl $(SHARED) Smoke96.pbo
	$(CC) $@.o $(SHARED) -o $@ $(LIBS)

Raycast: Raycast.o Raycast.glsl $(SHARED) Smoke96.pbo
	$(CC) $@.o $(SHARED) -o $@ $(LIBS)

.c.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf *.o $(DEMOS)
