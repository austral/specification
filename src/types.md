# Type System

A type is a (potentially infinite) set of objects. An object belongs to a single
type.

Austral has no first-class type values: types are denoted through type
specifiers, which are FORMS that represent types.

New types can be defined
with [`deftype`](#op:deftype), [`defrecord`](#op:defrecord)
and [`defdisjunction`](#op:defdisjunction).

## Type Specifiers

A type specifier is a FORM that denotes a type.

## Type Equality

Type equality is structural, except for records and disjunctions, which use
nominal equality.

## Built-in Types

### Scalar Types

#### Unit

##### Type Specifier

```
unit
```

##### Parameters

None.

##### Description

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

### Static Arrays

#### Type Specifier

```
(static-array <type>)
```

#### Parameters

`type`
:   The type of the array's elements.

#### Description

Static arrays are immutable, statically allocated arrays. The most common
example of a static array is string literals.

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
