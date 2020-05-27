local_lib  := $(subdirectory)/$(my_dir_name).a

local_src :=
local_inc :=

local_src += add.c
local_src += add_2.c

local_inc += $(subdirectory)

local_src  := $(addprefix $(subdirectory)/,$(local_src))
local_objs := $(subst .c,.o,$(local_src))

libraries  += $(local_lib)
sources    += $(local_src)
include_dirs += $(local_inc)

$(local_lib): $(local_objs)
	@echo
	$(AR) $(ARFLAGS) $@ $^

programs += $(local_lib)
