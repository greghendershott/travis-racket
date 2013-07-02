#lang racket

(define (plus1 x)
  (add1 x))

(module+ test
  (require rackunit)
  (check-equal? (plus1 1) 2))
