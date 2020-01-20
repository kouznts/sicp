;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Упражнение 1.9.
;; Каждая из следующих двух процедур определяет способ сложения двух положительных целых чисел с помощью процедур 
;; inc, которая добавляет к своему аргументу 1, 
;; и dec, которая отнимает от своего аргумента 1.

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

;; (+ 4 5) 
;; (inc (+ 3 5)) 
;; (inc (inc (+ 2 5))) 
;; (inc (inc (inc (+ 1 5)))) 
;; (inc (inc (inc (inc (+ 0 5))))) 
;; (inc (inc (inc (inc 5)))) 
;; (inc (inc (inc 6))) 
;; (inc (inc 7)) 
;; (inc 8 ) 
;; 9
;; линейно-рекурсивный процесс

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

;; (+ 4 5) 
;; (+ (dec 4) (inc 5)) 
;; (+ 3 6) 
;; (+ (dec 3) (inc 6)) 
;; (+ 2 7) 
;; (+ (dec 2) (inc 7)) 
;; (+ 1 8 ) 
;; (+ (dec 1) (inc 8 )) 
;; (+ 0 9) 
;; 9
;; линейно-итеративный процесс