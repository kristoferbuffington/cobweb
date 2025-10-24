;;; examples/hello-wasm.scm --- A "Hello, World" example for Cobweb in Wasm

(define-module (hello-wasm)
  #:use-module (cobweb http)
  #:use-module (cobweb wasm)
  #:use-module (hoot promises))

(define (main)
  (let ((response-promise (http-get "https://jsonplaceholder.typicode.com/todos/1")))
    (chain response-promise
           (lambda (response-text)
             (console-log "Response from API:")
             (console-log response-text)))))

(main)
