;;; tests/test-http.scm --- Tests for the HTTP parser

(define-module (tests http)
  #:use-module (cobweb http)
  #:use-module (srfi srfi-64))

(test-begin "http")

(test-equal "parse-request request-line"
            '((request-line . "GET / HTTP/1.1"))
            (with-input-from-string
                "GET / HTTP/1.1\r\n"
              (lambda () (parse-request (current-input-port)))))

(test-end "http")
