#import "../ebnf.typ": _get-config, _update-config
#import "_ebnf-test-utils.typ": *
#set page(paper: "a6")

== `_get-config`

#test-rect[
  #context repr(_get-config("sym-prod"))
]

