;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |1.4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define
  (a-plus-abs-b a b)
  ((if (> b 0)
       +
       -)
   a
   b))

;; (a-plus-abs-b 1 2)
;; ((if (> 2 0) + -) 1 2)
;; ((if (true) + -) 1 2)
;; (+ 1 2)
;; 3
