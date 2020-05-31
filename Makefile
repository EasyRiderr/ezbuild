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


# The directory where compiled files will be stored
build_dir := build


# Collect information from each module in these four variables.
# Initialize them here as simple variables.
modules := $(subst ./,,$(subst /rules.mk,,$(shell find . -name rules.mk)))
programs :=
sources :=
libraries :=
dirs :=

exec_name := try_me

objects :=
dependencies = $(subst .o,.d,$(objects))

include_dirs :=
CFLAGS += $(addprefix -I,$(include_dirs))

MV := mv -f
RM := rm -rf
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
all: $(dirs) $(build_dir)/$(exec_name)

$(build_dir)/$(exec_name): $(objects)
	$(CC) $^ -o $@

$(objects): $(build_dir)/%.o : %.c | $(dirs)
	@echo "Compile $< and store it in $@"
	$(CC) $(CFLAGS) -MP -MD -c $< -o $@

$(dirs):
	@mkdir -p $@

.PHONY: libraries
libraries: $(libraries)

.PHONY: clean
clean:
	$(RM) $(build_dir)

ifneq "$(MAKECMDGOALS)" "clean"
  -include $(dependencies)
endif
