project(segger_rtt)

file(GLOB_RECURSE PROJECT_SOURCES CONFIGURE_DEPENDS "src/*.c*")

# Remove warnings from libraries sources
# set_source_files_properties(
#     PROPERTIES
#     COMPILE_FLAGS "-w"
# )

add_library(${PROJECT_NAME} STATIC
    ${PROJECT_SOURCES}
)

target_include_directories(${PROJECT_NAME} PUBLIC
    inc
)

message(STATUS "Library sources: ${PROJECT_SOURCES}")
message(STATUS "Include path: ${THIS_PATH}/inc")

add_custom_target(rtt
    COMMAND JLinkGDBServer -device ${DEVICE} -nohalt -if SWD -speed 4000 -port 2331 -vd -singlerun -timeout 0 -nogui > /dev/null &
    COMMAND JLinkRTTClient
)
