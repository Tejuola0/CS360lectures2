.PHONY: all clean diff demo lazy-repl strict-repl test

all: test

clean:
	rm -rf compiled

diff:
	@diff -u mceval.rkt lazy-mceval.rkt || [ $$? -eq 1 ]

demo:
	racket demo.rkt

strict-repl:
	racket -tm mceval.rkt

lazy-repl:
	racket -tm lazy-mceval.rkt

test:
	racket tests.rkt
