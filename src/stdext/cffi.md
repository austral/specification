## C Foreign Function Interface

The C Foreign Function Interface standard extension (CFFI for short) defines
Austral's support for calling C functions and allowing Austral code to be called
from C.

### `address`

#### Type Specifier

#### Parameters

#### Description

### `paddress`

#### Type Specifier

#### Parameters

#### Description

### `defcfun`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

### `null-pointer`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

### `malloc`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

### `free`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

### `load`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

### `store`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

### `address-offset`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

### `address-of`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

### `size-of`

#### Syntax

```
(size-of <type>) ;; => <size> : usize
```

#### Parameters and Values

`type`
:   A type specifier.

`size`

:   The size of `type` in bytes.

#### Description

The `size-of` SPECIALOP returns the size of the given type in bytes.

#### Examples
