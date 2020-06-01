local_src :=
local_inc :=

EXTRA_CFLAGS :=

local_src += sub.c

local_inc += $(subdirectory)

$(eval $(call add_rules,\
              $(local_inc),\
              $(subdirectory),\
              $(local_src),\
              $(EXTRA_CFLAGS)))
