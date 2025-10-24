;;; cobweb/wasm.scm --- WebAssembly entry point for Cobweb

(define-module (cobweb wasm)
  #:use-module (hoot js)
  #:export (console-log fetch))

(define console-log (js-ref "console.log"))
(define fetch (js-ref "fetch"))
