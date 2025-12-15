#import "../ebnf.typ": _get-font
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_get-font`

=== Input

#test-rect[
  ```typ
  #context repr(_get-font("default")) \
  #context repr(_get-font("monospaced"))
  ```
]

=== Output

#test-rect[
  #context repr(_get-font("default")) \
  #context repr(_get-font("monospaced"))
]
