local_src :=
local_inc :=

EXTRA_CFLAGS :=

$(eval $(call add_rules,\
              $(local_inc),\
              $(subdirectory),\
              $(local_src),\
              $(EXTRA_CFLAGS)))
