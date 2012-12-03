PROJECT_DIR=$(CURDIR)

all: native thorscript

thorscript:
	tsc build debug

native:
	cd native
	make
	cd ${PROJECT_DIR}

