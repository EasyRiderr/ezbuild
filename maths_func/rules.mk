local_src :=
local_inc :=

ifdef CONFIG_MUL
  local_src += mul.c
endif

local_inc += $(subdirectory)

$(eval $(call add_rules,$(local_inc),$(subdirectory),$(local_src)))
