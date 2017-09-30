# Language Reference

This section documents the functionality an Austral implementation MUST provide
from the `austral` module.

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

(if (:likely <test>) <consequent> <alternate>) ⇒ <result>

(if (:unlikely <test>) <consequent> <alternate>) ⇒ <result>
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

Branch prediction information can be provided to the compiler, which MAY
(depending on the implementation, the underlying ISA, and machine description)
generate code that takes advantage of it. To provide branch prediction
information, it suffices to replace the test form with the form `(:likely
<test>)` to indicate the `test` is likely to evaluate to `true`, and `(:unlikely
<test>)` otherwise.

#### Examples

```
(if true 1 0) ⇒ 1

(if false 1 0) ⇒ 0
```

Using branch prediction hints:

```
(if (:likely (test-that-is-usually-true))
    (true-branch)
    (false-branch))
```

#### See Also

- [`cond`](#op:cond)
- [`when`](#op:when)
- [`unless`](#op:unless)

#### Notes

The expression:

```
(if (test) (consequent) (alternate))
```

Is equivalent to:

```
(cond ((test) (consequent)) (:otherwise (alternate)))
```

### `cond` {#op:cond}

#### Syntax

```
(cond <case>* (:otherwise <default>*))

case := (<test> <consequent>*)
```

#### Parameters and Values

`test`
: An expression of type [`boolean`](#type:boolean).

`consequent`
: An [implicit `progn`](#g:implicit-progn).

`default`
: An [implicit `progn`](#g:implicit-progn).

#### Description

The `cond` special operator evaluates `test` forms one at a time, in the order
in which they appear, until one of them evaluates to `true`. The `consequent`
corresponding to that test is evaluated and returned as the value of the `cond`
expression. If no `test` form evaluates to `true`, the `default` form is
evaluated and returned as the value of the `cond` expression.

All `consequent` forms of a `cond` expression must have the same type.

#### Examples

```
(cond ((< a 0)
       "Less than zero")
      ((> a 0)
       "Greater than zero")
      (:otherwise
       "Exactly zero"))
```

#### See Also

- [`if`](#op:if)

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

### `modular-arithmetic`

#### Description

The `modular-arithmetic` interface defines the basic arithmetic operations, and
provides implementations for all built-in numeric types.

Arithmetic operations overflow using two's complement representation.

#### Generic Functions

`+ ((lhs type) (rhs type)) type`
: The `+` generic function performs modular addition.

`- ((minuend type) (subtrahend type)) type`
: The `-` generic function performs modular subtraction.

`* ((lhs type) (rhs type)) type`
: The `*` generic function performs modular multiplication.

`/ ((numerator type) (denominator (refined type (bipartite non-zero)))) type`
: The `/` generic function performs modular division on a non-zero denominator.

#### Examples

#### Notes

A possible definition of the inferface:

```
(definterface modular-arithmetic (type)
  ((+ ((lhs type) (rhs type)) type
    "Addition")
   (- ((minuend type) (subtrahend type)) type
    "Subtraction")
   (* ((lhs type) (rhs type)) type
    "Multiplication")
   (/ ((numerator type) (denominator (refined type (bipartite non-zero)))) type
     "Division")))
```

### `saturation-arithmetic`

#### Description

The `saturation-arithmetic` interface defines saturation arithmetic
operations. Overflow "clamps" on the maximum or minimum values.

#### Generic Functions

`^+ ((lhs type) (rhs type)) type`
: The `+` generic function performs saturating addition.

`^- ((minuend type) (subtrahend type)) type`
: The `-` generic function performs saturating subtraction.

`^* ((lhs type) (rhs type)) type`
: The `*` generic function performs saturating multiplication.

`^/ ((numerator type) (denominator (refined type (bipartite non-zero)))) type`
: The `/` generic function performs saturating division on a non-zero denominator.

#### Examples

#### Notes

```
(definterface saturation-arithmetic (type)
  ((^+ ((lhs type) (rhs type)) type
    "Saturating addition")
   (^- ((minuend type) (subtrahend type)) type
    "Saturating subtraction")
   (^* ((lhs type) (rhs type)) type
    "Saturating multiplication")
   (^/ ((numerator type) (denominator (refined type (bipartite non-zero)))) type
     "Saturating division")))
```

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

If the `body` is omitted, the form is treated as a forward declaration. A future
`defun` form, with the same arguments and a function body, can be used to
provide the function definition.

#### Examples

See [this section](#fn:concrete-examples).

### `definterface` {#op:definterface}

#### Syntax

```
(definterface <name> (<type>*)
  [<documentation>]
  (<generic-function>*))

<generic-function> := (<fn> <param-list> <return>
                        [<fn-documentation>]
                        <body>*)
```

#### Parameters and Values

`name`
: The interface name.

`type`
: A type parameter name.

`documentation`
: An optional interface documentation form.

`fn`
: The name of a generic function.

`param-list`
: The function parameter list.

`return`
: The function's return type.

`fn-documentation`
: An optional generic function documentation form.

`body`
: If present, the default implementation of the generic function.

#### Description

The `definterface` special operator defines an [interface](#type:interface).

#### Examples

A bare definition of an interface for objects that can be printed to a stream:

```
(definterface printable (T)
  ((print ((instance T) (stream stream)))))
```

A definition with more documentation strings:

```
(definterface printable (T)
  "Printable objects."

  ((print ((instance T) (stream stream))
    "Print a representation of instance to stream.")))
```

#### See Also

- [`defimplementation`](#op:defimplementation)

### `defimplementation` {#op:defimplementation}

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

- [`definterface`](#op:definterface)

## Types

### `deftype` {#op:deftype}

#### Syntax

```
(deftype <name> (<param>*)
  [<docstring>]
  <definition>)
```

#### Parameters and Values

`name`
: The type name.

`param`
: A type parameter.

`docstring`
: An optional type docstring.

`definition`
: A type specifier.

#### Description

#### Examples

```
(deftype usize ()
  u64)
```

#### See Also

- [`defrecord`](#op:defrecord)
- [`defdisjunction`](#op:defdisjunction)

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

#### See Also

- [`deftype`](#op:deftype)
- [`defdisjunction`](#op:defdisjunction)

### `defdisjunction` {#op:defdisjunction}

#### Syntax

```
(defdisjunction <name> (<param>*)
  [<docstring>]
  [(<case>*)])

case := (<case-name> (<case-slot>*) [<case-docstring>])

case-slot := (<slot-name> <slot-type>)
```

#### Parameters and Values

#### Description

The `defdisjunction` special form defines a [disjunction](#type:disjunction).

#### Examples

The following disjunction contains two constructors and has no type parameters
or values, making it equivalent to an enumeration in C:

```
(defdisjunction parity ()
  ((even ())
   (odd ())))
```

Instances of this disjunction can be instantiated by calling the constructors
with no arguments: `(even)` creates an instance of the `even` variant of
`parity`, `(odd)` creates an instance of the `odd` variant.

Another enumeration-equivalent disjunction, this time with documentation
strings:

```
(defdisjunction color ()
  "Represents one of three colors."
  ((red () "Red")
   (green () "Green")
   (blue () "Blue")))
```

Instances of `color` are instantiated as described above: `(red)`, `(green)` and
`(blue)` create instances of their corresponding variants.

The following disjunction contains a type parameter:

```
(defdisjunction list (T)
  "A list is either the empty list or a cons cell."
  ((empty ()
     "The empty list")
   (cons
     ((head T "The list head")
      (rest (reference (list T)) "The rest of the list"))
     "A cons cell")))
```

Because the `empty` case has no values, its constructor is ambigious: a bare
call like `(empty)` would have the abstract type `(list T)`. Because Austral
doesn't use type inference, the ambigious call mus be resolved by calling it
within the context of a [`the`](#op:the) form: `(the (list i32) (empty))` would
create an instance of the `empty` case of `(list i32)`.

The `cons` constructor, however, contains in its arguments the type parameter
`T`, so there's enough information in a `cons` call to deduce its return type. A
call like:

```
(cons 3.f14 (refer (the (list f32) (empty))))
```

Would create an instance of `(list f32)`.

An example of a disjunction where all constructors are ambigous is the following:

```
(defdisjunction either (L R)
  ((left L
    "The left case.")
   (right R
    "The right case.")))
```

A call like `(the (either i32 f32) (left 12))` would instantiate the left case,
while `(the (either i32 f32) (right 3.f14))` would instantiate the right case.

#### See Also

- [`deftype`](#op:deftype)
- [`defrecord`](#op:defrecord)

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

### `the` {#op:the}

#### Syntax

```
(the <type> <exp>)
```

#### Parameters and Values

`type`
: A type specifier.

`exp`
: An expression.

#### Description

The `the` special operator creates instances of types from compatible values of
potentially different types.

#### Examples

```
(the u8 23) ⇒ 23 : u8
```

#### See Also

None.

## Macros

### `defmacro` {#op:defmacro}

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

- [`define-symbol-macro`](#op:define-symbol-macro)

### `define-symbol-macro` {#op:define-symbol-macro}

#### Syntax

```
(define-symbol-macro <name> <form>
  [<documentation>])
```

#### Parameters and Values

`name`
: The macro name, a symbol.

`form`
: An arbitrary form.

`documentation`
: An optional documentation string.

#### Description

The `define-symbol-macro` special operator associates a symbol `name` with a
form `form`. After macroexpansion, all instances of `symbol` are replaced with
`form`.

#### Examples

Given the following definition:

```
(define-symbol-macro pi 3.14
  "The ratio of a circle's circumference to its diameter.")
```

The expression `(* 2 pi)` is equivalent to `(* 2 3.14)`.

#### See Also

- [`defmacro`](#op:defmacro)

### `define-compiler-macro` {#op:define-compiler-macro}

## Modules

### `defmodule` {#op:defmodule}

#### Syntax

```
(defmodule <name>
  [<use>]
  [<local-nicknames>]
  <import>*
  <export>*)

<use> := (:use <use-name>*)

<local-nicknames> := (:module-local-nicknames (<nickname> <fullname>)*)

<import> := (:import-from <import-name> <symbol>*)

<export> := (:export <export-name>*)
```

#### Parameters and Values

`name`
: The module name, a symbol.

`use-name`
: The name of a module to use, a symbol.

`nickname`
: A module-local nickname for another module, a symbol.

`fullname`
: The module name a nickname is associated to, a symbol.

`import-name`
: The name of a module to import symbols from.

`symbol`
: A symbol exported by the module named `import-name`.

`export-name`
: A symbol to export from this module.

#### Description

The `defmodule` special operator defines a new module.

#### Examples

### `in-module` {#op:in-module}

#### Syntax

```
(in-module <name>)
```

#### Parameters and Values

`name`
: A module name.

#### Description

The `in-module` special form changes the current module to the module named
`name`.

#### Examples

```
(defmodule alpha
  (:use austral))
(in-module alpha)

(defun none () unit
  nil)
;; The fully-qualified name of the above function is `alpha::test`

(defmodule beta
  (:use austral))
(in-module beta)

(defun plusone ((n i64)) i64
  (+ n 1))
;; The fully-qualified name of the above function is `beta::plusone`
```

#### See Also

- [`defmodule`](#op:defmodule)

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

#### See Also

- [`proj`](#op:proj)

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

#### Description

The `proj` (read "projection") operator takes a tuple and a constant index less
than or equal to the length of the tuple and returns the corresponding tuple
element.

#### Examples

```
(proj {1 2 3} 1) ⇒ 1
```

#### See Also

- [`tuple`](#op:tuple)

## Disjunctions

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
: The feature name, a symbol.

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
               (:otherwise <default>))
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
