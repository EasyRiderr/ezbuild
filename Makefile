# The Makefile files are initially inspired by:
# https://www.oreilly.com/library/view/managing-projects-with/0596006101/ch06.html

# $(subdirectory) will be used by included rules.mk files to get there current
# path. For example in the maths_func/sub/rules.mk file, the $(subdirectory)
# variable will be read as "maths_func/sub"
subdirectory = $(patsubst %/rules.mk,%,                        \
                 $(word                                        \
                   $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))

# $(my_dir_name) will be used by included rules.mk files to get there current
# directory name.
# For example the file maths_func/add/rules.mk will have a my_dir_name value
# equal to "add"
my_dir_name = $(notdir $(patsubst %/,%,$(subdirectory)))


# Collect information from each module in these four variables.
# Initialize them here as simple variables.
modules      := $(subst ./,,$(subst /rules.mk,,$(shell find . -name rules.mk)))
programs     :=
sources      :=
libraries    :=

exec_name := try_me

objects      = $(subst .c,.o,$(sources))
dependencies = $(subst .c,.d,$(sources))

include_dirs :=
CPPFLAGS     += $(addprefix -I,$(include_dirs))

MV  := mv -f
RM  := rm -f
SED := sed

# We must read the include files before the all target is defined.
# The include modules contain targets, the first of which will be considered
# the default goal. To work through this dilemma, we can specify the all
# target with no prerequisites, source the include files, then add the
# prerequisites to all later.
all:

# Automatically include rules.mk files
include $(addsuffix /rules.mk,$(modules))

.PHONY: all
all: $(programs) $(dependencies)
	$(CC) -o $(exec_name) $(objects)

.PHONY: libraries
libraries: $(libraries)

.PHONY: clean
clean:
	$(RM) $(objects) $(programs) $(libraries) $(dependencies)

ifneq "$(MAKECMDGOALS)" "clean"
	include $(dependencies)
endif

%.c %.h: %.y
	$(YACC.y) --defines $<
	$(MV) y.tab.c $*.c
	$(MV) y.tab.h $*.h

%.d: $(sources)
	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -M $< | \
		$(SED) 's,\($(notdir $*)\.o\) *:,$(dir $@)\1 $@: ,' > $@.tmp
	$(MV) $@.tmp $@
