PROJECT_ROOT = $(CURDIR)
NATIVE_DIR   = $(PROJECT_ROOT)/native

.PHONY: t
.PHONY: s
.PHONY: c
.PHONY: debug
.PHONY: release
.PHONY: native


all: debug

t:
	tsc run test

s:
	tsc run server_entry --domain=st --transport="tcp://*:1234" -s

c:
	tsc run client_entry --domain=st --transport="tcp://0.0.0.0:1234" -c

debug: native
	tsc build debug

release: native
	tsc build release

native:
	$(MAKE) -C $(NATIVE_DIR)

