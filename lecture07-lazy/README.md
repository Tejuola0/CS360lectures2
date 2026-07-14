# Lecture 7: Strict and Lazy Evaluators

This directory contains two runnable evaluators built from the same minimal
metacircular-evaluator baseline:

- `mceval.rkt` evaluates procedure arguments before application.
- `lazy-mceval.rkt` delays compound-procedure arguments and uses call-by-need:
  the first demand computes a value and later demands share it.

Note that `delay-it` and `force-it` in the lazy evaluator are internal evaluator
operations, *not* the object-language `delay` and `force` from Homework
4.

## Start with the diff

Run:

```console
make diff
```

The files are intentionally aligned so that the diff emphasizes five ideas:

1. Application demands the operator but passes operand expressions and the
   current environment to `mcapply`.
2. Primitive procedures demand their arguments; compound procedures bind
   delayed arguments.
3. An `if` predicate must be demanded before choosing a branch.
4. When first demanded, a thunk evaluates its saved expression and remembers
   the result for later demands.
5. The read-evaluate-print loop demands the value it displays.

These are the same demand points and thunk lifecycle traced in lecture. Most of
the evaluator is unchanged.

## Run the examples

```console
make demo
make test
```

The demo first shows an ignored argument: the strict evaluator performs its
side effect before the call, while the lazy evaluator never demands it. It then
shows a lazy argument used twice whose side effect happens only once.

To experiment at either evaluator's prompt, run:

```console
make strict-repl
make lazy-repl
```

Press Control-D to leave a prompt.

Use these files for comparison, not as Homework 3 or Homework 4 starter code.
Homework 4 adds programmer-directed promises to an otherwise strict evaluator;
`lazy-mceval.rkt` instead changes the evaluator's policy for ordinary procedure
arguments.
