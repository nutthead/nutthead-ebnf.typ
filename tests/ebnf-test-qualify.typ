#import "../ebnf.typ": _qualify
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_qualify`

#test-rect[
  #context _qualify(type: "opt")[Foo] \
  #context _qualify(type: "some")[Bar] \
  #context _qualify(type: "any")[Baz]
]
