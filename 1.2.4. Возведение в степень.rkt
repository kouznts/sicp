;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.2.4. Возведение в степень|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (fast-exponentiation b n)
  (cond ((= n 0) 1)
        ((is-even n) (square (fast-exponentiation b (/ n 2))))
        (else (* b (fast-exponentiation b (- n 1))))))

(define (is-even n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(fast-exponentiation 2 2)