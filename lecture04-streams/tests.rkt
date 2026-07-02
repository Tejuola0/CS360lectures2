#lang racket
(require rackunit)
(require rackunit/text-ui)
(require "exercises.rkt")

(provide exercise-tests)

(define ones
  (stream-cons 1 ones))

(define exercise-tests
  (test-suite
   "Lecture Exercises"
   
   (test-case
    "stream-nth"
    (check-equal? (stream-nth 0 (stream 1 2 3))
                  1
                  "(stream-nth 0 (stream 1 2 3))")
    (check-equal? (stream-nth 2 (stream 1 2 3))
                  3
                  " (stream-nth 2 (stream 1 2 3))"))
   
   (test-case
    "stream-enumerate"
    (check-equal? (stream->list (stream-enumerate 5 4))
                  '()
                  "empty stream-enumerate")
    (check-equal? (stream-nth 100 (stream-enumerate 1 1000))
                  101
                  "stream-nth"))
   
   (test-case
    "stream-enumerate-from"
    (check-equal? (stream-nth 100 (stream-enumerate-from 100))
                  200
                  "stream-enumerate-from"))
   
   (test-case
    "stream-map"
    (check-equal? (stream->list (stream-map add1 empty-stream))
                  '()
                  "stream-map on empty stream")
    (check-equal? (stream->list (stream-map (lambda (x) (+ x 1)) (stream 0 1 2 3 4 5)))
                  '(1 2 3 4 5 6)
                  "stream-map")
   
    (check-equal? (stream-ref (stream-map (lambda (x) (+ x 1)) ones) 10001)
                  2
                  "stream-map on infinite stream"))
   
   (test-case
    "stream-filter"
    (check-equal? (stream->list (stream-filter odd? empty-stream))
                  '()
                  "stream-filter on empty stream")
    (check-equal? (stream->list (stream-filter (lambda (x) (odd? x)) (stream 0 1 2 3 4 5)))
                  '(1 3 5)
                  "stream-filter")
    (check-equal? (stream-nth 3
                              (stream-filter (lambda (x) (= (remainder x 7) 0))
                                             (stream-enumerate-from 1)))
                  28
                  "stream-filter on infinite stream"))))
