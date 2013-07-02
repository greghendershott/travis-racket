#lang racket

;; A comment.

(define (plus1 x)
  (add1 x))

(define (minus1 x)
  (sub1 x))

(module+ test
  (require rackunit)
  (check-equal? (plus1 1) 2)
  (check-equal? (minus1 1) 0))
