## Functions

### `defun` {#op:defun}

#### Syntax

```
(defun <name> <param-list> <return>
  [<documentation>]
  <body>*)
```

#### Parameters and Values

`name`
: The function name, a symbol.

`param-list`
: The function parameter list. See [this section](#fn:concrete-param-list) for
  its description.

`return`
: The function return type.

`documentation`
: The function's documentation form. See [this section](#doc:concrete-fn) for
  its description.

#### Description

The `defun` SPECIALOP defines a [concrete function](#fn:concrete).

If the `body` is omitted, the form is treated as a forward declaration. A future
`defun` form, with the same arguments and a function body, can be used to
provide the function definition.

#### Examples

See [this section](#fn:concrete-examples).

### `definterface` {#op:definterface}

#### Syntax

```
(definterface <name> (<type>)
  [<documentation>]
  (<generic-function>*))

<generic-function> := (<fn> <param-list> <return>
                        [<fn-documentation>]
                        <body>*)
```

#### Parameters and Values

`name`
: The interface name.

`type`
: A type parameter name.

`documentation`
: An optional interface documentation form.

`fn`
: The name of a generic function.

`param-list`
: The function parameter list.

`return`
: The function's return type.

`fn-documentation`
: An optional generic function documentation form.

`body`
: If present, the default implementation of the generic function.

#### Description

The `definterface` SPECIALOP defines an [interface](#type:interface).

#### Examples

See [this section](#fn:interface-examples).

#### See Also

- [`defimplementation`](#op:defimplementation)

### `defimplementation` {#op:defimplementation}

#### Syntax

#### Parameters and Values

#### Description

The `defimplementation` SPECIALOP defines an implementation of
an [interface](#type:interface).

#### Examples

See [this section](#fn:interface-examples).

#### See Also

- [`definterface`](#op:definterface)

### `fn` ### {#op:fn}

#### Syntax

#### Parameters and Values

#### Description

The `fn` special operator returns a pointer to a function (either a concrete
function or a monomorphic instance of a generic function) given the function
name and (in the case of generic functions) its parameter and return types.

#### Examples

#### See Also

- [`call`](#op:call)

### `call` ### {#op:call}

#### Syntax

```
(call <function> <args>*) ;; => <result>
```

#### Parameters and Values

`function`
: A function pointer.

`args`
: An arbitrary number of arguments, potentially including keyword arguments.

`result`
: The result of applying the function to its arguments.

#### Description

The `call` special operator invokes the function pointed to by a function
pointer with a list of arguments.

#### Examples

Assuming a definition of a concrete function `fact` with that takes an integer
and returns its factorial:

```
(call (fn fact) 5) ;; => 120
```

#### See Also

- [`fn`](#op:fn)
