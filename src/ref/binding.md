## Bindings

### `let`

### `defconstant` {#op:defconstant}

#### Syntax

```
(defconstant <name> <value>
  [<documentation>])
```

#### Parameters and Values

`name`
: The name of the constant, a symbol.

`value`
: An expression that evaluates to the constant's value.

`documentation`
: An optional documentation string.

#### Description

The defconstant operator defines a constant value.

#### Examples

```
(defconstant pi 3.141592653589793
  "The ratio of a circle's circumference to its diameter.")
```

#### See Also

None.
