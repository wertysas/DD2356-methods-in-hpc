
all: serialsum ompsum criticalsum localsum localsumpadded

serialsum: serialsum.c
	cc -O2 -fopenmp -o serialsum serialsum.c -lm

ompsum: ompsum.c
	cc -O2 -fopenmp -o ompsum ompsum.c -lm

criticalsum: criticalsum.c
	cc -O2 -fopenmp -o criticalsum criticalsum.c -lm

localsum: localsum.c
	cc -O2 -fopenmp -o localsum localsum.c -lm

localsumpadded: localsumpadded.c
	cc -O2 -fopenmp -o localsumpadded localsumpadded.c -lm

