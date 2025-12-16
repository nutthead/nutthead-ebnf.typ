#import "../ebnf.typ": _to-sym-key
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_to-sym-key`

#test-rect[
  #repr(_to-sym-key("foo"))
]
