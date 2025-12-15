#import "../ebnf.typ" : _get-def-separator-sym
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_get-def-separator-sym`

=== Input

#test-rect[
  ```typ
  #context repr(_get-def-separator-sym())
  ```
]

=== Output

#test-rect[
  #context repr(_get-def-separator-sym())
]
