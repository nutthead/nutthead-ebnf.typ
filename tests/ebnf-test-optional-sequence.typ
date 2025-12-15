#import "../ebnf.typ": optional-sequence, single-definition, terminal
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `optional-sequence`

#context optional-sequence(
  single-definition[BlockExpression],
  terminal(illumination: "dimmed")[;]
)
