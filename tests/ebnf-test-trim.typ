#import "../ebnf.typ" : _trim
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6")

== Test: `_trim`

=== Input

#test-rect[
  ```typ
  |#_trim(" Hello  String ")| \
  |#_trim[ Hello Content ]| \
  |#_trim[ #[ Hello ]-#[ World ] ]|
  ```
]

=== Output

#test-rect[
  |#_trim(" Hello  String ")| \
  |#_trim[ Hello Content ]| \
  |#_trim[ #[ Hello ]-#[ World ] ]|
]

=== Representation of \``[  #[  Hello  ] #[  World  ]  ]`\`

#repr[  #[  Hello  ] #[  World  ]  ]