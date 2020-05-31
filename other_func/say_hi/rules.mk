local_src :=
local_inc :=

ifdef CONFIG_SAY_HI
  local_src += say_hi.c
endif

local_inc += $(subdirectory)

local_src  := $(addprefix $(subdirectory)/,$(local_src))
local_objs := $(addprefix $(build_dir)/,$(subst .c,.o,$(local_src)))

sources    += $(local_src)
include_dirs += $(local_inc)
objects += $(local_objs)
dirs += $(addprefix $(build_dir)/,$(subdirectory))
