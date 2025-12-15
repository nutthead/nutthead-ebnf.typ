#import "../ebnf.typ" : _trim-content
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_trim-content`

=== Input

#test-rect[
  ```typ
  |#_trim-content[  Hello  ]|
  ```
]

=== Output

#test-rect[
  |#_trim-content[  Hello  ]|
]