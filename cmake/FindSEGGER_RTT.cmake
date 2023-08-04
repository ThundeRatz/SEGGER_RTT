set(SEGGERT_RTT_PATH .lib/SEGGER_RTT)

list(APPEND LIB_SOURCES
    ${SEGGERT_RTT_PATH}/src/SEGGER_RTT_printf.c
    ${SEGGERT_RTT_PATH}/src/SEGGER_RTT_Syscalls_GCC.c
    ${SEGGERT_RTT_PATH}/src/SEGGER_RTT.c
)

list(APPEND LIB_SOURCES
    ${SEGGERT_RTT_PATH}/inc
)

add_custom_target(rtt
    COMMAND JLinkGDBServer -device ${DEVICE} -nohalt -if SWD -speed 4000 -port 2331 -vd -singlerun -timeout 0 -nogui > /dev/null &
    JLinkRTTClient
)
