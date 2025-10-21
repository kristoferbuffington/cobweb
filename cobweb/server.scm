;;; cobweb/server.scm --- A multi-threaded web server

(define-module (cobweb server)
  #:use-module (cobweb http)
  #:use-module (ice-9 posix)
  #:use-module (ice-9 threads)
  #:export (run-server))

(define (handle-connection client-fd handler)
  "Handle a single client connection on CLIENT-FD."
  (let* ((client-port (fdopen client-fd "r+"))
         (request (parse-request client-port))
         (response (handler request)))
    (serialize-response client-port response)
    (close-port client-port)))

(define (run-server #:key (port 8080) handler)
  "Run a multi-threaded web server on PORT, using HANDLER for requests."
  (let ((sock (socket AF_INET SOCK_STREAM 0)))
    (setsockopt sock SOL_SOCKET SO_REUSEADDR 1)
    (bind sock AF_INET INADDR_ANY port)
    (listen sock 5)
    (display (format "Server listening on port ~a\n" port))
    (while #t
      (let* ((accepted (accept sock))
             (client-sock (car accepted))
             (client-addr (cdr accepted)))
        (spawn-thread (lambda () (handle-connection client-sock handler)))))))
