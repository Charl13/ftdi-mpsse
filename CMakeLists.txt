cmake_minimum_required(VERSION 3.9)

project(ftdi-mpsse VERSION 0.1.0 DESCRIPTION "Fork of the FTDI MPSSE library.")

add_library(ftdi-mpsse STATIC
    ftdi_common.c
    ftdi_infra.c
    ftdi_mid.c
    ftdi_i2c.c
    ftdi_spi.c
)

if(WIN32) 
    set(FTD2XX_DRIVER_DIR include/windows)
elseif(APPLE)
    set(FTD2XX_DRIVER_DIR include/osx)
else()
    set(FTD2XX_DRIVER_DIR include/linux)
endif()

target_include_directories(ftdi-mpsse PRIVATE ${FTD2XX_DRIVER_DIR})
