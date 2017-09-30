# Appendix B: Name Mangling Algorithm

The following algorithm reduces symbols from their full alphabet to an alphabet
made up of alphanumeric characters and the underscore.

To mangle the name of a module or the name part of a symbol:

1. Leave alphanumeric characters as-is.
2. Transform the following non-alphanumeric characters to the following strings:

```
. ⇒ _Pd
! ⇒ _Ex
# ⇒ _Po
$ ⇒ _do
% ⇒ _pe
& ⇒ _am
' ⇒ _qu
* ⇒ _mu
+ ⇒ _pl
- ⇒ _mi
/ ⇒ _fs
< ⇒ _lt
= ⇒ _eq
> ⇒ _gt
? ⇒ _qu
@ ⇒ _at
\ ⇒ _bs
~ ⇒ _ho
^ ⇒ _ca
| ⇒ _pi
```

To mangle a symbol:

1. Begin by mangling the module name using the above algorithm.
2. Append two underscores (`__`) after the mangled module name.
3. Mangle the symbol name using the above algorithm, append this after the two
   underscores.

To mangle a concrete function:

1. Begin with the string `_Af`.
2. Append the mangled form of the function name using the algorithm for mangling
   symbols.

To mangle a concrete type, record or disjunction:

1. Begin with the string `_At`.
2. Append the mangled form of the type name using the algorithm for mangling
   symbols.
