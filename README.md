# Austral Specification

![Build status badge](https://github.com/austral/specification/actions/workflows/build.yml/badge.svg)

This repository contains the source text of the [Austral][aus] specification.

This is a work in progress.

## Building

To generate the PDF version of the spec, run:

```bash
$ make
```

The result is a `spec.pdf` file.

To remove build output:

```bash
$ make clean
```

## Status

1. Introduction ⚪⚪⚪
2. Rationale ⚪⚪⚪
    1. Syntax ⚪⚪⚪
    2. Error Handling ⚪⚪⚪
    3. Resource-Aware Type System ⚪⚪⚪
4. Syntax ⚪⚪⚪
5. Module System ⚪⚪⚪
6. Type System ⚪⚪⚪
7. Declarations ⚪⚪⚪
8. Statements ⚪⚪⚪
9. Expressions ⚪⚪⚪
10. Examples ⚪⚪⚪
11. Style ⚪⚪⚪

Key:

- ⚪⚪⚪: Not started
- 🟡⚪⚪: Preliminary.
- 🔵🔵⚪: In progress.
- 🟢🟢🟢 : Completed

## License

Copyright 2017–2021 Fernando Borretti.

Licensed under the GNU Free Documentation License. See the COPYING file for
details.

[aus]: https://github.com/austral/austral
