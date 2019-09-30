THIS_PATH := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

C_INCLUDES +=                                                          \
	-I$(THIS_PATH)/inc                                                 \

LIB_SOURCES += $(shell find $(THIS_PATH) -name "*.c")

undefine THIS_PATH

# Specifies if this lib is being used
USE_RTT_LIB := 1

# Start Debug Session
rtt:
	$(AT)JLinkGDBServer -device $(DEVICE) -nohalt -if SWD -speed 4000 -port 2331 -vd -singlerun -timeout 0 -nogui > /dev/null &
	$(AT)JLinkRTTClient
