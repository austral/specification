## Memory

### `allocate`

#### Syntax

```
(allocate <form>)
```

#### Parameters and Values

`form`
: A form.

#### Description

The `allocate` operator takes an arbitrary value as its sole argument, allocates
it on the heap, and returns a [pointer](#type:pointer) to it.

#### Examples

```
(allocate 3.d14) ;; returns a value of type (pointer f64)
```

### `load`

#### Syntax

```
(load <pointer-or-reference>)
```

#### Parameters and Values

`pointer-or-reference`
: A value of type [pointer](#type:pointer) or [reference](#type:reference).

#### Description

The `load` operator takes a pointer or reference and returns the pointed-to
value.

#### Examples

```
(load (allocate 10)) ⇒ 10
```

### `borrowing`
