#import "../ebnf.typ" : _trim
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6")

== `_trim`

#test-rect[
  |#_trim(" Hello  String ")| \
  |#_trim[ Hello Content ]| \
  |#_trim[ #[ Hello ]-#[ World ] ]|
]

=== Representation of \``[  #[  Hello  ] #[  World  ]  ]`\`

#repr[  #[  Hello  ] #[  World  ]  ]