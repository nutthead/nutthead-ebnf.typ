#import "../ebnf.typ" : terminal
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `terminal`

=== Input

#test-rect[
  #set text(size: 8pt)
  ```typ
  - Object: #context terminal[fn] \
  - Kind: #context terminal[fn].kind \
  - Value: #context terminal[fn].value
  - Qualified/Illuminated: #context terminal(
      qualifier: "some", 
      illumination: "highlighted")[fn].value
  ```
]

=== Output

#test-rect[
  #set text(size: 8pt)
  - Object: #context terminal[fn] \
  - Kind: #context terminal[fn].kind \
  - Value: #context terminal[fn].value
  - Qualified/Illuminated: #context terminal(qualifier: "some", illumination: "highlighted")[fn].value
]