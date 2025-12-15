#import "../ebnf.typ": _to-string
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_to-string`

=== Input

#test-rect[
  ```typ
  #repr(_to-string("lorem")) \
  #repr(_to-string([ipsum])) \
  #repr(_to-string([foo *bar* _baz_]))
  ```
]

=== Output

#test-rect[
  #repr(_to-string("lorem")) \
  #repr(_to-string([ipsum])) \
  #repr(_to-string([foo *bar* _baz_]))
]
