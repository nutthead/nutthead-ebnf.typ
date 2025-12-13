#import "../ebnf.typ" : *

= Test: `_validate-key`

#[
  #context {
    let keys = (none, "sym-prod", "invalid")

    let counter = 1
    for k in keys {
      [=== Test #counter: key = #repr(k)]
      _validate-key(k)
      counter += 1
    }
  }
]