#import "../ebnf.typ": _namespace
#import "ebnf-test-000-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_namespace`

=== Input

#test-rect[
  ```typ
  #repr(_namespace)
  ```
]

=== Output

#test-rect[
  #repr(_namespace)
]
