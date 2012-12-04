PROJECT_ROOT              = $(CURDIR)/..
INCLUDE_DIRS              = -I$(PROJECT_ROOT)/include -I$(THORSCRIPT_BUNDLE_SRC)
LIB_DIR                   = $(PROJECT_ROOT)/lib
TEMP_DIR                  = tmp

CC        = gcc
CXX       = g++
DEBUG     = -g
CFLAGS    =
CXXFLAGS  = -std=c++0x -fPIC
LFLAGS    =
AR        = ar
RM        = rm

OBJS     = $(TEMP_DIR)/Input.o $(TEMP_DIR)/IndexableString.o $(TEMP_DIR)/NativeThreadInput.o
OBJLIB   = $(LIB_DIR)/libmud.a

.PHONY: before-build
.PHONY: clean



all: $(OBJLIB)
	$(MAKE) clean

$(OBJLIB): $(OBJS)
	$(AR) -r $(OBJLIB) $(OBJS)

$(TEMP_DIR)/IndexableString.o: IndexableString.cpp
	$(MAKE) before-build
	$(CXX) -c IndexableString.cpp -o $(TEMP_DIR)/IndexableString.o $(INCLUDE_DIRS) $(CXXFLAGS) $(DEBUG)

$(TEMP_DIR)/Input.o: Input.cpp
	$(MAKE) before-build
	$(CXX) -c Input.cpp -o $(TEMP_DIR)/Input.o $(INCLUDE_DIRS) $(CXXFLAGS) $(DEBUG)

$(TEMP_DIR)/NativeThreadInput.o: NativeThreadInput.cpp
	$(MAKE) before-build
	$(CXX) -c NativeThreadInput.cpp -o $(TEMP_DIR)/NativeThreadInput.o $(INCLUDE_DIRS) $(CXXFLAGS) $(DEBUG)

before-build:
	mkdir -p $(TEMP_DIR)
	mkdir -p $(LIB_DIR)

clean:
	$(RM) -rf $(TEMP_DIR)
