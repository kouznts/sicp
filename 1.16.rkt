;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.16|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Упражнение 1.16.
; Напишите процедуру,
; которая развивается в виде итеративного процесса
; и реализует возведение в степень за логарифмическое число шагов, как fast-expt.
;
; Указание: используя наблюдение, что (b^(n/2))^2 = (b^2)^(n/2),
; храните, помимо значения степени n и основания b,
; дополнительную переменную состояния a,
; и определите переход между состояниями так,
; чтобы произведение a * b^n от шага к шагу не менялось.

; Вначале значение a берется равным 1,
; а ответ получается как значение a в момент окончания процесса.
;
; В общем случае метод определения инварианта (invariant quantity),
; который не изменяется при переходе между шагами,
; является мощным способом размышления о построении итеративных алгоритмов.

(define (fast-exponentiation b n) 
  (fast-exponentiation-iteration 1 b n))

(define (fast-exponentiation-iteration a b n) 
  (if (= n 0) 
      a 
      (if (is-even n) 
          (fast-exponentiation-iteration a (square b) (/ n 2)) 
          (fast-exponentiation-iteration (* a b) b (- n 1)))))

(define (is-even x)
  (= (remainder x 2) 0))

(define (square x)
  (* x x))

(fast-exponentiation 2 8) 