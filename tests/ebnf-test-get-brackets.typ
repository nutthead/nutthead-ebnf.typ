#import "../ebnf.typ": *
#import "_ebnf-test-utils.typ" : *
#set page(paper: "a6", flipped: true)

== Test: `_get-brackets(kind)`

#[
  #context {
    let keys = ("comment", "curly", "rounded", "square")

    let counter = 1
    for k in keys {
      [=== Test #counter: key = #repr(k)]
      repr(_get-brackets(k))
      counter += 1
    }
  }
]
