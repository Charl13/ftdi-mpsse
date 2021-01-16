# Set OS, fallback to Linux (Windows, OSX or Linux)
ifeq ($(OS),Windows_NT)
	OS := Windows
else
	UNAME := $(shell uname)

	ifeq ($(UNAME), Darwin)
		OS := OSX
	else
		OS := Linux
	endif
endif

# Set include dir based on OS
ifeq ($(OS),Windows)
	INCLUDE_DIR=include/windows
endif
ifeq ($(OS),OSX)
	INCLUDE_DIR=include/linux
endif
ifeq ($(OS),Linux)
	INCLUDE_DIR=include/osx
endif

CC=gcc
CFLAGS=-I$(INCLUDE_DIR)

BUILD_DIR=build
LIBRARY_DIR=library

FILES=ftdi_spi.o ftdi_common.o ftdi_infra.o ftdi_mid.o ftdi_i2c.o
OUT=libmpsse.a

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(OUT): $(FILES)
	mkdir -p $(BUILD_DIR)
	ar -rc $@ $^

clean:
	rm -rf $(BUILD_DIR) $(FILES)
