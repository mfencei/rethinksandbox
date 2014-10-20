# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := seccomp_tests
DEFS_Default :=

# Flags passed to all source files.
CFLAGS_Default :=

# Flags passed to only C files.
CFLAGS_C_Default :=

# Flags passed to only C++ files.
CFLAGS_CC_Default :=

INCS_Default := \
	-I$(srcdir)/. \
	-I$(obj).$(TOOLSET)/$(TARGET)/geni/seccomp-sandbox

OBJS := \
	$(obj).target/$(TARGET)/reference_trusted_thread.o \
	$(obj).target/$(TARGET)/tests/clone_test_helper.o \
	$(obj).target/$(TARGET)/tests/syscall_via_int0.o \
	$(obj).target/$(TARGET)/tests/test_runner.o \
	$(obj).target/$(TARGET)/tests/test_patching.o \
	$(obj).target/$(TARGET)/tests/test_patching_input.o \
	$(obj).target/$(TARGET)/tests/test_syscalls.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/libseccomp_sandbox.a

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.S FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.S FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.S FORCE_DO_CMD
	@$(call do_cmd,cc,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Default :=

LIBS := \
	-lpthread \
	-lutil

$(builddir)/seccomp_tests: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/seccomp_tests: LIBS := $(LIBS)
$(builddir)/seccomp_tests: LD_INPUTS := $(OBJS) $(obj).target/libseccomp_sandbox.a
$(builddir)/seccomp_tests: TOOLSET := $(TOOLSET)
$(builddir)/seccomp_tests: $(OBJS) $(obj).target/libseccomp_sandbox.a FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/seccomp_tests
# Add target alias
.PHONY: seccomp_tests
seccomp_tests: $(builddir)/seccomp_tests

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/seccomp_tests
