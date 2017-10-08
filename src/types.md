# Type System

A type is a (potentially infinite) set of objects. An object belongs to a single
type.

Austral has no first-class type values: types are denoted through type
specifiers, which are &forms; that represent types.

New types can be defined
with [`deftype`](#op:deftype), [`defrecord`](#op:defrecord)
and [`defdisjunction`](#op:defdisjunction).

## Type Specifiers

A type specifier is a &form; that denotes a type.

## Interfaces {#type:interface}

## Type Constraints

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

## Type Equality

Type equality is structural, except for records and disjunctions, which use
nominal equality.

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
`true` and `false`.

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

### Floating Point Numbers

#### Type Specifier

```
{f32|f64}
```

#### Parameters

None.

#### Description

The floating point type denoted by `f32` represents to a single-precision
floating point number. The type `f64` represents a double-precision floating
point number.

### Fixed Point Numbers

#### Type Specifier

```
(Q <integer> <fractional>)
```

#### Parameters

`integer`
:  The number of integer bits.

`fractional`
: The number of fractional bits.

#### Description

[TBD]

### Complex Numbers

#### Type Specifier

```
(complex <type>)
```

#### Parameters

`type`
: A real number type specifier.

#### Description

The `type` parameter determines the type of both the real and imaginary parts.

### Pointers {#type:pointer}

#### Syntax

```
(pointer <type>)
```

#### Parameters

`type`
: The pointed-to type.

#### Description

A pointer is an affine value representing the memory location of another value.

### References {#type:reference}

#### Syntax

```
(reference <type> <region>)
```

#### Parameters

`type`
: The referenced type.

`region`
: The name of the region.

#### Description

A reference acts as a pointer without the affine restriction, but with the added
restriction that it is tagged with a region identifier that prevents memory
safety violations.

### Arrays

#### Fixed-Size Arrays {#type:fixed-size-array}

##### Type Specifier

```
(array <type> <size>)
```

##### Parameters

`type`
: The type of the array's elements.

`size`
: The array's length, a positive integer literal.

##### Description

A fixed-size array is an ordered collection of values whose size is known at
compile time.

#### Fixed-Capacity Arrays

##### Type Specifier

```
(carray <type> <capacity>)
```

##### Parameters

`type`
: The type of the array's elements.

`capacity`
: The array's capacity, a positive integer literal.

##### Description

#### Resizeable Arrays

##### Type Specifier

```
(varray <type>)
```

##### Parameters

`type`
: The type of the array's elements.

##### Description

A resizeable array is an affine, heap-allocated ordered collection of values.

### Strings

#### Type Specifier

```
string
```

#### Parameters

None.

#### Description

The `string` type is the type of string literals.

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

### Records {#type:record}

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

### Disjunctions {#type:disjunction}

#### Type Specifier

```
<name>
```

#### Parameters

`name`
: The name of the disjunction.

#### Description

Disjunctions represent sum types: types formed by the logical disjunction of a
set of types.

Disjunctions are defined with the [`defdisjunction`](#op:defdisjunction)
operator.

### Function Pointers

#### Type Specifier

#### Parameters

#### Description

### Refinement Types

#### Type Specifier

#### Parameters

#### Description

### Units of Measure

#### Type Specifier

```
(unit <type> <unit>)
```

#### Parameters

`type`
: A type specifier.

`unit`
: A unit specifier.

#### Description

Units of measure and the magnitudes they measure are defined with
the [`defunit`](#op:defunit) and [`defmagnitude`](#op:defmagnitude) special
operators.