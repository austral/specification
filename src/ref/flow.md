## Control Flow

### `progn` {#op:progn}

#### Syntax

```
(progn <exp>*) ;; => <result>
```

#### Parameters and Values

`exp`
: A form.

`result`
: If the `progn` expression is non-empty, the result of evaluting the last
  `exp`. If the `progn` expression is empty, `nil`.

#### Description

The `progn` &specialform; evaluates every &form; in the order in which they
appear, discarding every value but the last. The last value is returned.

If `progn` appears as a toplevel form (for example, as the result of
macroexpansion), all of its &forms; are considered toplevel forms.

#### Examples

```
(progn)       ;; => nil
(progn 1 2 3) ;; => 3
```

#### See Also

None.

### `if` {#op:if}

#### Syntax

```
(if <test> <consequent> <alternate>) ;; => <result>

(if (:likely <test>) <consequent> <alternate>) ;; => <result>

(if (:unlikely <test>) <consequent> <alternate>) ;; => <result>
```

#### Parameters and Values

`test`
: An expression of type &boolean;.

`consequent`
: An expression that will be evaluated if condition evaluates to `true`.

`alternate`
: An expression that will be evaluated if condition evaluates to `false`.

`result`
: The value of evaluating either the `consequent` or `alternate` expression.

#### Description

The `if` &specialform; evaluates the `test` expression unconditionally. If the
test was `true`, it evaluates the `consequent` and returns it. Otherwise, it
evaluates the `alternate`. Both `consequent` and `alternate` expressions must be
of the same type.

Branch prediction information can be provided to the compiler, which MAY
(depending on the implementation, the underlying ISA, and machine description)
generate code that takes advantage of it. To provide branch prediction
information, it suffices to replace the `test` &form; with the &form; `(:likely
<test>)` to indicate the `test` is likely to evaluate to `true`, and `(:unlikely
<test>)` otherwise.

#### Examples

```
(if true 1 0) ;; => 1

(if false 1 0) ;; => 0
```

Using branch prediction hints:

```
(if (:likely (test-that-is-usually-true))
    (true-branch)
    (false-branch))
```

#### See Also

- [`cond`](#op:cond)
- [`when`](#op:when)
- [`unless`](#op:unless)

#### Notes

The expression:

```
(if (test) (consequent) (alternate))
```

Is equivalent to:

```
(cond ((test) (consequent)) (:otherwise (alternate)))
```

### `cond` {#op:cond}

#### Syntax

```
(cond <case>* (:otherwise <default>*))

case := (<test> <consequent>*)
```

#### Parameters and Values

`test`
: An expression of type &boolean;.

`consequent`
: An &iprogn;.

`default`
: An &iprogn;.

#### Description

The `cond` &specialop; evaluates `test` forms one at a time, in the order in
which they appear, until one of them evaluates to `true`. The `consequent`
corresponding to that test is evaluated and returned as the value of the `cond`
expression. If no `test` form evaluates to `true`, the `default` form is
evaluated and returned as the value of the `cond` expression.

All `consequent` forms of a `cond` expression must have the same type.

#### Examples

```
(cond ((< a 0)
       "Less than zero")
      ((> a 0)
       "Greater than zero")
      (:otherwise
       "Exactly zero"))
```

#### See Also

- [`if`](#op:if)
