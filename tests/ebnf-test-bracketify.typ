#import "../ebnf.typ": _bracketify
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_bracketify`

=== Input

#test-rect[
  ```typ
  #context _bracketify(type: "rounded")[Foo] \
  #context _bracketify(type: "curly")[Bar] \
  #context _bracketify(type: "square")[Baz] \
  #context _bracketify(type: "comment")[Lorem Ipsum] \
  #context _bracketify(type: "special")[Ipsum Lorem]
  ```
]

=== Output

#test-rect[
  #context _bracketify(type: "rounded")[Foo] \
  #context _bracketify(type: "curly")[Bar] \
  #context _bracketify(type: "square")[Baz] \
  #context _bracketify(type: "comment")[Lorem Ipsum] \
  #context _bracketify(type: "special")[Ipsum Lorem]
]
