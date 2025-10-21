;;; examples/main.scm --- An example Cobweb application

(define-module (main)
  #:use-module (cobweb server))

(define (my-handler request)
  "A simple handler that returns a plain text response."
  '(200
    (("Content-Type" . "text/plain"))
    "Hello, World from Cobweb!"))

(run-server #:port 8080 #:handler my-handler)
