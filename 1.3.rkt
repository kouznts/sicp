;; Упражнение 1.3.
;; Определите процедуру, которая принимает в качестве аргументов три числа 
;; и возвращает сумму квадратов двух б´ольших из них

#lang racket

(define
  (return-square-of-num a)
  (* a a))

(define
  (return-sum-of-squares-of-two-nums a b)
  (+ (return-square-of-num a)
     (return-square-of-num b)))

(define
  (return-sum-of-squares-of-two-larger-nums a b c)
  (if (> a b)
      (if (> b c)
          (return-sum-of-squares-of-two-nums a b)
          (return-sum-of-squares-of-two-nums a c))
      (if (> a c)
          (return-sum-of-squares-of-two-nums a b)
          (return-sum-of-squares-of-two-nums b c))))

(return-sum-of-squares-of-two-larger-nums 1 2 3)