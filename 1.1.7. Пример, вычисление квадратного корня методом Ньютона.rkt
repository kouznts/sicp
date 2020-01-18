;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.1.7. Пример, вычисление квадратного корня методом Ньютона|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; sqrrt(x) = такое y, что y >= 0 и y^2 = x

;; среднее значение двух чисел (для улучшения приближения)
(define (average a b)
  (/ (+ a b) 2))

;; улучшаем значение приближения
;; x -- подкоренное выражение
;; y -- приближение
(define (improve y x)
  (average y (/ x y)))

;; квадрируем число (для проверки пригодности приближения)
(define (square x)
  (* x x))

;; проверка пригодности приближения
;; |y^2 - x| < 0.001
;; пригодно, если квадрат приближения (y^2) совпадает с подкоренным числом (x) в пределах 0.001
;; y^2 и x то же, что и y = sqrrt(x)
(define (is-good-enough y x)
  (< (abs (- (square y) x)) 0.001))

;; если приближение достаточно пригодно для наших целей, то процесс закончен
;; иначе -- повторить с улучшенным значением приближения
(define(sqrrt-iteration y x)
  (if (is-good-enough y x)
      y
      (sqrrt-iteration (improve y x) x)))

;; для начала предполагать, что квадратный корень любого числа равен 1
(define (sqrrt x)
  (sqrrt-iteration 1.0 x))

(sqrrt 9)
