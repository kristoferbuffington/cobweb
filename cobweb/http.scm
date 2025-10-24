;;; cobweb/http.scm --- HTTP client for WebAssembly

(define-module (cobweb http)
  #:use-module (cobweb wasm)
  #:use-module (hoot promises)
  #:export (http-get))

(define (http-get url)
  "Make a GET request to URL and return a promise that resolves with the
response text."
  (let ((response-promise (fetch url)))
    (chain response-promise
           (lambda (response)
             ((js-ref "text") response)))))
