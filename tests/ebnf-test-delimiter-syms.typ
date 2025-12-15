#import "../ebnf.typ" : _delimiter-syms
#import "ebnf-test-000-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_delimiter-syms`

=== Input

#test-rect[
  ```typ
  #repr(_delimiter-syms)
  ```
]

=== Output

#test-rect[
  #repr(_delimiter-syms)
]