
# cross compile flag
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# processor flags
set(CPU  "-mcpu=cortex-m4")
set(FPU  "-mfpu=fpv4-sp-d16")
set(FLOAT-ABI  "-mfloat-abi=hard")
set(MCU  "${CPU} -mthumb ${FPU} ${FLOAT-ABI}")
## gcc flag
set(PROJECT_FLAGS "${MCU} -Wall -Wshadow -fno-builtin -fdata-sections -ffunction-sections")
# debug flag
set(DBGOPT "-gdwarf-2 -Og")
# library flag
set(LIB "-lc -lm -lnosys")
# other flag
set(LINKOPT "-Wl,-Map=target.map,--cref -Wl,--gc-sections")

# compiler
set(CMAKE_ASM_COMPILER ${TOOLCHAIN_ROOT}/bin/arm-none-eabi-gcc.exe) # -x assembler-with-cpp
set(CMAKE_ASM_FLAGS_DEBUG "${PROJECT_FLAGS} ${DBGOPT}") 
set(CMAKE_ASM_FLAGS_RELEASE "${PROJECT_FLAGS} -O3")

set(CMAKE_C_COMPILER ${TOOLCHAIN_ROOT}/bin/arm-none-eabi-gcc.exe)
set(CMAKE_C_FLAGS_DEBUG "${PROJECT_FLAGS} ${DBGOPT}")
set(CMAKE_C_FLAGS_RELEASE "${PROJECT_FLAGS} -O3")
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_CXX_COMPILER ${TOOLCHAIN_ROOT}/bin/arm-none-eabi-g++.exe)
set(CMAKE_CXX_FLAGS_DEBUG "${PROJECT_FLAGS} ${DBGOPT}")
set(CMAKE_CXX_FLAGS_RELEASE "${PROJECT_FLAGS} -O3")
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_EXE_LINKER_FLAGS "-specs=nosys.specs -T${CMAKE_CURRENT_SOURCE_DIR}/STM32F407IGTx_FLASH.ld ${LIB} ${LINKOPT}")

# other tools
set(CMAKE_OBJCOPY ${TOOLCHAIN_ROOT}/bin/arm-none-eabi-objcopy.exe)
set(CMAKE_OBJDUMP ${TOOLCHAIN_ROOT}/bin/arm-none-eabi-objdump.exe)
set(CMAKE_SIZE ${TOOLCHAIN_ROOT}/bin/arm-none-eabi-size.exe)
set(CMAKE_DEBUGER ${TOOLCHAIN_ROOT}/bin/arm-none-eabi-gdb.exe)
set(CMAKE_CPPFILT ${TOOLCHAIN_ROOT}/bin/arm-none-eabi-c++filt.exe)

# find library
message(STATUS TOOLCHAIN_ROOT:${TOOLCHAIN_ROOT})
set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_ROOT})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# output type and destination
set(CMAKE_BUILD_TYPE Release)
set(PROJECT_BINARY_DIR ${PROJECT_SOURCE_DIR}/build)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})

