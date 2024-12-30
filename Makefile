# Compiler and flags
CXX = g++
# CXXFLAGS = -O2 -std=c++11 -Wall
CXXFLAGS = -O2 -std=c++11
LDFLAGS = 
LDLIBS = -lm

# Application name
APP = apf

# Source files
SOURCES = apf.cpp solve.cpp Plotting.cpp cmdLine.cpp Report.cpp utils.cpp helper.cpp Timer.cpp

# Object files (inside build directory)
BUILD_DIR = build
OBJECTS = $(addprefix $(BUILD_DIR)/, $(SOURCES:.cpp=.o))

# Default target
all: $(BUILD_DIR) $(APP)

# Create the build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Build the application
$(APP): $(OBJECTS)
	$(CXX) $(LDFLAGS) -o $@ $(OBJECTS) $(LDLIBS)

# Rule to build object files in the build directory
$(BUILD_DIR)/%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up build artifacts
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR) $(APP)