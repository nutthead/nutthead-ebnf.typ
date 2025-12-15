#import "../ebnf.typ": _to-font-key
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_to-font-key`

=== Input

#test-rect[
  ```typ
  #repr(_to-font-key("foo"))
  ```
]

=== Output

#test-rect[
  #repr(_to-font-key("foo"))
]
