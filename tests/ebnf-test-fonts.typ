#import "../ebnf.typ" : _fonts
#import "ebnf-test-000-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_fonts`

=== Input

#test-rect[
  ```typ
  #repr(_fonts)
  ```
]

=== Output

#test-rect[
  #repr(_fonts)
]