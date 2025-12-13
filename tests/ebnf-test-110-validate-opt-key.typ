#import "../ebnf.typ": *

== `_validate-opt-key`

#[
  #context {
    let keys = (none, "sym-prod", "invalid")

    let counter = 1
    for k in keys {
      [=== Test #counter: key = #repr(k)]
      _validate-opt-key(k)
      counter += 1
    }
  }
]
