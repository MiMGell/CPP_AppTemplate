config ?= release 

PROJECT = App

CXX = clang++
CXX_FLAGS_debug = -Wall -DDEBUG -g
CXX_FLAGS_release = -Wall -DNDEBUG -O3
CXX_FLAGS = $(CXX_FLAGS_$(config))

INC_DIR = -I ./vcpkg/installed/**/include 
LIB_DIR = -L ./vcpkg/installed/**/lib
LIBS = -lShell32

SRC_DIR = ./src
OBJ_DIR = ./obj
TARGET = ./bin/$(PROJECT).exe

SOURCES = $(wildcard $(SRC_DIR)/*.cpp $(SRC_DIR)/**/*.cpp)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.obj)

all = $(TARGET)

$(OBJ_DIR)/%.obj: $(SRC_DIR)/%.cpp
	$(CXX) $(CXX_FLAGS) -c $< -o $@ $(INC_DIR)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXX_FLAGS) $^ -o $@ $(LIB_DIR) $(LIBS)

clean:
	rm -rf ./obj/*.obj