#import "../ebnf.typ": _decorate
#import "_ebnf-test-utils.typ": *
#set page(paper: "a3")

== Test: `_decorate`

=== Input

#test-rect[
  ```typ
  #let bracket-types = ("rounded", "curly", "square", "comment", "special")
  #let qualifier-types = ("opt", "some", "any")
  #let illumination-types = ("dimmed", "highlighted", none)

  #context {    
    for b in bracket-types {
      for q in qualifier-types {
        for i in illumination-types {
          _decorate(bracket-type: b, illumination-type: i, qualifier-type: q)[Decoratee]
          linebreak()
        }
      }
    }
  }
  ```
]

=== Output

#test-rect[
  #set text(size: 8pt)
  #let bracket-types = ("rounded", "curly", "square", "comment", "special")
  #let qualifier-types = ("opt", "some", "any")
  #let illumination-types = ("dimmed", "highlighted", none)

  #context {    
    for b in bracket-types {
      for q in qualifier-types {
        for i in illumination-types {
          _decorate(bracket-type: b, illumination-type: i, qualifier-type: q)[Decoratee]
          linebreak()
        }
      }
    }
  }
]
