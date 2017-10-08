## Tuples

### `tuple` {#op:tuple}

#### Syntax

```
(tuple <exp>*) ⇒ <result>
```

#### Parameters and Values

`exp`
: An expression.

`result`
: A tuple.

#### Description

The `tuple` operator takes a list of values and returns a corresponding tuple of
those values in the given order.

#### Examples

The following code creates a three-element homogeneous tuple:

```
{1 2 3}
```

The following code creates a two-element tuple of a boolean and a floating point
number:

```
{true 0.0}
```

The following code creates the empty tuple:

```
{}
```

#### See Also

- [`proj`](#op:proj)

### `proj` {#op:proj}

#### Syntax

```
(proj <tuple> <index>)
```

#### Parameters and Values

`tuple`
: A tuple.

`index`
: A positive non-zero integer constant.

#### Description

The `proj` (read "projection") operator takes a tuple and a constant index less
than or equal to the length of the tuple and returns the corresponding tuple
element.

#### Examples

```
(proj {1 2 3} 1) ⇒ 1
```

#### See Also

- [`tuple`](#op:tuple)
