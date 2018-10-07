## Features

### `compiler-cond` {#op:compiler-cond}

#### Syntax

```
(compiler-cond {(<test> <form>)}*
               (:otherwise <default>))
```

#### Parameters and Values

`test`
: A compile-time expression. See below.

`form`
: An arbitrary form.

`default`
: An arbitrary form.

#### Description

The `compiler-cond` SPECIALOP evaluates the `test` expressions in sequential
order. If one such expression evaluates to true, the entire form is replaced
with the corresponding `form`.

If no `test` expression evaluates to true, the expression is replaced with the
`default` form.

#### Compile-Time Expression Syntax

`(feature? <name>)`
: Evaluates to true if a featuer `name` is present in the compiler's feature
  list. False otherwise.

`(and <exp>+)`
: True if all `exp` expressions are true. False otherwise.

`(or <exp>+)`
: True if any `exp` expressions is true. False otherwise.

`(not <exp>)`
: True if `exp` is false. False otherwise.

#### Examples

#### See Also

None.
