
# LIBDRIVER

aux_source_directory(
    STM32F4xx_HAL_Driver/Src 
    LIBDRIVER_SRC_LIST)
add_library(${LIBDRIVER} ${LIBDRIVER_SRC_LIST})
target_include_directories(${LIBDRIVER} 
    PUBLIC ${PROJECT_INC_LIST})
