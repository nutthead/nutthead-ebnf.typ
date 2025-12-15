#import "../ebnf.typ": _to-illum-key
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_to-illum-key`

=== Input

#test-rect[
  ```typ
  #repr(_to-illum-key("foo"))
  ```
]

=== Output

#test-rect[
  #repr(_to-illum-key("foo"))
]
