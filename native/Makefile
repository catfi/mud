PROJECT_DIR=$(CURDIR)/..

CC=g++
INCLUDE_DIR=${PROJECT_DIR}/include
COMPILE_FLAGS=-std=c++0x -fPIC -g

TEMP_DIR=tmp

all: Input IndexableString
	rm -rf ${TEMP_DIR}

IndexableString: before-build IndexableString.cpp 
	${CC} -c IndexableString.cpp -o ${TEMP_DIR}/IndexableString.o -I${INCLUDE_DIR} ${COMPILE_FLAGS}

Input: before-build Input.cpp
	${CC} -c Input.cpp -o ${TEMP_DIR}/Input.o -I${INCLUDE_DIR} ${COMPILE_FLAGS}

before-build:
	mkdir -p tmp
