CXX := g++
CXXFLAGS := -std=c++20 -g -O0 -Wall -Wextra
BUILD_DIR := build
BIN := $(BUILD_DIR)/$(basename $(notdir $(SRC)))

.PHONY: help run build clean watch

help:
	@echo "make run SRC=arquivo.cpp"
	@echo "make watch SRC=arquivo.cpp"

$(BIN): $(SRC)
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $< -o $@

build: $(BIN)

run: build
	./$(BIN) $(ARGS)

clean:
	rm -rf $(BUILD_DIR)

watch:
	@if ! command -v entr >/dev/null 2>&1; then \
		echo "instale entr"; \
		exit 1; \
	fi
	@if [ -z "$(SRC)" ]; then \
		echo "Defina SRC=..."; \
		exit 1; \
	fi
	@dir=$$(dirname $(SRC)); \
	{ \
	  echo $(SRC); \
	  [ -d $$dir ] && find $$dir -maxdepth 1 -type f \( -name '*.h' -o -name '*.hpp' \) 2>/dev/null; \
	} | sort -u | \
	entr -c sh -c '$(MAKE) run SRC=$(SRC) ARGS="$(ARGS)"'
