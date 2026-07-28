STACK ?= stack

.PHONY: all build ghci test

all: build

build:
	$(STACK) build --test --no-run-tests

ghci:
	$(STACK) ghci

test:
	$(STACK) test
