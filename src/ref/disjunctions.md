## Disjunctions

### `case`

#### Syntax

```
(case <disjunction>
  <case>*)

<case> = ((<name> <slot>*) <body>+)
```

#### Parameters and Values

`disjunction`
: An expression of a [disjunction](#type:disjunction) type.

`name`
: The name of a case of that disjunction.

`slot`
: The name of a slot in the corresponding case of that disjunction to bind in
  the scope of `body`.

`body`
: An &iprogn;.

#### Description

The `case` &specialform; allows accessing the values of a disjunction in each of
its cases.

An invocation of `case` must exhaustively list all cases of the disjunction.

The bodies of all cases of the `case` &specialform; must have the same type.

#### Examples

Given the following definition:

```
(defdisjunction parity ()
  ((even)
   (odd)))
```

And a function `integer-parity` that takes an integer and returns an instance of
the `parity` disjunction, we can use `case` as follows:

```
(case (integer-parity x)
  ((even)
   ;; Code to run if x is even
   ...)
  ((odd)
   ;; Code to run if x is odd
   ...))
```

The previous example demonstrates the basic usage of `case`, but the `parity`
disjunction doesn't carry any values. With the following definition:

```
(defdisjunction number ()
  ((int ((n i64)))
   (float ((n f64)))
   (fixed ((n (Q 16 16))))))
```

We can use `case` as follows:

```
(case a-number
  ((int n)
   ;; `n` is an immutable variable of type `i64`
   ...)
  ((float n)
   ;; `n` is also immutable, but of type `f64`
   ...)
  ((fixed n)
   ;; Finally, this version of `n` is of type (Q 16 16)
   ...))
```
