#import "../ebnf.typ": _sym-prod
#import "ebnf-test-000-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_sym-prod`

=== Input

#test-rect[
  ```typ
  #repr(_sym-prod)
  ```
]

=== Output

#test-rect[
  #repr(_sym-prod)
]
