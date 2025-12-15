#import "../ebnf.typ": _get-illum-color
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_get-illum-color`

=== Input

#test-rect[
  ```typ
  #context repr(_get-illum-color("dimmed"))
  ```
]

=== Output

#test-rect[
  #context repr(_get-illum-color("dimmed"))
]
