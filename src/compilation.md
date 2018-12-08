# Compilation

## Toplevel Forms

The following special forms can only appear at the toplevel:

- [`defmodule`](#op:defmodule)
- [`in-module`](#op:in-module)
- [`defconstant`](#op:defconstant)
- [`defun`](#op:defun)
- [`defclass`](#op:defclass)
- [`defimplementation`](#op:defimplementation)
- [`deftype`](#op:deftype)
- [`defrecord`](#op:defrecord)
- [`defdisjunction`](#op:defdisjunction)
- [`defmagnitude`](#op:defmagnitude)
- [`defunit`](#op:defunit)
- [`defmacro`](#op:defmacro)
- [`define-symbol-macro`](#op:define-symbol-macro)
- [`provide`](#op:provide)

Other FORMS are allowed at the top level:

1. Arbitrary macros can be macroexpanded at the toplevel.

2. The [`progn`](#op:progn) SPECIALOP can also appear at the toplevel, and its
   contents are treated, recursively, as special forms. Naturally, a
   toplevel [`progn`](#op:progn) returns no values.

3. The [`compiler-cond`](#op:compiler-cond) special operator can also appear at
   the toplevel.
