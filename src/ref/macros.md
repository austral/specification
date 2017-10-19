## Macros

### `defmacro` {#op:defmacro}

#### Syntax

```
(defmacro <name>
  [<documentation>]
  <case>+)

<case> = (:match <param-list>
           <body>)

<param-list> = (<positional-param> [:key <keyword-parameter>*))

<positional-param> = <param-name>
<positional-param> = <param-list>

<keyword-parameter> = (<param-name> <default>)

<body> = <form>
<body> = (:unquote <param-name>)
```

#### Parameters and Values

`name`
: The macro name, a &symbol;.

`documentation`
: An optional documentation string.

`param-name`
: The name of a parameter, a &symbol;.

`default`
: The default value of a keyword parameter.

`form`
: An arbitrary &form;.

#### Description

The `defmacro` form defines a new macro.

#### Examples

#### See Also

- [`define-symbol-macro`](#op:define-symbol-macro)

### `define-symbol-macro` {#op:define-symbol-macro}

#### Syntax

```
(define-symbol-macro <name> <form>
  [<documentation>])
```

#### Parameters and Values

`name`
: The macro name, a non-keyword &symbol;.

`form`
: An arbitrary &form;.

`documentation`
: An optional documentation string.

#### Description

The `define-symbol-macro` &specialform; associates a &symbol; `name` with a
&form; `form`. After macroexpansion, all instances of `symbol` are replaced with
`form`.

#### Examples

Given the following definition:

```
(define-symbol-macro pi 3.14
  "The ratio of a circle's circumference to its diameter.")
```

The expression `(* 2 pi)` is equivalent to `(* 2 3.14)`.

#### See Also

- [`defmacro`](#op:defmacro)