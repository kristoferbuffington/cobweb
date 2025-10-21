# Agent Guidelines for Cobweb

This document provides guidelines for agents working on the Cobweb project.

## Coding Style

* All code should be written in GNU Guile Scheme.
* Code should be formatted according to the GNU Guile coding standards.
* All functions should have a docstring that explains what the function does, its arguments, and what it returns.

## Testing

* All code should be accompanied by tests.
* Tests should be written using the Guile unit testing framework.
* To run the tests, use the following command:

```
make check
```

## Committing

* Commit messages should be clear and concise.
* The first line of the commit message should be a short summary of the change.
* The body of the commit message should provide a more detailed explanation of the change.
* All commits must be signed off on.

## Submitting

* Before submitting a change, make sure that all tests pass.
* Run `make distcheck` to ensure that the distribution is in a consistent state.
* Submit the change with a descriptive commit message.
