;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Упражнение 1.11.
;; Функция f определяется правилом:
;; * f(n) = n, если n < 3,
;; * и f(n) = f(n - 1) + f(n - 2) + f(n - 3), если n ≥ 3.
;; Напишите процедуру, вычисляющую f с помощью рекурсивного процесса.
;; Напишите процедуру, вычисляющую f с помощью итеративного процесса.

;; процедура, вычисляющую f с помощью рекурсивного процесса
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (f (- n 2))
                 (f (- n 3))))))

;; процедура, вычисляющая f с помощью итеративного процесса
;; a <- a + b + c
;; b <- a
;; c <- b
(define (f n)
  (f-iteration 2 1 0 n))

(define (f-iteration a b c count)
  (if (= count 0)
      c
      (f-iteration (+ a b c) a b (- count 1))))