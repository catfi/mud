PROJECT_ROOT = $(CURDIR)/..
INCLUDE_DIR  = $(PROJECT_ROOT)/include
LIB_DIR      = $(PROJECT_ROOT)/lib
TEMP_DIR     = tmp

CC        = gcc
CXX       = g++
DEBUG     = -g
CFLAGS    =
CXXFLAGS  = -std=c++0x -fPIC
LFLAGS    = 
AR        = ar
RM        = rm

OBJS     = $(TEMP_DIR)/Input.o $(TEMP_DIR)/IndexableString.o
OBJLIB   = $(LIB_DIR)/libmud.a

.PHONY: before-build
.PHONY: clean



all: $(OBJLIB)
	$(MAKE) clean

$(OBJLIB): $(OBJS)
	$(AR) -r $(OBJLIB) $(OBJS)

$(TEMP_DIR)/IndexableString.o: IndexableString.cpp
	$(MAKE) before-build
	$(CXX) -c IndexableString.cpp -o $(TEMP_DIR)/IndexableString.o -I$(INCLUDE_DIR) $(CXXFLAGS) $(DEBUG)

$(TEMP_DIR)/Input.o: Input.cpp
	$(MAKE) before-build
	$(CXX) -c Input.cpp -o $(TEMP_DIR)/Input.o -I$(INCLUDE_DIR) $(CXXFLAGS) $(DEBUG)

before-build:
	mkdir -p $(TEMP_DIR)
	mkdir -p $(LIB_DIR)

clean:
	$(RM) -rf $(TEMP_DIR) 
