#import "../ebnf.typ": _to-sym-key
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_to-sym-key`

=== Input

#test-rect[
  ```typ
  #repr(_to-sym-key("foo"))
  ```
]

=== Output

#test-rect[
  #repr(_to-sym-key("foo"))
]
