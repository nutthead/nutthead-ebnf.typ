#import "../ebnf.typ": grouped-sequence, single-definition, terminal
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `grouped-sequence`

#context grouped-sequence(
  single-definition[BlockExpression],
  terminal(illumination: "dimmed")[;]
)