#import "../ebnf.typ": _to-illum-key
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_to-illum-key`

#test-rect[
  #repr(_to-illum-key("foo"))
]
