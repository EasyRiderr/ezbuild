local_src :=
local_inc :=

local_src += main.c

local_inc += $(subdirectory)

$(eval $(call add_rules,$(local_inc),$(subdirectory),$(local_src)))
