;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Упражнение 1.10.
;; Следующая процедура вычисляет математическую функцию, называемую функцией Аккермана.

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

;; Каковы значения следующих выражений?

;; Дайте краткие математические определения функций, вычисляемых процедурами f, g и h
;; для положительных целых значений n.
;; Например, (k n) вычисляет 5n^2.

;; Рассмотрим следующие процедуры, где A — процедура, определенная выше:

;;(define (f n) (A 0 n))
;; f(n) = 2n

;; (A 1 10)
;; (A 0 (A 1 9))
;; (A 0 (A 0 (A 1 8)))
;; (A 0 (A 0 (A 0 (A 1 7))))
;; (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2^0))))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2^1)))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2^2))))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2^3)))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2^4))))))
;; (A 0 (A 0 (A 0 (A 0 (A 0 2^5)))))
;; (A 0 (A 0 (A 0 (A 0 2^6))))
;; (A 0 (A 0 (A 0 2^7)))
;; (A 0 (A 0 2^8))
;; (A 0 2^9)
;; 2^10
(A 1 10)

;; (define (g n) (A 1 n))
;; f(n) = 2^n, n > 0

;;  0 (A 2 4)
;;  1 (A 1 (A 2 3))
;;  2 (A 1 (A 1 (A 2 2)))
;;  3 (A 1 (A 1 (A 1 (A 2 1))))
;;  4 (A 1 (A 1 (A 1 2)))
;;  5 (A 1 (A 1 (A 0 (A 1 1))))
;;  6 (A 1 (A 1 (A 0 2)))
;;  7 (A 1 (A 1 4))
;;  8 (A 1 (A 0 (A 1 3)))
;;  9 (A 1 (A 0 (A 0 (A 1 2))))
;; 10 (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
;; 11 (A 1 (A 0 (A 0 (A 0 2))))
;; 12 (A 1 (A 0 (A 0 4)))
;; 13 (A 1 (A 0 8))
;; 14 (A 1 16)
;; 15 (A 0 (A 1 15))
;; 16 (A 0 (A 0 (A 1 14)))
;; 17 (A 0 (A 0 (A 0 (A 1 13))))
;; 18 (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
;; 19 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
;; 20 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2^10))))))
;; 21 (A 0 (A 0 (A 0 (A 0 (A 0 2^11)))))
;; 22 (A 0 (A 0 (A 0 (A 0 2^12))))
;; 23 (A 0 (A 0 (A 0 2^13)))
;; 24 (A 0 (A 0 2^14))
;; 25 (A 0 2^15)
;; 26 2^16
(A 2 4)

;; (define (h n) (A 2 n))
;; h(n) = 2^2^2^2..., где кол-во 2 равно n и n > 0

;; (A 3 3)
;; (A 2 (A 3 2))
;; (A 2 (A 2 (A 3 1)))
;; (A 2 (A 2 2))
;; (A 2 (A 1 (A 2 1)))
;; (A 2 (A 1 (A 2 1)))
;; (A 2 (A 1 2))
;; (A 2 (A 0 (A 1 1)))
;; (A 2 (A 0 2))
;; (A 2 4)
;; 2^16
(A 3 3)







