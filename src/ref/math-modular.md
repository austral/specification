## Modular Arithmetic

This section describes operations on integer and fixed-point types that have
modular behaviour on overflow and underflow.

Signed integers MUST use two's complement representation to ensure consistent
behaviour.

### `+`

#### Syntax

```
(+ <lhs> <rhs>)
```

#### Parameters and Values

`lhs`
: The left-hand side of the operation.

`rhs`
: The right-hand side of the operation.

#### Description

The `+` operator performs modular addition on integer and fixed-point types.

The `lhs` and `rhs` expressions must have the same type.

#### Examples

#### See Also

### `-`

#### Syntax

```
(- <minuend> <subtrahend>)
```

#### Parameters and Values

`minuend`
: The expression being subtracted from.

`subtrahend`
: The expression being subtracted.

#### Description

The `-` operator performs modular subtraction on integer and fixed-point types.

The `minuend` and `subtrahend` expressions must have the same type.

#### Examples

#### See Also

### `*`

#### Syntax

```
(* <lhs> <rhs>)
```

#### Parameters and Values

`lhs`
: The left-hand side of the operation.

`rhs`
: The right-hand side of the operation.

#### Description

The `*` operator performs modular multiplication on integer and fixed-point types.

The `lhs` and `rhs` expressions must have the same type.

#### Examples

#### See Also

### `/`

#### Syntax

```
(/ <numerator> <denominator>)
```

#### Parameters and Values

`numerator`
: The numerator.

`denominator`
: The denominator.

#### Description

The `/` operator performs division on a non-zero denominator.

If the type of `numerator` is `t`, the type of `denominator` is `(refined t
(bipartite non-zero))`. Refinements are used to statically ensure the
denominator is non-zero.

#### Examples

#### See Also
