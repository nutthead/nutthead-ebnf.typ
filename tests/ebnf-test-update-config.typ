#import "../ebnf.typ": _get-config, _update-config
#import "ebnf-test-000-utils.typ": *
#set page(paper: "a6", flipped: true)

== Test: `_update-config`

=== Input

#test-rect[
  ```typ
  #context repr(_get-config("sym-prod")) \
  #_update-config("sym-prod", "=")
  #context repr(_get-config("sym-prod"))
  ```
]

=== Output

#test-rect[  
  #context repr(_get-config("sym-prod")) \
  #_update-config("sym-prod", "=")
  #context repr(_get-config("sym-prod"))
]

