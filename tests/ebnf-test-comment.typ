#import "../ebnf.typ" : comment
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `comment`

=== Input

#test-rect[
  ```typ
  #context comment[Hello, World] \
  #context comment[Hello, World].kind \
  #context comment[Hello, World].value 
  ```
]

=== Output

#test-rect[
  - Object: #context comment[Hello, World] \
  - Kind: #context comment[Hello, World].kind \
  - Value: #context comment[Hello, World].value 
]


