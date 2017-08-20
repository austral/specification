# Functions

## Concrete Functions

*Concrete functions* are defined using the [`defun`](#op:defun) special
operator. In a concrete function definition, the types of all parameters and the
return type MUST be specified and MUST be concrete types.

### Examples

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
