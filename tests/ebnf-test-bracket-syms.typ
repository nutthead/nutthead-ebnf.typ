#import "../ebnf.typ": _bracket-syms
#import "ebnf-test-000-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_bracket-syms`

=== Input

#test-rect[
  ```typ
  #repr(_bracket-syms)
  ```
]

=== Output

#test-rect[
  #repr(_bracket-syms)
]
