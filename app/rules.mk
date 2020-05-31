local_src :=
local_inc :=

local_src += main.c

local_inc += $(subdirectory)

local_src  := $(addprefix $(subdirectory)/,$(local_src))
local_objs := $(addprefix $(build_dir)/,$(subst .c,.o,$(local_src)))

sources    += $(local_src)
include_dirs += $(local_inc)
objects += $(local_objs)
dirs += $(addprefix $(build_dir)/,$(subdirectory))
