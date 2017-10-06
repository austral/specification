# Modules

## Symbol Resolution Algorithm

To resolve a fully qualified symbol:

1. Look up the module name in the current module's list of nicknames.
    - If it's a nickname, replace it with its full module name.
    - Otherwise, leave it as-is.
2. Look up the new module name in the compiler's list of known modules.
    - If it  doesn't exist, signal an error.
    - If it does exist, look up the symbol name in the module's export list.
        - If the symbol is not exported by the module, signal an error.
        - Otherwise, the symbol is valid.

To resolve an unqualified symbol:

1. Look up the symbol name in the list of symbol names imported from other
   modules or implicitly imported by `:use`ing other modules.
    - If the symbol is there, it's equivalent to a symbol qualified by the name
      of the corresponding module.
    - Otherwise, the symbol is in the current module.
