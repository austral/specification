## Modules

### `defmodule` {#op:defmodule}

#### Syntax

```
(defmodule <name>
  [<use>]
  [<local-nicknames>]
  <import>*
  <export>*)

<use> := (:use <use-name>*)

<local-nicknames> := (:module-local-nicknames (<nickname> <fullname>)*)

<import> := (:import-from <import-name> <symbol>*)

<export> := (:export <export-name>*)
```

#### Parameters and Values

`name`
: The module name, a symbol.

`use-name`
: The name of a module to use, a symbol.

`nickname`
: A module-local nickname for another module, a symbol.

`fullname`
: The module name a nickname is associated to, a symbol.

`import-name`
: The name of a module to import symbols from.

`symbol`
: A symbol exported by the module named `import-name`.

`export-name`
: A symbol to export from this module.

#### Description

The `defmodule` SPECIALOP defines a new module.

#### Examples

### `in-module` {#op:in-module}

#### Syntax

```
(in-module <name>)
```

#### Parameters and Values

`name`
: A module name.

#### Description

The `in-module` SPECIALOP changes the current module to the module named
`name`.

#### Examples

```
(defmodule alpha
  (:use austral))
(in-module alpha)

(defun none () unit
  nil)
;; The fully-qualified name of the above function is `alpha::test`

(defmodule beta
  (:use austral))
(in-module beta)

(defun plusone ((n i64)) i64
  (+ n 1))
;; The fully-qualified name of the above function is `beta::plusone`
```

#### See Also

- [`defmodule`](#op:defmodule)
