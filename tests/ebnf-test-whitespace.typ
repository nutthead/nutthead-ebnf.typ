#import "../ebnf.typ": _whitespace
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_white-space`

=== Input

#test-rect[
  ```typ
  #repr(_white-space)
  ```
]

=== Output

#test-rect[
  #repr(_whitespace)
]
