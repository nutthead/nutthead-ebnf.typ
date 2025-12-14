#import "../ebnf.typ": *

#context [
  #ebnf[
    #[
      #syntax-rule(
        meta-id: [Function],
        example: [`fn main() { }`],
        definition-list: (
          (indent: 1),
          [
            #single-definition(illumination: "dimmed")[FunctionQualifiers]
            #terminal[fn]
            #single-definition[IDENTIFIER]
            #single-definition(illumination: "dimmed", qualifier: "sym-opt")[GenericParams]
          ],
          [
            #terminal[(]
            #single-definition(qualifier: "sym-opt")[FunctionParameters]
            #terminal[)]
          ],
          [
            #single-definition(illumination: "dimmed", qualifier: "sym-opt")[FunctionReturnType]
            #single-definition(illumination: "dimmed", qualifier: "sym-opt")[WhereClause]
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
