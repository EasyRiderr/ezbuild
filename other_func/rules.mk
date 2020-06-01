local_src :=
local_inc :=

$(eval $(call add_rules,$(local_inc),$(subdirectory),$(local_src)))
