PROJECT_DIR=$(CURDIR)

all: native thorscript

thorscript:
	tsc b d

native:
	cd native
	make
	cd ${PROJECT_DIR}

