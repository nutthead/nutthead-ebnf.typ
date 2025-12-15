#import "../ebnf.typ" : _is-space
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6")

== Test: `_is-space`

=== Input

#test-rect[
  ```typ
  #_is-space(" ") \
  #_is-space("  ") \
  #_is-space(" a ") \
  #_is-space([ ]) \
  #_is-space([  ]) \
  #_is-space([ a ])
  ```
]

=== Output

#test-rect[
  #_is-space(" ") \
  #_is-space("  ") \
  #_is-space(" a ") \
  #_is-space([ ]) \
  #_is-space([  ]) \
  #_is-space([ a ])
]