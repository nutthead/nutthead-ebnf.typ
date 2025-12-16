#import "../ebnf.typ" : _is-space
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6")

== `_is-space`

#test-rect[
  #_is-space(" ") \
  #_is-space("  ") \
  #_is-space(" a ") \
  #_is-space([ ]) \
  #_is-space([  ]) \
  #_is-space([ a ])
]