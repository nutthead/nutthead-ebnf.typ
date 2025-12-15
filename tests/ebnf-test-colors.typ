#import "../ebnf.typ" : _colors
#import "ebnf-test-000-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_colors`

=== Input

#test-rect[
  ```typ
  #repr(_colors)
  ```
]

=== Output

#test-rect[
  #repr(_colors)
]