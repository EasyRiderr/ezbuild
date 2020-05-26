# Perform sub directories rules.mk include here to allow local_variables
# overriding

local_dir  := maths_func/add
local_lib  := $(local_dir)/add.a

local_src :=

local_src += add.c
local_src += add_2.c

local_src  := $(addprefix $(local_dir)/,$(local_src))
local_objs := $(subst .c,.o,$(local_src))

libraries  += $(local_lib)
sources    += $(local_src)

include_dirs += $(local_dir)

$(local_lib): $(local_objs)
	@echo
	$(AR) $(ARFLAGS) $@ $^

programs += $(local_lib)
