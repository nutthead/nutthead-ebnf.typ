#import "../ebnf.typ": special-sequence, single-definition, terminal
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `special-sequence`

#context special-sequence(
  single-definition[BlockExpression],
  terminal(illumination: "dimmed")[;]
)
