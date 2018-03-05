all: test

clean:
	rm -rf build

build:
	mkdir build

build/bootchart.o: build src/bootchart.c Makefile
	gcc -I ./src -flto -O2 -g -c src/bootchart.c -o build/bootchart.o

build/log.o: build src/log.c Makefile
	gcc -I ./src -flto -O2 -g -c src/log.c -o build/log.o

build/systemd-bootchart: build/bootchart.o build/log.o
	gcc -flto -g -Wl,--gc-sections \
	  build/bootchart.o build/log.o \
          -o build/systemd-bootchart

test: build/systemd-bootchart
	/usr/lib/rpm/debugedit build/systemd-bootchart
