#import "../ebnf.typ" : _get-def-separator-sym
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_get-def-separator-sym`

#test-rect[
  #context repr(_get-def-separator-sym())
]
