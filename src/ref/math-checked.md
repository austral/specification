## Checked Arithmetic

This section describes operations on integer and fixed-size types that
explicitly check for overflow.

The `checked-arithmetic` interface defines arithmetic operations with explicit
overflow checking. Each operation returns a [tuple](#type:tuple) of a number and
a BOOLEAN indicating whether overflow has occurred.

When overflow has occurred, the value of the number in the [tuple](#type:tuple)
us always the zero value of that type.

### `&+`

#### Syntax

```
(&+ <lhs> <rhs>)
```

#### Parameters and Values

`lhs`
: The left-hand side of the operation.

`rhs`
: The right-hand side of the operation.

#### Description

The `&+` operator performs checked addition on integer and fixed-point types.

The `lhs` and `rhs` expressions must have the same type.

#### Examples

#### See Also

### `&-`

```
(&- <minuend> <subtrahend>)
```

#### Parameters and Values

`minuend`
: The expression being subtracted from.

`subtrahend`
: The expression being subtracted.

#### Description

The `&-` operator performs checked subtraction on integer and fixed-point types.

The `minuend` and `subtrahend` expressions must have the same type.

#### Examples

#### See Also

### `&*`

#### Syntax

```
(&* <lhs> <rhs>)
```

#### Parameters and Values

`lhs`
: The left-hand side of the operation.

`rhs`
: The right-hand side of the operation.

#### Description

The `&*` operator performs checked multiplication on integer and fixed-point
types.

The `lhs` and `rhs` expressions must have the same type.

#### Examples

#### See Also

### `&/`

#### Syntax

```
(&/ <numerator> <denominator>)
```

#### Parameters and Values

`numerator`
: The numerator.

`denominator`
: The denominator.

#### Description

The `&/` operator performs checked division on a non-zero denominator signed
integer or fixed type denominator.

If the type of `numerator` is `t`, the type of `denominator` is `(refined t
(bipartite non-zero))`. Refinements are used to statically ensure the
denominator is non-zero.

Note this function is explicitly not defined for unsigned integer division,
which cannot lead to an overflow condition.

#### Examples

#### See Also
