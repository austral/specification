## Saturation Arithmetic

This section describes saturation arithmetic operations. Overflow and underflow
"clamp" on the maximum and minimum values, respectively.

### `^+`

#### Syntax

```
(^+ <lhs> <rhs>)
```

#### Parameters and Values

`lhs`
: The left-hand side of the operation.

`rhs`
: The right-hand side of the operation.

#### Description

The `^+` operator performs saturating addition on integer and fixed-point types.

The `lhs` and `rhs` expressions must have the same type.

#### Examples

#### See Also

### `^-`

#### Syntax

```
(^- <minuend> <subtrahend>)
```

#### Parameters and Values

`minuend`
: The expression being subtracted from.

`subtrahend`
: The expression being subtracted.

#### Description

The `^-` operator performs saturating subtraction on integer and fixed-point
types.

The `minuend` and `subtrahend` expressions must have the same type.

#### Examples

#### See Also

### `^*`

#### Syntax

```
(^* <lhs> <rhs>)
```

#### Parameters and Values

`lhs`
: The left-hand side of the operation.

`rhs`
: The right-hand side of the operation.

#### Description

The `^*` operator performs saturating multiplication on integer and fixed-point
types.

The `lhs` and `rhs` expressions must have the same type.

#### Examples

#### See Also

### `^/`

#### Syntax

```
(^/ <numerator> <denominator>)
```

#### Parameters and Values

`numerator`
: The numerator.

`denominator`
: The denominator.

#### Description

The `^/` operator performs saturating division on a non-zero denominator signed
integer or fixed type denominator.

If the type of `numerator` is `t`, the type of `denominator` is `(refined t
(bipartite non-zero))`. Refinements are used to statically ensure the
denominator is non-zero.

Note this function is explicitly not defined for unsigned integer division,
which cannot lead to an overflow condition.

#### Examples

#### See Also
