# Functions

## Concrete Functions {#fn:concrete}

*Concrete functions* are defined using the [`defun`](#op:defun) special
operator. In a concrete function definition, the types of all parameters and the
return type MUST be specified and MUST be concrete types.

### Concrete Function Parameter Lists {#fn:concrete-param-list}

The parameter list of a concrete function is of the form:

```
(<named-parameter>* [&key <keyword-parameter>*))

named-parameter := (<name> <type>)

keyword-parameter := (<name> <type> [<default> [<supplied>]])
```

Where:

`name`
: The name of a parameter, a symbol.

`type`
: A concrete type specifier.

`default`
: For keyword parameters, an expression which will be used to provide a default
  value.

`supplied`
: The name of a [`boolean`](#type:boolean) variable whose value is `true` when
  its corresponding parameter was supplied an argument at the call site, and
  `false` when the default value was used instead.

Note that, when a keyword parameter defines a default value, and the
corresponding function is called without supplying an argument to that
parameter, the default argument form is evaluated at the call site. That is,
given a function definition:

```
(defun add (&key (lhs i64) (rhs i64 0)) i64
  (+ lhs rhs))
```

The following call:

```
(add :lhs 1)
```

Is equivalent to writing:

```
(add :lhs 1 :rhs 0)
```

This precludes a class of defects where, in languages where default argument
expressions are evaluated once and treated as references, mutiple calls to a
function with the same arguments will produce different results by (potentially
unwittingly) mutating a default argument value.

### Examples {#fn:concrete-examples}

Below is an implementation of the recursive Fibonacci function. Both the range
and codomain are unsigned 64-bit integers.

```
(defun fibonacci ((n u64)) u64
  "Return the nth fibonacci number."
  (if (< n 2)
      n
      (+ (fibonacci (- n 1))
         (fibonacci (- n 2)))))

(fibonacci 5)  ⇒ 5
(fibonacci 30) ⇒ 832040
```

A more extensively documented, equivalent function:

```
(defun fibonacci ((n u64)) u64
  (:documentation "Return the nth fibonacci number."
    (:param n "The index in the sequence of Fibonacci numbers.")
    (:return "The corresponding Fibonacci number."))
  (if (< n 2)
      n
      (+ (fibonacci (- n 1))
         (fibonacci (- n 2)))))
```

## Interfaces, Generic Functions and Methods

### Interfaces

#### Examples

### Generic Functions

#### Examples

### Methods

#### Examples
