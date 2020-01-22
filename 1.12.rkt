;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Упражнение 1.12.
; Приведенная ниже таблица называется треугольником Паскаля.
; Все числа по краям треугольника равны 1,
; а каждое число внутри треугольника равно сумме двух чисел над ним.
; Напишите процедуру,
; вычисляющую элементы треугольника Паскаля с помощью рекурсивного процесса.

;     1
;    1 1
;   1 2 1
;  1 3 3 1
; 1 4 6 4 1

(define (pascal-triangle row col)
  (cond
    ((or (<= row 2) (= col 1) (= row col)) 1)
    (else
      (+ (pascal-triangle (- row 1) (- col 1))
         (pascal-triangle (- row 1) col)))))

; (pascal-triangle 3 2)
; (+ (pascal-triangle 2 1) (pascal-triangle 2 2))
; (+ 1 1)
; 2

(pascal-triangle 1 1)
(pascal-triangle 2 1)
(pascal-triangle 2 2)
(pascal-triangle 3 1)
(pascal-triangle 3 2)
(pascal-triangle 3 3)
(pascal-triangle 4 1)
(pascal-triangle 4 2)
(pascal-triangle 4 3)
(pascal-triangle 4 4)
(pascal-triangle 5 1)
(pascal-triangle 5 2)
(pascal-triangle 5 3)
(pascal-triangle 5 4)
(pascal-triangle 5 5)