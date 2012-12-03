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

SOURCE_EXT = cpp
OBJECT_EXT = o
LIB_EXT    = a

OBJS     = $(TEMP_DIR)/Input.$(OBJECT_EXT) $(TEMP_DIR)/IndexableString.$(OBJECT_EXT)
OBJLIB   = $(LIB_DIR)/libmud.$(LIB_EXT)

.PHONY: before-build
.PHONY: clean



all: $(OBJLIB)
	$(MAKE) clean

$(OBJLIB): $(OBJS)
	$(AR) -r $(OBJLIB) $(OBJS)

$(TEMP_DIR)/IndexableString.$(OBJECT_EXT): IndexableString.$(SOURCE_EXT)
	$(MAKE) before-build
	$(CXX) -c IndexableString.$(SOURCE_EXT) -o $(TEMP_DIR)/IndexableString.$(OBJECT_EXT) -I$(INCLUDE_DIR) $(CXXFLAGS) $(DEBUG)

$(TEMP_DIR)/Input.$(OBJECT_EXT): Input.$(SOURCE_EXT)
	$(MAKE) before-build
	$(CXX) -c Input.$(SOURCE_EXT) -o $(TEMP_DIR)/Input.$(OBJECT_EXT) -I$(INCLUDE_DIR) $(CXXFLAGS) $(DEBUG)

before-build:
	mkdir -p $(TEMP_DIR)
	mkdir -p $(LIB_DIR)

clean:
	$(RM) -rf $(TEMP_DIR) 
