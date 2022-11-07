
#  LIBCORE

aux_source_directory(Src LIBCORE_SRC_LIST)
add_library(${LIBCORE} ${LIBCORE_SRC_LIST})
target_include_directories(${LIBCORE} 
    PUBLIC ${PROJECT_INC_LIST})
