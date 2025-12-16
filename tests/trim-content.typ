#import "../ebnf.typ" : _trim-content
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_trim-content`

#test-rect[
  |#_trim-content[  Hello  ]|
]