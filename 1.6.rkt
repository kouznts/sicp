;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Упражнение 1.6.
;; Лиза П. Хакер не понимает, почему if должна быть особой формой.
;; «Почему нельзя просто определить ее как обычную процедуру с помощью cond?» — спрашивает она.
;; Лизина подруга Ева Лу Атор утверждает, что, разумеется, можно, и определяет новую версию if:
;;(define (new-if predicate then-clause else-clause)
;;        (cond (predicate then-clause)
;;        (else else-clause)))
;; Ева показывает Лизе новую программу:
;; (new-if (= 2 3) 0 5)
;; 5
;; Обрадованная Лиза переписывает через new-if программу вычисления квадратного корня
;; Что получится, когда Лиза попытается использовать эту процедуру для вычисления квадратных корней? Объясните.

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

;;------------------------------------------------
;; НОВЫЙ IF
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
;;------------------------------------------------

;; если приближение достаточно пригодно для наших целей, то процесс закончен
;; иначе -- повторить с улучшенным значением приближения
(define(sqrrt-iteration y x)
  (new-if (is-good-enough y x)
      y
      (sqrrt-iteration (improve y x) x)))

;; для начала предполагать, что квадратный корень любого числа равен 1
(define (sqrrt x)
  (sqrrt-iteration 1.0 x))

(sqrrt 9)

;; При интерпретации используется аппликативный порядок вычислений.
;; При вычислении new-if сначала должны быть вычислены все ее аргументы.
;; Первый два аргумента высчисляются, а при вычислении третьего происходит зацикливание:
;; new-if снова обращается к sqrrt-iterationи т.д.

;; Обычный if является особой формой, т.е. не вычисляется не так, как стандартные процедуры.