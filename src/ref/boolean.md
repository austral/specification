## Boolean Operations

### `and` {#op:and}

#### Syntax

```
(and <exp>+)
```

#### Parameters and Values

`exp`
: An expression of type &boolean;.

#### Description

The `and` &specialop; evaluates forms one at a time, from left to right,
returning `false` as soon as a form evaluates to `false`. If all forms evaluate
to `true`, it returns `true`.

#### Examples

```
(and true true)   ⇒ true
(and true false)  ⇒ false
(and false false) ⇒ false
```

#### See Also

- [`or`](#op:or)
- [`not`](#op:not)

### `or` {#op:or}

#### Syntax

```
(or <exp>+)
```

#### Parameters and Values

`exp`
: An expression of type &boolean;.

#### Description

The `or` &specialop; evaluates forms one at a time, from left to right,
returning `true` as soon as a form evaluates to `true`. If all forms evaluate to
`false`, it returns `false`.

#### Examples

```
(or true false)  ⇒ true
(or true true)   ⇒ true
(or false false) ⇒ false
```

#### See Also

- [`and`](#op:and)
- [`not`](#op:not)

### `not` {#op:not}

#### Syntax

```
(not <form>)
```

#### Parameters and Values

`form`
: An expression of type &boolean;.

#### Description

The `not` function returns `true` if its argument is false, `false` otherwise.

#### Examples

```
(not true) ⇒ false
```

#### See Also

- [`and`](#op:and)
- [`or`](#op:or)
