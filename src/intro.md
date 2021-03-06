# Introduction

Austral is a low-level, statically-typed, memory safe, compiled dialect of
Lisp. Aesthetically it derives from Common Lisp, but its type system is closest
to that of Haskell. Memory and resource safety is achieved through the use of
linear types.

## Organization of the Document

## Conventions

This section describes conventions used throughout the document.

### Requirements Terminology

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD",
"SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be
interpreted as described in [RFC 2119][rfc2119].

### Syntax Definitions

In syntax definitions, the following rules are used:

1. Text in angular brackets represents a non-terminal, e.g. `<var>`, `<args>`,
   `<val>`.

2. The character `*` (the asterisk) appearing after an expression indicates it
   may occur zero or more times.

3. The character `+` (the plus sign) appearing after an expression indicates it must occur at least once.

4. Curly brackets are used to group expressions.

5. Square brackets denote optional expressions.

### Metasyntactic Variables

Words such as "foo", "bar", "baz" have no semantic meaning and should be
interpreted as placeholders for user-defined names or values.

## Differences from Common Lisp

### Syntax

- In Common Lisp, the single quote character (`'`) is a reader macro character
  used as a shorthand for the `quote` special operator. In Austral, there is no
  equivalent of the `quote` special operator. Additionally, having a special
  syntactic role for the single quote character would prevent it from being used
  in symbols names.  The use of single quote as a suffix in symbol names is
  useful in many mathematical contexts (e.g. variables named `p`, `p'`, read as
  "p prime"). For these reasons, the single quote character has no special
  syntactic role in Austral and is a valid component of symbols.

## Acknowledgements

[rfc2119]: https://tools.ietf.org/html/rfc2119
