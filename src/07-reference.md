# Language Reference

## Control Flow

### `progn` {#op:progn}

#### Syntax

```
(progn <exp>*) ⇒ <result>
```

#### Parameters and Values

`exp`
: A form.

`result`
: If the `progn` expression is non-empty, the result of evaluting the last
  `exp`. If the `progn` expression is empty, `nil`.

#### Description

The progn special operator evaluates every form in the order in which they
appear, discarding every value but the last. The last value is returned.

If progn appears as a toplevel form (for example, as the result of
macroexpansion), all of its forms are considered toplevel forms.

#### Examples

```
(progn)       ⇒ nil
(progn 1 2 3) ⇒ 3
```

#### See Also

None.

### `if` {#op:if}

#### Syntax

```
(if <test> <consequent> <alternate>) ⇒ <result>
```

#### Parameters and Values

`test`
: An expression of type [`boolean`](#type:boolean).

`consequent`
: An expression that will be evaluated if condition evaluates to `true`.

`alternate`
: An expression that will be evaluated if condition evaluates to `false`.

`result`
: The value of evaluating either the `consequent` or `alternate` expression.

#### Description

The `if` special operator evaluates the `test` expression unconditionally. If
the test was true, it evaluates the `consequent` and returns it. Otherwise, it
evaluates the `alternate`. Both `consequent` and `alternate` expressions must be
of the same type.

#### Examples

#### See Also

- [`cond`](#op:cond)
- [`when`](#op:when)
- [`unless`](#op:unless)

### `cond` {#op:cond}

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `and`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `or`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `not`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `when` {#op:when}

#### Syntax

```
(when <test>
  <body>*)
```

#### Parameters and Values

`test`
: An expression of type [`boolean`](#type:boolean).

`body`
: Forms evaluated as an [implicit `progn`](#g:implicit-progn).

#### Description

The `when` operator evaluates `body` if `test` evaluates to `true`.

The return value is always `nil`.

#### Examples

#### See Also

- [`unless`](#op:unless)

### `unless` {#op:unless}

#### Syntax

```
(unless <test>
  <body>*)
```

#### Parameters and Values

`test`
: An expression of type [`boolean`](#type:boolean).

`body`
: Forms evaluated as an [implicit `progn`](#g:implicit-progn).

#### Description

The `when` operator evaluates `body` if `test` evaluates to `false`.

The return value is always `nil`.

#### Examples

#### See Also

- [`when`](#op:when)

## Bindings

### `let`

### `defconstant` {#op:defconstant}

#### Syntax

```
(defconstant <name> <value>
  [<documentation>])
```

#### Parameters and Values

`name`
: The name of the constant, a symbol.

`value`
: An expression that evaluates to the constant's value.

`documentation`
: An optional documentation string.

#### Description

The defconstant operator defines a constant value.

#### Examples

```
(defconstant pi 3.141592653589793
  "The ratio of a circle's circumference to its diameter.")
```

#### See Also

None.

## Assignment

### `set`

## Functions

### `defun` {#op:defun}

### `definterface`

### `defmethod`

## Types

### `deftype`

### `defmagnitude` {#op:defmagnitude}

#### Syntax

```
(defmagnitude <name>
  [<documentation>]
  (:canonical <unit>)
```

#### Parameters and Values

`name`
: The name of the magnitude.

`documentation`
: An optional documentation string.

`unit`
: The canonical unit of this magnitude, a unit expression.

#### Description

The `defmagnitude` special operator defines a magntiude. A magnitude represents
a physical property that can be quantified, e.g. length or mass. Magnitudes can
be represented by different units.

#### Examples

```
(defmagnitude mass
  "The mass of an object."
  (:canonical gram))
```

#### See Also

- [`defunit`](#op:defunit)

### `defunit` {#op:defunit}

#### Syntax

```
(defunit <name>
  [<documentation>]
  (:magnitude <magnitude>)
  [(:nicknames <nickname>+)]
  (:factor <factor>))
```

#### Parameters and Values

#### Description

The `defunit` special operator defines a new unit of a specific magnitude.

Units can have multiple nicknames, for instance, `m` can be defined as a
nickname for `meter`.

#### Examples

```
(defunit meter
  "An SI meter."
  (:magnitude length)
  (:nicknames m)
  (:factor 1.0))

(defunit foot
  "A foot."
  (:magnitude length)
  (:nicknames ft)
  (:factor 3.281))
```

#### See Also

- [`defmagnitude`](#op:defmagnitude)

### `the`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

## Macros

### `defmacro`

### `define-symbol-macro`

### `symbol-macrolet`

## Modules

### `defmodule`

### `in-module`

## Characters

### `character-code`

### `code-character`

## Tuples

### `tuple`

### `!`

## Unions

### `case`

## Memory

### `allocate`

### `load`

### `borrowing`

## Features

### `provide` {#op:provide}

#### Syntax

```
(provide <feature>)
```

#### Parameters and Values

`feature`
    The feature name, a symbol.

#### Description

The `provide` special operator adds the feature `feature` to the compiler's
feature set.

Repeated invocations of `provide` with the same feature name MUST produce a
warning to the user.

#### Examples

#### See Also

- [`compiler-cond`](#op:compiler-cond)

### `compiler-cond` {#op:compiler-cond}

#### Syntax

```
(compiler-cond (<test_0>
                <form_0>)
               (<test_1>
                <form_1>)
               ...
               (otherwise
                <default>))
```

#### Parameters and Values

`test_0`, `test_1`, ..., `test_n`
: A compile-time expression. See below.

`form_0`, `form_1`, ..., `form_n`
: An arbitrary form.

`default`
: An arbitrary form.

#### Description

The `compiler-cond` special operator evaluates the `test` expressions in
sequential order. If one such expression evaluates to true, the entire form is
replaced with the corresponding `form`.

If no `test` expression evaluates to true, the expression is replaced with the
`default` form.

#### Compile-Time Expression Syntax

`(feature? <name>)`
: Evaluates to true if a featuer `name` is present in the compiler's feature
  list. False otherwise.

`(and <exp_0> <exp_1> ... <exp_n>)`
: True if all `exp` expressions are true. False otherwise.

`(or <exp_0> <exp_1> ... <exp_n>)`
: True if any `exp` expressions is true. False otherwise.

`(not <exp>)`
: True if `exp` is false. False otherwise.

#### Examples

#### See Also

- [provide](#op:provide)
