#lang racket

(require rackunit)
(require rackunit/text-ui)
(require (prefix-in strict: "mceval.rkt"))
(require (prefix-in lazy: "lazy-mceval.rkt"))

(define ignored-argument-program
  '(begin
     (define marker false)
     ((lambda (unused) marker)
      (begin
        (set! marker true)
        marker))))

(define sharing-program
  '(begin
     (define log '())
     (define (twice x)
       (cons x (cons x '())))
     (define result
       (twice
        (begin
          (set! log (cons true log))
          true)))
     (cons result (cons log '()))))

(define saved-environment-program
  '((lambda (outer)
      ((lambda (delayed)
         ((lambda (outer) delayed) 'inner))
       outer))
    'saved))

(define unused-divergence-program
  '(begin
     (define (loop) (loop))
     ((lambda (unused) 'finished) (loop))))

(define (strict-run exp)
  (strict:mceval exp (strict:setup-environment)))

(define (lazy-run exp)
  (lazy:actual-value exp (lazy:setup-environment)))

(define evaluator-tests
  (test-suite
   "Lecture 7 strict/lazy evaluator comparison"

   (test-case "strict evaluator evaluates an ignored argument"
     (check-equal? (strict-run ignored-argument-program) #t))

   (test-case "lazy evaluator does not evaluate an ignored argument"
     (check-equal? (lazy-run ignored-argument-program) #f))

   (test-case "call-by-need shares a twice-demanded argument"
     (check-equal? (lazy-run sharing-program)
                   '((#t #t) (#t))))

   (test-case "a thunk uses its saved lexical environment"
     (check-equal? (lazy-run saved-environment-program) 'saved))

   (test-case "an unused divergent argument is not demanded"
     (check-equal? (lazy-run unused-divergence-program) 'finished))))

(module+ main
  (exit (run-tests evaluator-tests)))
