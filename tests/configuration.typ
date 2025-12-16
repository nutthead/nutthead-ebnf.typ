#import "../ebnf.typ": _configuration
#import "_ebnf-test-utils.typ": *
#set page(paper: "a6")

== `_configuration`

#[
  #set text(size: 8pt)
  #test-rect[
    #repr(_configuration)
  ]
]
