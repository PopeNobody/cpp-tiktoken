# Compiler
CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -pedantic

# Include directories
INCLUDES := -I.

# Source files
SRCS := byte_pair_encoding.cc \
        emdedded_resource_reader.cc \
        modelparams.cc \
        encoding.cc \
        encoding_utils.cc \
        pcre2_regex.cc

# Object files
OBJS := $(SRCS:.cc=.o)

# Output library
TARGET := libtiktoken.a

# External libraries
LIBS := -lpcre2-8

# Build target
$(TARGET): $(OBJS)
	$(AR) rcs $@ $^

# Compile source files into object files
%.o: %.cc
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean up build artifacts
.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET)

# Copy tokenizer files to the build directory
.PHONY: copy_tokenizers
copy_tokenizers:
	mkdir -p tokenizers
	cp o200k_base.tiktoken cl100k_base.tiktoken p50k_base.tiktoken r50k_base.tiktoken tokenizers/
