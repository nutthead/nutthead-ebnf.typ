#import "../ebnf.typ": _get-illum-color
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== `_get-illum-color`

#test-rect[
  #context repr(_get-illum-color("dimmed"))
]
