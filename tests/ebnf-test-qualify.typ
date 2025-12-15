#import "../ebnf.typ": _qualify
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_qualify`

=== Input

#test-rect[
  ```typ
  #context _qualify(type: "opt")[Foo] \
  #context _qualify(type: "some")[Bar] \
  #context _qualify(type: "any")[Baz]
  ```
]

=== Output

#test-rect[
  #context _qualify(type: "opt")[Foo] \
  #context _qualify(type: "some")[Bar] \
  #context _qualify(type: "any")[Baz]
]
