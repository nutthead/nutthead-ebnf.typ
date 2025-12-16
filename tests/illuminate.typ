#import "../ebnf.typ": _illuminate
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_illuminate`

#test-rect[
  #context _illuminate(type: "dimmed")[Foo] \
  #context _illuminate(type: "highlighted")[Bar] \
  #context _illuminate[Baz]
]
