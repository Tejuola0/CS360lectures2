GHC ?= ghc
GHC_FLAGS = -Wall -Werror -O0
BUILD_DIR = .build
DEMO = $(BUILD_DIR)/demo
TESTS = $(BUILD_DIR)/tests

.PHONY: all clean demo ghci test

all: test

$(DEMO): Demo.hs Examples.hs
	mkdir -p $(BUILD_DIR)/demo-obj
	$(GHC) $(GHC_FLAGS) --make Demo.hs -outputdir $(BUILD_DIR)/demo-obj -o $@

$(TESTS): Tests.hs Examples.hs
	mkdir -p $(BUILD_DIR)/test-obj
	$(GHC) $(GHC_FLAGS) --make Tests.hs -outputdir $(BUILD_DIR)/test-obj -o $@

demo: $(DEMO)
	./$(DEMO)

test: $(TESTS)
	./$(TESTS)

ghci:
	ghci $(GHC_FLAGS) Examples.hs

clean:
	rm -rf $(BUILD_DIR)
