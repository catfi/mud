PROJECT_ROOT = $(CURDIR)
NATIVE_DIR   = $(PROJECT_ROOT)/native

.PHONY: native
.PHONY: thorsript

all: thorscript

thorscript: native
	tsc build debug

native:
	$(MAKE) -C $(NATIVE_DIR)

