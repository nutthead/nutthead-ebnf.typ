#import "../ebnf.typ" : _definition-separator-syms
#import "ebnf-test-000-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_definition-separator-syms`

=== Input

#test-rect[
  ```typ
  #repr(_definition-separator-syms)
  ```
]

=== Output

#test-rect[
  #repr(_definition-separator-syms)
]