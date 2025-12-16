#import "../ebnf.typ" : _trim-str
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_trim-str`

#test-rect[
  |#_trim-str("  Hello  ")|
]