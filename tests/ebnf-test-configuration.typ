#import "../ebnf.typ": _configuration
#import "ebnf-test-000-utils.typ": *
#set page(paper: "a6")

== Test `_configuration`

=== Input

#test-rect[
  ```typ
  #repr(_configuration)
  ```
]


=== Output

#[
  #set text(size: 7pt)
  #test-rect[
    #repr(_configuration)
  ]
]
