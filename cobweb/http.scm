;;; cobweb/http.scm --- HTTP parsing and serialization

(define-module (cobweb http)
  #:use-module (ice-9 rdelim)
  #:export (parse-request serialize-response))

(define (parse-request port)
  "Parse an HTTP request from PORT and return a request object.
The request object is an association list."
  (let* ((request-line (read-line port))
         (parts (string-split request-line #\space))
         (method (string->symbol (car parts)))
         (path (cadr parts))
         (headers (let loop ((line (read-line port))
                             (headers '()))
                      (if (string-null? line)
                          headers
                          (let* ((parts (string-split line #\: 2))
                                 (name (string-trim (car parts)))
                                 (value (string-trim (cadr parts))))
                            (loop (read-line port)
                                  (cons `(,name . ,value) headers)))))))
    `((method . ,method)
      (path . ,path)
      (headers . ,headers)
      (body . ""))))

(define (serialize-response port response)
  "Serialize a RESPONSE object to PORT.
RESPONSE is a list of (status-code headers body)."
  (let ((status-code (car response))
        (headers (cadr response))
        (body (caddr response)))
    (format port "HTTP/1.1 ~a OK\r\n" status-code)
    (for-each
     (lambda (header)
       (format port "~a: ~a\r\n" (car header) (cdr header)))
     headers)
    (format port "\r\n")
    (format port "~a" body)))
