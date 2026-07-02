#lang racket
(require math/number-theory)
(require racket/trace)

(define (stream-enumerate-interval lo hi)
  (if (> lo hi)
      empty-stream
      (stream-cons lo
                   (stream-enumerate-interval (+ lo 1) hi))))

(trace stream-enumerate-interval)

(stream-first
 (stream-rest
  (stream-filter prime?
                 (stream-enumerate-interval 10000 1000000))))

