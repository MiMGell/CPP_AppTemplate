config ?= release 

PROJECT = App

CXX = clang++
CXX_FLAGS_debug = --std=c++20 -Wall -D DEBUG -g
CXX_FLAGS_release = --std=c++20 -Wall -D NDEBUG -O3
CXX_FLAGS = $(CXX_FLAGS_$(config))

INC_DIR = -I ./vendor/vcpkg/installed/**/include
LIB_DIR = -L ./vendor/vcpkg/installed/**/lib
LIBS = -lShell32

SRC_DIR = ./src
OBJ_DIR = ./obj
TARGET = ./bin/$(PROJECT)

SOURCES = $(wildcard $(SRC_DIR)/*.cpp $(SRC_DIR)/**/*.cpp)
OBJECTS = $(SOURCES:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%_$(config).obj)

all = $(TARGET)

$(OBJ_DIR)/%_$(config).obj: $(SRC_DIR)/%.cpp
	$(CXX) $(CXX_FLAGS) -c $< -o $@ $(INC_DIR)

$(TARGET): $(OBJECTS)
	$(CXX) -target x86_64-linux-gnu $(CXX_FLAGS) $^ -o $@ $(LIB_DIR) $(LIBS)

help:
	@echo ------- Application -------
	@echo make config=[debug,release]
	@echo ---------------------------
	@echo config.debug   = "--std=c++20 -Wall -DDEBUG -g"
	@echo config.release = "--std=c++20 -Wall -DNEBUG -O3"

clean-comp:
	rm -rf ./obj/*.obj ./obj/**/*.obj

clean-binary:
	rm -rf ./bin/**