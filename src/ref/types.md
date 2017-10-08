## Types

### `deftype` {#op:deftype}

#### Syntax

```
(deftype <name> (<param>*)
  [<docstring>]
  <definition>)
```

#### Parameters and Values

`name`
: The type name.

`param`
: A type parameter.

`docstring`
: An optional type docstring.

`definition`
: A type specifier.

#### Description

#### Examples

```
(deftype usize ()
  u64)
```

#### See Also

- [`defrecord`](#op:defrecord)
- [`defdisjunction`](#op:defdisjunction)

### `defrecord` {#op:defrecord}

#### Syntax

```
(defrecord <name> (<param>*)
  [<docstring>]
  [(<slot>*)])

slot := (<slot> <type> <slot-docstring>)
```

#### Parameters and Values

`name`
: The record name, a symbol.

`param`
: A type parameter name.

`docstring`
: An optional documentation string.

`slot`
: The slot name, a symbol.

`type`
: The slot type, a type specifier, potentially including any defined type
  parameters.

`slot-docstring`
: An optional documentation string for the slot.

#### Description

The `defrecord` &specialop; defines a new [record type](#type:record).

If the definition omits the slot list, the record is assumed to be a
forward-declared record. No operations can be defined on it until the complete
definition is provided. Note that omitting the slot list is not the same as
having an empty slot list.

#### Examples

An undocumented record definition:

```
(defrecord point ()
  ((x f64)
   (y f64)))
```

The same record definition, lightly documented:

```
(defrecord point ()
  "Represents a point in R^2."
  ((x f64)
   (y f64)))
```

The same record definition, fully documented:

```
(defrecord point ()
  "Represents a point in R^2."
  ((x f64 "The X-coordinate.")
   (y f64 "The Y-coordinate.")))
```

#### See Also

- [`deftype`](#op:deftype)
- [`defdisjunction`](#op:defdisjunction)

### `defdisjunction` {#op:defdisjunction}

#### Syntax

```
(defdisjunction <name> (<param>*)
  [<docstring>]
  [(<case>*)])

case := (<case-name> (<case-slot>*) [<case-docstring>])

case-slot := (<slot-name> <slot-type>)
```

#### Parameters and Values

#### Description

The `defdisjunction` special form defines a [disjunction](#type:disjunction).

#### Examples

The following disjunction contains two constructors and has no type parameters
or values, making it equivalent to an enumeration in C:

```
(defdisjunction parity ()
  ((even ())
   (odd ())))
```

Instances of this disjunction can be instantiated by calling the constructors
with no arguments: `(even)` creates an instance of the `even` variant of
`parity`, `(odd)` creates an instance of the `odd` variant.

Another enumeration-equivalent disjunction, this time with documentation
strings:

```
(defdisjunction color ()
  "Represents one of three colors."
  ((red () "Red")
   (green () "Green")
   (blue () "Blue")))
```

Instances of `color` are instantiated as described above: `(red)`, `(green)` and
`(blue)` create instances of their corresponding variants.

The following disjunction contains a type parameter:

```
(defdisjunction list (T)
  "A list is either the empty list or a cons cell."
  ((empty ()
     "The empty list")
   (cons
     ((head T "The list head")
      (rest (reference (list T)) "The rest of the list"))
     "A cons cell")))
```

Because the `empty` case has no values, its constructor is ambigious: a bare
call like `(empty)` would have the abstract type `(list T)`. Because Austral
doesn't use type inference, the ambigious call mus be resolved by calling it
within the context of a [`the`](#op:the) form: `(the (list i32) (empty))` would
create an instance of the `empty` case of `(list i32)`.

The `cons` constructor, however, contains in its arguments the type parameter
`T`, so there's enough information in a `cons` call to deduce its return type. A
call like:

```
(cons 3.f14 (refer (the (list f32) (empty))))
```

Would create an instance of `(list f32)`.

An example of a disjunction where all constructors are ambigous is the following:

```
(defdisjunction either (L R)
  ((left L
    "The left case.")
   (right R
    "The right case.")))
```

A call like `(the (either i32 f32) (left 12))` would instantiate the left case,
while `(the (either i32 f32) (right 3.f14))` would instantiate the right case.

#### See Also

- [`deftype`](#op:deftype)
- [`defrecord`](#op:defrecord)

### `defmagnitude` {#op:defmagnitude}

#### Syntax

```
(defmagnitude <name>
  [<documentation>]
  (:canonical <unit>)
```

#### Parameters and Values

`name`
: The name of the magnitude.

`documentation`
: An optional documentation string.

`unit`
: The canonical unit of this magnitude, a unit expression.

#### Description

The `defmagnitude` &specialop; defines a magntiude. A magnitude represents a
physical property that can be quantified, e.g. length or mass. Magnitudes can be
represented by different units.

#### Examples

```
(defmagnitude mass
  "The mass of an object."
  (:canonical gram))
```

#### See Also

- [`defunit`](#op:defunit)

### `defunit` {#op:defunit}

#### Syntax

```
(defunit <name>
  [<documentation>]
  (:magnitude <magnitude>)
  [(:nicknames <nickname>+)]
  (:factor <factor>))
```

#### Parameters and Values

#### Description

The `defunit` &specialop; defines a new unit of a specific magnitude.

Units can have multiple nicknames, for instance, `m` can be defined as a
nickname for `meter`.

#### Examples

```
(defunit meter
  "An SI meter."
  (:magnitude length)
  (:nicknames m)
  (:factor 1.0))

(defunit foot
  "A foot."
  (:magnitude length)
  (:nicknames ft)
  (:factor 3.281))
```

#### See Also

- [`defmagnitude`](#op:defmagnitude)

### `the` {#op:the}

#### Syntax

```
(the <type> <exp>)
```

#### Parameters and Values

`type`
: A type specifier.

`exp`
: An expression.

#### Description

The `the` special operator creates instances of types from compatible values of
potentially different types.

#### Examples

```
(the u8 23) ⇒ 23 : u8
```

#### See Also

None.
