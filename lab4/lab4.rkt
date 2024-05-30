#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4		;
;					                					;
;  Regina Sanchez		        			 	;
;  sanchreg@oregonstate.edu        	;
;					                					;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; your code here

; task #1 --> creating memeber? function
; began by using course provided skeleton
(define (member? e lst)
  (cond
    ; first checks if the list is empty, if it is then it returns #f
    [(empty? lst) #f]
    ; if the first element is a member of the list lst, it returns #t
    [(equal? e (first lst)) #t]
    ; else, it checks the rest of the list
    [else (member? e (rest lst))]))


; task #2 --> set? function
; began by using course code
(define (set? lst) 
  (cond
    ; if the list is empty then return #t
    [(empty? lst) #t] 
    ; if repeats not a set returns #f
    [(member? (first lst) (rest lst)) #f] 
    ; else it checks the rest of set
    [else (set? (rest lst))])) 


; used this to help me with what function to use --> cons:
; https://docs.racket-lang.org/guide/Pairs__Lists__and_Racket_Syntax.html
; task #3 --> union function
; began with course code
(define (union lst1 lst2)
  (cond
  ; if the first list is empty, return the second list
  [(empty? lst1) lst2]
  ; if the second list is empty, return the first list
  [(empty? lst2) lst1]
  ; if the first element of list 1 is in list 2
  [(member? (first lst1) lst2)
  ; go onto next element
  (union (rest lst1) lst2)]
  [else
  ; else if first element of lst1 is not in lst2, add it and proceed w list
  ; i used cons as it adds to the list
  (cons (first lst1) (union (rest lst1) lst2))]))
  ; might have an issue in this function --> might need to work backwards as output is different on some


; task #4 --> insersect function
; began by using the course provided code
(define (intersect lst1 lst2)
  (cond
  ; if lst1 is empty then it returns an empty list ()
  [(empty? lst1) '()]
  ; if the first element in lst 1 is in lst2
  [(member? (first lst1) lst2)
  ; add it to the result
  (cons (first lst1)
  ; checks the rest of list
  (intersect (rest lst1) lst2))]
  [else
  ; if not in it then skip and check rest
  (intersect (rest lst1) lst2)]))


; task #5 --> difference function
; began using course skeleton
(define (difference lst1 lst2)
  (cond
  ; checking if lst1 is empty, then returns empty set
  [(empty? lst1) '()]
  ; if first ele in second lst, 
  [(member? (first lst1) lst2)
  ; will skip it and check rest of list
  (difference (rest lst1) lst2)]
  [else
  ; else includes ele and checks rest of list
  (cons (first lst1) (difference (rest lst1) lst2))]))


; task --> EXTRA CREDIT!!
; began with skeelton function
(define (flatten lst1 lst2)
  ; used a helper function to reduce the repetitive code
  ; appended the flattened lists of 1 and 2, into one list
  (append (helper lst1) (helper lst2)))

(define (helper lst)
  (cond
  ; if the list is empty, return empty list
  [(empty? lst) '()]
  ; if the first ele of the lst1 is a list
  [(list? (first lst))
  ; flatten it and append to the rest
  (append (helper (first lst)) (helper (rest lst)))]
  [else
  ; else, first ele is not list so flatten all
  (cons (first lst) (helper (rest lst)))]))




;;;;;;;;;;;;;;;;;
;  DO NOT EDIT  ;
;;;;;;;;;;;;;;;;;
; enables testing via piping in stdin
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))
