# Introduction

Austral is a low-level, statically-typed, memory safe, compiled dialect of Lisp.

## Design

## Notational Conventions

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD",
"SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be
interpreted as described in RFC 2119.

Specially in syntax definitions, the following rules are used:

1. Text in angular brackets represents a variable, eg. `<var>`, `<args>`,
   `<val>`.

2. The following quantifiers, when found after an expression, represent that the
   expression:

    `+`
    : Appears at least once.

    `*`
    : Appears any number of times.

3. Curly brackets are used to group expressions.
4. Square brackets denote optional expressions.

## Differences from Common Lisp

- In Common Lisp, the single quote character (`'`) is a reader macro character
  used as a shorthand for the `quote` special operator. In Austral, there is no
  equivalent of the `quote` special operator. Additionally, having a special
  syntactic role for the single quote character would prevent it from being used
  in symbols names.  The use of single quote as a suffix in symbol names is
  useful in many mathematical contexts (e.g. variables named `p`, `p'`, read as
  "p prime"). For these reasons, the single quote character has no special
  syntactic role in Austral and is a valid component of symbols.

## Acknowledgements
