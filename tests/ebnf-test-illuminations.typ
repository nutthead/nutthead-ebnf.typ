#import "../ebnf.typ" : _illuminations
#import "ebnf-test-000-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_illuminations`

=== Input

#test-rect[
  ```typ
  #repr(_illuminations)
  ```
]

=== Output

#test-rect[
  #repr(_illuminations)
]