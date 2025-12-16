#import "../ebnf.typ": _get-sym
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_get-sym`

#test-rect[
  #context repr(_get-sym("curly"))
]
