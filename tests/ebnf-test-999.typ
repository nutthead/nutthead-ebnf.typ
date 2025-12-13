#import "../ebnf.typ" : *

#context [
  #ebnf[
    #[
      #syntax-rule(meta-id: [Function], example: [`fn main() { }`], definition-list: (
        (indent: 1),
        [
          #single-definition(illumination: "dimmed")[FunctionQualifiers]
          #terminal[fn]
          #single-definition[IDENTIFIER]
          #single-definition(illumination: "dimmed", qualifier: "sym-opt")[FunctionQualifiers]
        ],
        [
          #single-definition(illumination: "dimmed")[FunctionQualifiers]
          #terminal[fn]
          #single-definition[IDENTIFIER]
          #single-definition(illumination: "dimmed", qualifier: "sym-opt")[FunctionQualifiers]
        ]
      ))
    ]
  ]
]