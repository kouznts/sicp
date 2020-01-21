;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.2.2. Древовидная рекурсия|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Подсчитать кол-во способов размена amount долларов
;; монетами по 1, 5, 10, 25 и 50 цент.
(define (count-change amount)
  (count amount 5))

;; Число способов разменять сумму amount с помощью kind-of-coins типов монет равняется
;; • числу способов разменять сумму amount с помощью всех типов монет, кроме первого,
;;   плюс
;; • число способов разменять сумму (amount - first-denomination) с использованием всех kind-of-coins типов монет,
;;   где first-denomination — достоинство монет первого типа.

;; Чтобы увидеть, что это именно так, заметим, что способы размена могут быть
;; поделены на две группы:
;; * те, которые не используют первый тип монеты, и
;; * те, которые его используют.
;; Следовательно, общее число способов размена какой-либо суммы
;; равно числу способов разменять эту сумму без привлечения монет первого типа
;; плюс число способов размена в предположении, что мы этот тип используем.
;; Но последнее число равно числу способов размена для суммы,
;; которая остается после того, как мы один раз употребили первый тип монеты

;; Если amount в точности равно 0, мы считаем, что имеем 1 способ размена.
;; Если amount меньше 0, мы считаем, что имеем 0 способов размена.
;; Если kind-of-coins равно 0, мы считаем, что имеем 0 способов размена.
(define (count amount kind-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kind-of-coins 0)) 0)
        (else (+ (count amount (- kind-of-coins 1))
                 (count (- amount (first-denomination kind-of-coins)) kind-of-coins)))))

;; Упорядочили типы монет, которые у нас есть.
;; Процедура принимает в качестве входа число доступных типов монет
;; и возвращает достоинство первого типа.
(define (first-denomination kind-of-coins)
  (cond ((= kind-of-coins 1) 1)
        ((= kind-of-coins 2) 5)
        ((= kind-of-coins 3) 10)
        ((= kind-of-coins 4) 25)
        ((= kind-of-coins 5) 50)))

(count-change 100)