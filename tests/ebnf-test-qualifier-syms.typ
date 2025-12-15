#import "../ebnf.typ": _qualifier-syms
#import "ebnf-test-000-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_qualifier-syms`

=== Input

#test-rect[
  ```typ
  #repr(_qualifier-syms)
  ```
]

=== Output

#test-rect[
  #repr(_qualifier-syms)
]
