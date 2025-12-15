#import "../ebnf.typ" : _trim-str
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_trim-str`

=== Input

#test-rect[
  ```typ
  |#_trim-str("  Hello  ")|
  ```
]

=== Output

#test-rect[
  |#_trim-str("  Hello  ")|
]