## C Foreign Function Interface

The C Foreign Function Interface standard extension (CFFI for short) defines
Austral's support for calling C functions and allowing Austral code to be called
from C.

### `address` ### {#cffi:address}

#### Type Specifier

```
(address <type>)
```

#### Parameters

`type`
:   The referenced type.

#### Description

The `address` type represents a potentially null address in memory.

### `paddress` ### {#cffi:paddress}

#### Type Specifier

```
(paddress <type>)
```

#### Parameters

`type`
:   The referenced type.

#### Description

The `paddress` type represents a positive (that is, non-null) address in memory.

### `defcfun`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

### `null-pointer`

#### Syntax

```
(null-pointer <type>) ;; => <address> : (address <type>)
```

#### Parameters and Values

`type`
:   The type specifier of the pointed-to type.

`address`
:   The address of the null pointer.

#### Description

The `null-pointer` SPECIALOP returns the address of the null pointer.

#### Examples

In the following example, the variable `p` has type `(address i32)`:

```
(let ((p (null-pointer i32)))
  (some-foreign-function p))
```

### `malloc`

#### Syntax

```
(malloc <type> <count>) ;; => <address>
```

#### Parameters and Values

`type`
:   The type to allocate.

`count`
:   The number of instances of `type` to allocate contiguously, of type `usize`.

`address`
:   The address of the allocated memory, which is potentially null.

#### Description

The `malloc` SPECIALOP takes a `type` and a `count` of type `usize`, and
attempts to allocate at least enough bytes to hold `(* (size-of type) count)`.

If allocation fails for whatever reason, a null pointer is returned.

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

```
(address-of <var>) ;; => <paddress>
```

#### Parameters and Values

`var`
:   A variable name, a SYMBOL.

`paddress`
:   The [positive address](#cffi:paddress) where the variable's value is stored
    on the stack.

#### Description

The `address-of` SPECIALOP takes a variable name as its input and returns the
[positive address](#cffi:paddress) where that variable's value is stored on the
stack. This is mainly useful for C functions that take a pointer as an argument
and write to that pointer instead of returning a new heap-allocated value: this
allows passing a pointer to a stack-allocated value rather than allocating a new
value on the heap. In hot loops this reduction in memory pressure can save a
great deal of time.

#### Examples

In the following example, `x` is of type `i32` and `(address-of x)` is of type
`(paddress i32)`.

```
(let ((x 10))
  (some-foreign-function (address-of x)))
```

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

```
(size-of u8)  ;; => 1
(size-of u16) ;; => 2
(size-of i64) ;; => 8

(size-of f64) ;; => 8

(size-of (tuple u8 u8 u8)) ;; => 3
```

#### Notes

The return value of `size-of` for a given type is implementation-defined.
