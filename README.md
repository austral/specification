# Austral Specification

[![Build Status](https://travis-ci.org/austral/specification.svg?branch=master)](https://travis-ci.org/austral/specification)

This repository contains the source text of the Austral specification.

## Building

To generate the HTML version of the spec, run:

```bash
$ make
```

The result will be the `build/spec.html` file.

To generate the PDF version, run:

```bash
$ make pdf
```

The result will be the `build/spec.pdf` file.

And as always, to remove build output, run:

```bash
$ make clean
```

## Requirements

Building the spec requires:

- m4
- [Pandoc](https://pandoc.org/)
- make

# License

Copyright 2017-2019 Fernando Borretti.

Licensed under the GNU Free Documentation License. See the COPYING file for
details.
