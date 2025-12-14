#import "@preview/nutthead-ebnf:0.3.1": *

#set page(paper: "a6", flipped: true)

#context [
  #ebnf[
    #[
      #syntax-rule(
        meta-id: [CHAR],
        definition-list: (
          [
            #special-sequence[a Unicode scalar value]
          ],
        )
      )

      #syntax-rule(
        meta-id: [NUL],
        definition-list: (
          [
            #terminal[U+0000]
          ],
        )
      )

      #syntax-rule(
        meta-id: [Function],
        comment: [some comment],
        example: [```rust fn main() { }```],
        definition-list: (
          [
            #single-definition(illumination: "dimmed")[FunctionQualifiers]
            #terminal[fn]
            #single-definition[IDENTIFIER]
            #single-definition(illumination: "dimmed", qualifier: "opt")[GenericParams]
          ],
          (indent: 2),
          [
            #terminal[(]
            #single-definition(qualifier: "opt")[FunctionParameters]
            #terminal[)]
          ],
          [
            #single-definition(illumination: "dimmed", qualifier: "opt")[FunctionReturnType]
            #single-definition(illumination: "dimmed", qualifier: "opt")[WhereClause]
          ],
          [
            #grouped-sequence[
              #single-definition[BlockExpression]
              #terminal(illumination: "dimmed")[;]
            ]
          ],
        ),
      )
    ]
  ]
]
