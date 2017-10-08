## Equality

### `partial-equivalence`

#### Generic Functions

- `peq ((lhs type) (rhs type)) boolean`

#### Description

The `partial-equivalence` interface defines a generic function for comparing
objects in a partial equivalence relation.

Implementations of this interface must ensure the `peq` operator satisfies the
following properties.

- **Symmetry**: `(peq a b)` implies `(peq b a)`.
- **Transitivity**: the conjunction of`(peq a b)` and `(peq b c)` implies `(peq
  a c)`.

The most salient example is comparing floating-point numbers: because `NaN` is
not equal to itself, floating-point equality is not reflexive.

#### Examples

### `total-equivalence`

#### Generic Functions

- `eq ((lhs type) (rhs type)) boolean`

#### Description

The `total-equivalence` interface defines a generic function for comparing
objects in a total equivalence relation.

Implementations of this interface must ensure the `eq` operator satisfies the
following properties.

- **Reflexivity**: `(peq a a)` is always `true`.
- **Symmetry**: `(peq a b)` implies `(peq b a)`.
- **Transitivity**: The conjunction of`(peq a b)` and `(peq b c)` implies `(peq
  a c)`.

#### Examples
