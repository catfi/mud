PROJECT_ROOT              = $(CURDIR)/..
INCLUDE_DIRS              = -I$(PROJECT_ROOT)/native/include -I$(THORSCRIPT_BUNDLE_SRC)
SRC_DIR                   = $(PROJECT_ROOT)/native/src
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

OBJS     = $(TEMP_DIR)/Input.o $(TEMP_DIR)/IndexableString.o $(TEMP_DIR)/NativeThreadInput.o $(TEMP_DIR)/Sleep.o
OBJLIB   = $(LIB_DIR)/libmud.a

.PHONY: before-build
.PHONY: clean



all: $(OBJLIB)
	$(MAKE) clean

$(OBJLIB): $(OBJS)
	$(AR) -r $(OBJLIB) $(OBJS)

$(TEMP_DIR)/Input.o: $(SRC_DIR)/Input.cpp
	$(MAKE) before-build
	$(CXX) -c $< -o $@ $(INCLUDE_DIRS) $(CXXFLAGS) $(DEBUG)

$(TEMP_DIR)/IndexableString.o: $(SRC_DIR)/IndexableString.cpp
	$(MAKE) before-build
	$(CXX) -c $< -o $@ $(INCLUDE_DIRS) $(CXXFLAGS) $(DEBUG)

$(TEMP_DIR)/NativeThreadInput.o: $(SRC_DIR)/NativeThreadInput.cpp
	$(MAKE) before-build
	$(CXX) -c $< -o $@ $(INCLUDE_DIRS) $(CXXFLAGS) $(DEBUG)

$(TEMP_DIR)/Sleep.o: $(SRC_DIR)/Sleep.cpp
	$(MAKE) before-build
	$(CXX) -c $< -o $@ $(INCLUDE_DIRS) $(CXXFLAGS) $(DEBUG) -pthread

$(TEMP_DIR)/util.o: $(SRC_DIR)/util.cpp
	$(MAKE) before-build
	$(CXX) -c $< -o $@ $(INCLUDE_DIRS) $(CXXFLAGS) $(DEBUG)

before-build:
	mkdir -p $(TEMP_DIR)
	mkdir -p $(LIB_DIR)

clean:
	$(RM) -rf $(TEMP_DIR)
