;;; cobweb.scm --- A web framework for Guile

(define-module (cobweb)
  #:use-module (ice-9 match)
  #:export (cobweb))

(define (cobweb)
  (display "Hello, Cobweb!"))
