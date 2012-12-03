PROJECT_ROOT = $(CURDIR)
NATIVE_DIR   = $(PROJECT_ROOT)/native

.PHONY: native
.PHONY: thorsript
.PHONY: s
.PHONY: c


all: thorscript

test: thorscript
	tsc run test

s: thorscript
	tsc run server_main --transport="tcp://*:1234" -s 

c: thorscript
	tsc run client_main --transport="tcp://0.0.0.0:1234" -c

thorscript: native
	tsc build debug

native:
	$(MAKE) -C $(NATIVE_DIR)

