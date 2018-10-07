# Syntax

This section describes Austral's syntax.

## Symbols ## {#syntax:symbols}

A symbol has two components: the module name and the symbol name. In source
text, symbols come in two forms: unqualified and qualified.

An unqualified symbol is just the symbol name, like `hello` or `foo`. Module
resolution is performed after parsing to determine which module this symbol
should belong to.

A qualified symbol contains both the module name and the symbol name separated
by a colon character (`:`), for example `library.net.http:response`.

Note that in the case of qualfied symbols, the module name may be a nickname.

### Module and Symbol Names

Symbols in Austral can be made up of any of the following characters.

- The letters `A` to `Z`, in lowercase and uppercase form.
- The digits `0` to `9`.
- Any of the following symbols: `!`, `%`, `&`, `$`, `#`, `+`, `-`, `*`, `/`,
  `<`, `=`, `>`, `?`, `@`, `\\`, `` ` ``, `~`, `^`, `|`.

### Keywords

A keyword is a special type of symbol whose module name is the empty string,
e.g. `:my-keyword`. Keywords are used extensively in definition forms.

## Literals

This section describes literal representations of Austral values.

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

The following strings are not valid integer literals:

```
1,0000
-123,0
```

The string `-0` is equivalent to `0`.

#### Floating-Point Numbers

Floating point literals are strings matched by the regular expression:

```
^[+|-]?0*(\d+|\d{1,3}(,\d{3})*)\.([f|d]?[0-9]+)([Ee][+-]?[0-9]+)?$
```

Examples:

```
0.0
123.0
123.d0
123.f0
-123.f0
-123.d0
+1,000,234.0
-0000000001,234,456.f0
1,000,123.0e123
100.d0e-452
```

If the decimal point is followed by the letter `f`, the type of the literal is
`f32`. If it's followed by the letter `d`, the type of the literal is `f64`.

#### Fixed-Point Numbers

### Tuples

Tuple literals use curly braces, where the tuple elements are arbitrary
whitespace-separated forms.

Examples:

```
{1 2 3}
{0 3.14 "test"}
{} ;; The empty tuple
```

### Strings

String literals are delimited by double quote (`"`) characters.

When present in a string literal, the backslash can be used to insert special
characters:

- `\"` inserts a double quote character.
- `\\` inserts a single backslash character.
- `\n` inserts a line feed.
- `\r` inserts a carriage return.
- `\t` inserts a horizontal tab character.
- A single backslash, followed by an arbitrary amount of whitespace, followed by
  another backslash character; inserts nothing, and can be used to write
  properly-indented multi-line strings without inserting extraneous whitespace.
- Arbitrary Unicode code points are inserted using the string `\U{n}`, where `n`
  is a hexadecimal positive integer between one and eight digits long.

## Comments

Two types of comments are defined: single and multi-line. Single line comments
begin with the semicolon (`;`) character, and end with a newline. Multi-line
comments begin with `#|` and end with `#|`. Multi-line comments can be nested
arbitrarily.

## Banned Characters

A tab character (`U+0009`) in source text is a syntax error.
