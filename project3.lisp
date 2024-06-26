;; Return T if item is a member of set.

;; Return NIL if item is not a member of set.

;; The type of set is list.

;; Examples:

;;  (set-member '(1 2) 1) => T

;;  (set-member '(1 2) 3) =>  NIL

(defun set-member (set item)
  (cond
    ((equal (car set) item) t) ;base case 
    ((equal (length (cdr set)) 0) nil) ; base case
    ((equal (car set) item) t) ; if the first element is equal to the item then retun t
    ((equal item item) (set-member(cdr set) item))
  )

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the union of set-1 and set-2.

;; The result should contain no duplicates.

;; Assume set-1 contains no duplicates and set-2 contains no duplicates.

;; Examples:

;;   (set-union '(1 2) '(2 4)) => '(1 2 4)

(defun set-union (set-1 set-2)

  ;;Your implementation go here

(defun set-member (set item)
  (cond ((null set) nil) ; Base case: If the set is empty, return NIL
        ((equal (car set) item) t) ; If the first element of the set is equal to the item, return T
        (t (set-member (cdr set) item)))) ; Recur with the rest of the set


  (cond ((null set-1) set-2) ; Base case: If set-1 is empty, return set-2
        ((null set-2) set-1) ; Base case: If set-2 is empty, return set-1
        ((set-member set-2 (car set-1)) ; If the first element of set-1 is in set-2
         (set-union (cdr set-1) set-2)) ; Recur with the rest of set-1 and set-2
        (t (cons (car set-1) (set-union (cdr set-1) set-2))))) ; Otherwise, add the first element of set-1 to the union and recur with the rest of set-1 and set-2




 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the intersection of set-1 and set-2.

;; The result should contain no duplicates.

;; Assume set-1 contains no duplicates and set-2 contains no duplicates.

;; Examples:

;;   (set-intersection '(1 2) '(2 4)) => '(2)


(defun set-intersection (set-1 set-2)
  (cond 

  ; Base case: if set 1 is empty return nil
  ((equal (length set-1) 0) nil) 

  ; Base case: if set 2 is empty return nil
  ((equal (length set-2) 0) nil) 
  ; recursive call: If the first value of set 1 is a member of set two then we want to contruct a list by recurssively calling our function
  ; and pass in the remaining values of set-1
  ((set-member set-2 (car set-1)) (cons (car set-1) (set-intersection (cdr set-1) set-2))); rec
  
  ; recursive call: if the first value of set-1 is not a value of set-2 then we want to recusively pass in the other values of set-1 using cdr
  ((equal set-2 set-2) (set-intersection (cdr set-1) set-2)) ;recursive call
  
  )
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the difference of set-1 and set-2.

;; The result should contain no duplicates.

;; Assume set-1 contains no duplicates and set-2 contains no duplicates.

;;

;; Examples:

;;   (set-diff '(1 2) '(2 4)) => '(1)


(defun set-diff (set-1 set-2)
    (cond
        ; Base Case: if set 1 is empty return nil
        ((equal (length set-1 ) 0) nil)

        ; Base Case: if set 2 is empty return nil
        ((equal (length set-2 ) 0) nil)
        ; Recursive Call: if the first value of set-1 is not a member of set-2 we want to build a list
        ; by recussively calling our function set-diff and passing in the remaining values of set-1
        ((not(set-member set-2 (car set-1))) (cons (car set-1) (set-diff (cdr set-1) set-2)))
        
        ; Recursive Call: Using an always true if statement this recusive call (that passes
        ; in the remainging values of set-1) is called if the above
        ; if statement fails.  This is so we can continue to search set-1 for values that are not in set-2
        ((equal set-2 set-2) (set-diff (cdr set-1) set-2))
        
        
        
        )
    )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the exclusive or of a and b

;;

;; Example

;;  (boolean-xor t nil) => t

;;  (boolean-xor nil nil) => nil

(defun boolean-xor (a b)

  (or (and a (not b))
      (and (not a) b))

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the implication of a and b

;;

;; Examples:

;;  (boolean-implies t nil) => nil

;;  (boolean-implies nil nil) => t

(defun boolean-implies (a b)

  (or (not a)
        b)

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Return the bi-implication (if and only if) of a and b

;;

;; Examples:

;;  (boolean-iff t nil) => nil

;;  (boolean-iff nil nil) => t

(defun boolean-iff (a b)

 (cond
   ((equal a b) t)
  ((not (equal a b)) nil)
     
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Evaluate a boolean expression.

;; Handle NOT, AND, OR, XOR, IMPLIES, and IFF.

;;

;; Examples:

;;  (boolean-eval '(and t nil)) => nil

;;  (boolean-eval '(and t (or nil t)) => t

(defun boolean-eval (exp)

  (cond 
    ((or(equal (first(cdr exp)) t) (equal (first(cdr exp)) nil))
      (cond 
        ((or(equal (second(cdr exp)) t) (equal (second(cdr exp)) nil)) ; if b is to or nil then we wan to do the right boolean operation
          (cond
            ((equal(car exp) 'and) (and (first(cdr exp)) (second (cdr exp))))
            ((equal(car exp) 'or) (or(first(cdr exp)) (second (cdr exp))))
            ((equal(car exp) 'not) (not(first(cdr exp))))
            ((equal(car exp) 'iff) (boolean-iff(first(cdr exp)) (second (cdr exp))))
            ((equal(car exp) 'xor) (boolean-xor(first(cdr exp)) (second (cdr exp))))
            ((equal(car exp) 'implies) (boolean-implies(first(cdr exp)) (second (cdr exp))))
            ) 
          )
          ((equal t t) (boolean-eval(second (cdr exp)))) ;else we want to evaluate b
          )
    
    
    
    ) ; if a is t or null then we want to evaluate b
    
  
    ((equal t t) (boolean-eval(first (cdr exp)))); else we want to evaluate a
  )

)



;(print "------Set Member------")
(set-member '(1 2) 1)
(set-member '(1 2) 3)

;(print "------Set Union------")
(set-union '(1 2) '(2 4))

;(print "------Set Intersection------")
(set-intersection '(1 2) '(2 4))

;(print "------Set Difference------")
(set-diff '(1 2) '(2 4))

;(print "------Boolean Xor------")
(boolean-xor t nil)
(boolean-xor nil nil)

;(print "------Boolean Implies------")
(boolean-implies t nil)
(boolean-implies nil nil)

;(print "------Boolean Iff------")
(boolean-iff t nil)
(boolean-iff nil nil)

;(print "------Boolean-Eval------")
(boolean-eval '(and t nil))
(boolean-eval '(and t (or nil t)))