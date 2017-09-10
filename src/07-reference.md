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

## Boolean Operations

### `and` {#op:and}

#### Syntax

```
(and <lhs> <rhs>)
```

#### Parameters and Values

`lhs`, `rhs`
: An expression of type [`boolean`](#type:boolean).

#### Description

The `and` function evaluates to `true` when both arguments are `true`, `false`
otherwise.

#### Examples

```
(and true true)   ⇒ true
(and true false)  ⇒ false
(and false false) ⇒ false
```

#### See Also

- [`or`](#op:or)
- [`not`](#op:not)

### `or` {#op:and}

#### Syntax

```
(or <lhs> <rhs>)
```

#### Parameters and Values

`lhs`, `rhs`
: An expression of type [`boolean`](#type:boolean).

#### Description

The `or` function evaluates to `true` if either argument is `true`, `false`
otherwise.

#### Examples

```
(or true false)  ⇒ true
(or true true)   ⇒ true
(or false false) ⇒ false
```

#### See Also

- [`and`](#op:and)
- [`not`](#op:not)

### `not` {#op:not}

#### Syntax

```
(not <form>)
```

#### Parameters and Values

`form`
: An expression of type [`boolean`](#type:boolean).

#### Description

The `not` function returns `true` if its argument is false, `false` otherwise.

#### Examples

```
(not true) ⇒ false
```

#### See Also

- [`and`](#op:and)
- [`or`](#op:or)

## Arithmetic Operations

## Bitwise Operations

## Assignment

### `set`

## Functions

### `defun` {#op:defun}

#### Syntax

```
(defun <name> <param-list> <return>
  [<documentation>]
  <body>*)
```

#### Parameters and Values

`name`
: The function name, a symbol.

`param-list`
: The function parameter list. See [this section](#fn:concrete-param-list) for
  its description.

`return`
: The function return type.

`documentation`
: The function's documentation expression. See [this section](#doc:concrete-fn)
  for its description.

#### Description

The `defun` special operator defines a [concrete function](#fn:concrete).

#### Examples

See [this section](#fn:concrete-examples).

### `definterface`

### `defmethod`

## Types

### `deftype` {#op:deftype}

### `defrecord` {#op:defrecord}

#### Syntax

```
(defrecord <name> (<param>*)
  [<docstring>]
  [(<slot>*)])

slot := (<slot> <type> <slot-docstring>)
```

#### Parameters and Values

`name`
: The record name, a symbol.

`param`
: A type parameter name.

`docstring`
: An optional documentation string.

`slot`
: The slot name, a symbol.

`type`
: The slot type, a type specifier, potentially including any defined type
  parameters.

`slot-docstring`
: An optional documentation string for the slot.

#### Description

The `defrecord` special operator defines a new [record type](#type:record).

If the definition omits the slot list, the record is assumed to be a
forward-declared record. No operations can be defined on it until the complete
definition is provided. Note that omitting the slot list is not the same as
having an empty slot list.

#### Examples

An undocumented record definition:

```
(defrecord point ()
  ((x f64)
   (y f64)))
```

The same record definition, lightly documented:

```
(defrecord point ()
  "Represents a point in R^2."
  ((x f64)
   (y f64)))
```

The same record definition, fully documented:

```
(defrecord point ()
  "Represents a point in R^2."
  ((x f64 "The X-coordinate.")
   (y f64 "The Y-coordinate.")))
```

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

## Tuples

### `tuple` {#op:tuple}

#### Syntax

```
(tuple <exp>*)
```

#### Parameters and Values

`exp`
: An expression.

#### Description

The `tuple` operator takes a list of values and returns a corresponding tuple of
those values in the given order.

#### Examples

### `proj` {#op:proj}

#### Syntax

```
(proj <tuple> <index>)
```

#### Parameters and Values

`tuple`
: A tuple.

`index`
: A positive non-zero integer constant.

### Description

The `proj` (read "projection") operator takes a tuple and a constant index less
than or equal to the length of the tuple and returns the corresponding tuple
element.

### Examples

```
(proj {1 2 3} 1) ⇒ 1
```

## Unions

### `case`

## Memory

### `allocate`

#### Syntax

```
(allocate <form>)
```

#### Parameters and Values

`form`
: A form.

#### Description

The `allocate` operator takes an arbitrary value as its sole argument, allocates
it on the heap, and returns a [pointer](#type:pointer) to it.

#### Examples

```
(allocate 3.d14) ;; returns a value of type (pointer f64)
```

### `load`

#### Syntax

```
(load <pointer-or-reference>)
```

#### Parameters and Values

`pointer-or-reference`
: A value of type [pointer](#type:pointer) or [reference](#type:reference).

#### Description

The `load` operator takes a pointer or reference and returns the pointed-to
value.

#### Examples

```
(load (allocate 10)) ⇒ 10
```

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
(compiler-cond {(<test> <form>)}*
               (otherwise <default>))
```

#### Parameters and Values

`test`
: A compile-time expression. See below.

`form`
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

`(and <exp>+)`
: True if all `exp` expressions are true. False otherwise.

`(or <exp>+)`
: True if any `exp` expressions is true. False otherwise.

`(not <exp>)`
: True if `exp` is false. False otherwise.

#### Examples

#### See Also

- [provide](#op:provide)
