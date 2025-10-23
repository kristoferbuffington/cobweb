# Cobweb

Cobweb is a multi-threaded, declarative functional web development framework and a collection of utilities written in GNU Guile.

## Features

* **Multi-threaded:** Cobweb is designed to handle multiple requests concurrently, making it suitable for high-performance web applications.
* **Declarative:** Cobweb's declarative nature allows developers to define web applications in a clear and concise way, without having to worry about the underlying implementation details.
* **Functional:** Cobweb is written in GNU Guile, a functional programming language. This allows developers to write web applications in a purely functional style, which can lead to more robust and maintainable code.

## Usage

To use Cobweb, you will need to have GNU Guile installed on your system. You can then load the server and run it from a Guile REPL.

First, start a Guile REPL in the project's root directory. Then, add the `cobweb` directory to the Guile load path:

```scheme
scheme@(guile-user)> (add-to-load-path "cobweb")
```

Now, you can load the server module and run it:

```scheme
scheme@(guile-user)> (use-modules (server))
scheme@(guile-user)> (run-server #:handler (lambda (req) '(200 () "Hello, World!")))
```

## Documentation

The Cobweb documentation is available online at [https://www.gnu.org/software/guile-cobweb/manual/](https://www.gnu.org/software/guile-cobweb/manual/).
