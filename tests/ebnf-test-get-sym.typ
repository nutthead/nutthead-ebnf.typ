#import "../ebnf.typ": _get-sym
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_get-sym`

=== Input

#test-rect[
  ```typ
  #context repr(_get-sym("curly"))
  ```
]

=== Output

#test-rect[
  #context repr(_get-sym("curly"))
]
