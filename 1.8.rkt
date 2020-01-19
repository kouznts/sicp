;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Упражнение 1.8.
;; Метод Ньютона для кубических корней основан на том,
;; что если y является приближением к кубическому корню из x,
;; то мы можем получить лучшее приближение по формуле (x/y^3 + 2y)/3.
;; С помощью этой формулы напишите процедуру вычисления кубического корня, подобную процедуре для квадратного корня.

;; квадрируем число (для проверки пригодности приближения)
(define (square x)
  (* x x))

;; улучшаем значение приближения
;; x -- подкоренное выражение
;; y -- приближение
(define (improve y x)
  (/ (+ (/ x (square y))
        (* 2.0 y))
     3.0))

(define (is-good-enough y prev-y)
  (< (abs (- y prev-y)) 0.001))

;; если приближение достаточно пригодно для наших целей, то процесс закончен
;; иначе -- повторить с улучшенным значением приближения
(define(cubert-iteration y prev-y x)
  (if (is-good-enough y prev-y)
      y
      (cubert-iteration (improve y x) y x)))

;; для начала предполагать, что квадратный корень любого числа равен 1
(define (cubert x)
  (cubert-iteration 0.5 1.0 x))

(cubert 27.0)