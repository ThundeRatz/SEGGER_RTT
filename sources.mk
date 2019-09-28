THIS_PATH := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

C_INCLUDES +=                                                          \
	-I$(THIS_PATH)/inc                                                 \

LIB_SOURCES += $(shell find $(THIS_PATH) -name "*.c")

undefine THIS_PATH

# Specifies if this lib is being used
USE_RTT_LIB := 1
