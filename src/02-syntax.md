# Syntax

## Symbols

## Literals

### Numbers

#### Base-10 Integers

Integer literals are strings matched by the regular expression:

```
^[+|-]?0*(\d+|\d{1,3}(,\d{3})*)$
```

Note that, to aid human-readability, commas can appear in integer literals as
the thousands separator.

Examples:

```
123
+123
-45
123,532
-1,000,231
-0000000001,000,000
```

#### Floating-Point Numbers

#### Fixed-Point Numbers

#### Complex Numbers

Complex number literals use the prefix `#J` (pronounced "sharpsign J") a list
form whose elements are the real and imaginary parts of the number.

Examples:

```
#J(0 0)
#J(1.0 -1.0)
```

### Tuples

Tuple literals use curly braces, where the tuple elements are arbitrary
whitespace-separated forms.

Examples:

```
{1 2 3}
{0 3.14 "test"}
{} ;; The empty tuple
```

### Arrays

Array literals use square brackets, and array elements are arbitrary
whitespace-separated forms.

Examples:

```
[1 2 3]
[0.0 0.0 0.0]
```

The type of an array literal is a [fixed-size array](#type:fixed-size-array)
with the same number of elements as in the literal form.

### Characters

### Strings

## Sigils

## Comments

Two types of comments are defined: single and multi-line. Single line comments
begin with the semicolon (`;`) character, and end with a newline. Multi-line
comments begin with `#|` and end with `#|`. Multi-line comments can be nested
arbitrarily.

## Banned Characters

A tab character (`U+0009`) in source text is a syntax error.
