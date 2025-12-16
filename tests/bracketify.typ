#import "../ebnf.typ": _bracketify
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6")

== `_bracketify`

#test-rect[
  #context _bracketify(type: "rounded")[Foo] \
  #context _bracketify(type: "curly")[Bar] \
  #context _bracketify(type: "square")[Baz] \
  #context _bracketify(type: "comment")[Lorem Ipsum] \
  #context _bracketify(type: "special")[Ipsum Lorem]
]
