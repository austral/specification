# Type System

## Overview

## Type Specifiers

## Type Constraints

## Interfaces

## Affine Types

Affine types are types whose values can appear at most once in a term.

### Semantics of Affine Types

1. A variable with an affine type can appear at most once in its scope.
2. An aggregate type containing an affine type is affine: an array of pointers,
   a record containing a pointer slot, a tuple containing a pointer, etc. are
   all affine types.

For example, the following code is invalid, because `x` appears twice:

```
;; `x` is an array of an affine type
(do-something (nth x 0))
(do-something (nth x 1))
```

Additionally, the following code is invalid, because `x` has been assigned to `y`:

```
;; x is an value with an affine type
(let ((y x))
  (do-something x))
```

## Units of Measure

Units of measure and the magnitudes they measure are defined with
the [`defunit`](#op:defunit) and [`defmagnitude`](#op:defmagnitude) special
operators.

## Type Equality

## Built-in Types

### Unit

#### Type Specifier

```
unit
```

#### Parameters

None.

#### Description

The *unit type*, denoted `unit`, is a type that only allows one value. The *unit
constant* is `nil`.

### Boolean {#type:boolean}

#### Type Specifier

```
boolean
```

#### Parameters

None.

#### Description

The type of Boolean values, denoted `boolean`, has two values: the constants
`true` and `false.

### Characters

#### Type Specifier

```
character
```

#### Parameters

None.

#### Description

The character type, denoted `character`, represents a Unicode scalar value.

### Integers

#### Type Specifier

```
{u8|u16|u32|u64|usize|i8|i16|i32|i64|isize}
```

#### Parameters

None.

#### Description

Austral defines eight integer types, from bytes to 64-bit-wide integers, each in
unsigned and signed variants. The integer types are denoted by the letter `u`
for unsigned integers or the letter `i` for signed integers, followed by its
bit-width. Valid values for the bit width are: 8, 16, 32, 64.

The type denoted by `usize` is essentially equivalent to C's `size_t` type: it
represents an integer large enough to hold the size of the largest possible
array in the machine's memory. The type denoted by `isize` is its signed
variant.

### Real Numbers

Austral supports two approximations of real numbers: IEEE 754 floating point and
fixed point numbers.

#### IEEE 754 Floating Point Numbers

###### Type Specifier

```
{f32|f64}
```

###### Parameters

None.

###### Description

The floating point type denoted by `f32` represents to a single-precision
floating point number. The type `f64` represents a double-precision floating
point number.

#### Fixed Point Numbers

###### Type Specifier

```
(Q <integer> <fractional>)
```

###### Parameters

`integer`
:  The number of integer bits.

`fractional`
: The number of fractional bits.

###### Description

[TBD]

### Complex Numbers

#### Type Specifier

```
(complex <real> <imaginary>)
```

#### Parameters

`real`
: The type specifier of the real part.

`imaginary`
: The type specifier of the imaginary part.

#### Description

Both `real` and `imaginary` type parameters MUST denote the same real-number
type.

### Pointers

### Arrays

#### Fixed-Size Arrays

#### Fixed-Capacity Arrays

#### Resizeable Arrays

### Tuples

#### Type Specifier

```
(tuple <t_1> <t_2> ... <t_n>)
```

#### Parameters

`t_1`, `t_2`, ..., `t_n`
: Arbitrary type specifiers.

#### Description

A tuple is a heterogeneous, fixed-size collection of values.

### Records

#### Type Specifier

```
<name>
```

#### Parameters

`name`
: The name of the record.

#### Description

Record types are a heterogeneous, fixed-size collection of values where each
value is identified by a symbol.

Records are defined with the [`defrecord`](#op:defrecord) operator.

### Unions
