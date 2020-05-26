# Perform sub directories rules.mk include here to allow local_variables
# overriding

local_dir  := maths_func/sub
local_lib  := $(local_dir)/sub.a

local_src :=

local_src += sub.c

local_src  := $(addprefix $(local_dir)/,$(local_src))
local_objs := $(subst .c,.o,$(local_src))

libraries  += $(local_lib)
sources    += $(local_src)

$(local_lib): $(local_objs)
	@echo
	$(AR) $(ARFLAGS) $@ $^

programs += $(local_lib)
