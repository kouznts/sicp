;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |1.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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