# Documentation #

Austral supports structured documentation FORMS.

## Documentation Form Syntax ##

In every case, a documentation form is either a string literal, or the more
complex structured FORM described in the *Syntax* subsections below.

### Concrete Functions ### {#doc:concrete-fn}

The documentation form for the [`defun`](#op:defun) special operator allows
documenting parameters, the return value, and adding deprecation warnings.

#### Syntax

```
(:documentation <description>
  [(:param <param> <param-desc>)*]
  [(:return <return>)]
  [(:deprecation <deprecation>)])
```

#### Parameters

`description`
: A string literal describing the function's purpose.

`param`
: A parameter name, a symbol.

`param-desc`
: A string literal describing the corresponding parameter.

`return`
: A string literal describing the function's return value.

`deprecation`
: A string literal describing why the function should not be used. The compiler
  MUST issue a warning for all instances of calls to this function.
