local_src :=
local_inc :=

EXTRA_CFLAGS :=

ifdef CONFIG_ADD
  local_src += add.c
endif

ifdef CONFIG_ADD_2
  local_src += add_2.c
endif

local_inc += $(subdirectory)

$(eval $(call add_rules,\
              $(local_inc),\
              $(subdirectory),\
              $(local_src),\
              $(EXTRA_CFLAGS)))
