#lang racket

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

(define (strict-run exp)
  (strict:mceval exp (strict:setup-environment)))

(define (lazy-run exp)
  (lazy:actual-value exp (lazy:setup-environment)))

(printf "Ignored argument (strict): ~s\n"
        (strict-run ignored-argument-program))
(printf "Ignored argument (lazy):   ~s\n"
        (lazy-run ignored-argument-program))
(printf "Twice-demanded argument (lazy): ~s\n"
        (lazy-run sharing-program))
