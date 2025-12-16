#import "../ebnf.typ": _to-font-key
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_to-font-key`

#test-rect[
  #repr(_to-font-key("foo"))
]
