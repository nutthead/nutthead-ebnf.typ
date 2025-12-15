#import "../ebnf.typ": repeated-sequence, single-definition, terminal
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `repeated-sequence`

#context repeated-sequence(
  single-definition[BlockExpression],
  terminal(illumination: "dimmed")[;]
)
