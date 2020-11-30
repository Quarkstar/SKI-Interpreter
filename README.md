# SKI Interpreter

## What's in this repository
This repository contains all the code required to build and execute an SKI Interpreter. This was created as the first practical assignment for the course of Foundations of Programming Languages.

## Dependencies

In order to build the code provided you will need an Haskell compiler, the Alex lexer and the Happy parser.
If you use cabal, you can install them with:
```sh
cabal install alex happy
```
if you haven't already.

## Build
First start by building the code from the source. Simply run:

```sh
make
```

This will produce a `Main` executable which you can use to run the interpreter.

## Execute
You can run the executable generated in the previous step on the examples provided or on your own examples, i.e.:

```sh
./Main < Examples/ex1
```

## License
This project is licensed under the mit License - see the [LICENSE](LICENSE) file for details
