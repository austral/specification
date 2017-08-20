# Language Reference

## Control Flow

### `progn`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `if` {#op:if}

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `cond` {#op:cond}

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `and`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `or`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `not`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `when`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

### `unless`

#### Syntax

#### Parameters and Values

#### Description

#### Examples

#### See Also

## Bindings

### `let`

### `defconstant`

## Assignment

### `set`

## Functions

### `defun` {#op:defun}

### `definterface`

### `defmethod`

## Types

### `deftype`

### `defmagnitude`

### `defunit`

### `the`

## Macros

### `defmacro`

### `define-symbol-macro`

### `symbol-macrolet`

## Modules

### `defmodule`

### `in-module`

## Characters

### `character-code`

### `code-character`

## Tuples

### `tuple`

### `!`

## Unions

### `case`

## Memory

### `allocate`

### `load`

### `borrowing`

## Features

### `provide`

#### Syntax

```
(provide <feature>)
```

#### Parameters and Values

`feature`
    The feature name, a symbol.

#### Description

The `provide` special operator adds the feature `feature` to the compiler's
feature set.

Repeated invocations of `provide` with the same feature name MUST produce a
warning to the user.

#### Examples

#### See Also

- [`compiler-cond`](#op:compiler-cond)

### `compiler-cond` {#op:compiler-cond}

#### Syntax

```
(compiler-cond (<test_0>
                <form_0>)
               (<test_1>
                <form_1>)
               ...
               (otherwise
                <default>))
```

#### Parameters and Values

`test_0`, `test_1`, ..., `test_n`
: A compile-time expression. See below.

`form_0`, `form_1`, ..., `form_n`
: An arbitrary form.

`default`
: An arbitrary form.

#### Description

The `compiler-cond` special operator evaluates the `test` expressions in
sequential order. If one such expression evaluates to true, the entire form is
replaced with the corresponding `form`.

If no `test` expression evaluates to true, the expression is replaced with the
`default` form.

#### Compile-Time Expression Syntax

`(feature? <name>)`
: Evaluates to true if a featuer `name` is present in the compiler's feature
  list. False otherwise.

`(and <exp_0> <exp_1> ... <exp_n>)`
: True if all `exp` expressions are true. False otherwise.

`(or <exp_0> <exp_1> ... <exp_n>)`
: True if any `exp` expressions is true. False otherwise.

`(not <exp>)`
: True if `exp` is false. False otherwise.

#### Examples

#### See Also
