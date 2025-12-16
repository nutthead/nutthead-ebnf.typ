#import "../ebnf.typ": _get-config, _update-config
#import "_ebnf-test-utils.typ": *
#set page(paper: "a6", flipped: true)

== `_update-config`

#test-rect[  
  #context repr(_get-config("sym-prod")) \
  #context _update-config("sym-prod", "=") \
  #context repr(_get-config("sym-prod"))
]

