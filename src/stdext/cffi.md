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

```
(defun can-allocate-successfully () boolean
  (let ((addr (malloc i32 (the usize 10))))
    (if (eq addr (null-pointer i32))
        false
        true)))
```

### `free`

#### Syntax

```
(free <paddress>) ;; => nil
```

#### Parameters and Values

`paddress`
:   The positive address to deallocate.

#### Type Signature

```
forall tau, ((paddress tau)) -> unit
```

#### Description

The `free` generic function takes a positive address as its argument and
deallocates the memory stored there. It returns `nil`.

#### Examples

```
(let ((addr (malloc i32 (the usize 1))))
  (case (paddress? addr)
    ((some paddr)
     ;; Allocation succeeded, so we can call free
     (free paddr))
    (none
     ;; Allocation failed, so do nothing
     nil)))
```

### `load`

#### Syntax

```
(load <paddress>) ;; => <value>
```

#### Parameters and Values

`paddress`
:   The positive address to dereference.

`value`
:   The value at the given memory location.

#### Type Signature

```
forall tau, ((paddress tau)) -> tau
```

#### Description

The `load` generic function takes a positive address as its input, attempts to
dereference it, and returns the value stored at that address.

If the address is not dereferenceable, the consequences are undefined.

#### Examples

Let `ptr` be a positive address of type `(paddress i32)`. Then:

```
(store ptr 10)
(load ptr) ;; => 10
```

### `store`

#### Syntax

```
(store <paddress> <value>) ;; => <value>
```

#### Parameters and Values

`paddress`
:   The positive address to write to.

`value`
:   The value to store at the given address.

#### Type Signature

```
forall tau, ((paddress tau) tau) -> tau
```

#### Description

The `store` generic function takes a positive address and a value and stores the
value at that address. The value is returned.

#### Examples

Let `ptr` be a positive address of type `(paddress i32)`. Then:

```
(store ptr 10)
(load ptr) ;; => 10
```

### `address-offset`

#### Syntax

```
(address-offset <paddress> <offset>) ;; => <result>
```

#### Parameters and Values

`paddress`
:   A positive address.

`offset`
:   An offset of type `usize`.

`result`
:   A positive address.

#### Type Signature

```
forall tau, ((paddress tau) usize) -> (paddress tau)
```

#### Description

The `address-offset` generic function takes a positive address to a type `tau`
and an offset as input and returns a new address displaced by `(* (size-of tau)
offset)`.

More concretely, the result is:

```
(+ paddress (* (size-of tau) offset))
```

#### Examples

Let `p` be a positive address of type `(paddress i32)`. Then:

```
(let ((p' (address-offset p 5)))
  (store p' 10)
  (load p')) ;; => i32
```

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
