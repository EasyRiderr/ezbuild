local_src :=
local_inc :=

EXTRA_CFLAGS := -w

ifdef CONFIG_SAY_HI
  local_src += say_hi.c
endif

local_inc += $(subdirectory)

$(eval $(call add_rules,\
              $(local_inc),\
              $(subdirectory),\
              $(local_src),\
              $(EXTRA_CFLAGS)))
