// ISO/IEC 14977 : 1996(E)
// https://www.cl.cam.ac.uk/~mgk25/iso-14977.pdf

// Default symbols (Section 4)
#let _concatenate-sym = state("nutthead.ebnf.concatenate-sym", ",")
#let _defining-sym = state("nutthead.ebnf.defining-sym", " = ")
#let _definition-separator-sym = state("nutthead.ebnf.definition-separator-sym", "|")
#let _end-comment-sym = state("nutthead.ebnf.end-comment-sym", "*)")
#let _end-group-sym = state("nutthead.ebnf.end-group-sym", ")")
#let _end-option-sym = state("nutthead.ebnf.end-option-sym", "]")
#let _end-repeat-sym = state("nutthead.ebnf.end-repeat-sym", "}")
#let _except-sym = state("nutthead.ebnf.except-sym", "-")
#let _first-quote-sym = state("nutthead.ebnf.first-quote-sym", "`")
#let _repetition-sym = state("nutthead.ebnf.def-sym", super[\*])
#let _second-quote-sym = state("nutthead.ebnf.second-quote-sym", "\"")
#let _special-sequence-sym = state("nutthead.ebnf.special-sequence-sym", super[?])
#let _start-comment-sym = state("nutthead.ebnf.start-comment-sym", "(*")
#let _start-group-sym = state("nutthead.ebnf.start-group-sym", "(")
#let _start-option-sym = state("nutthead.ebnf.start-option-sym", "[")
#let _start-repeat-sym = state("nutthead.ebnf.start-repeat-sym", "{")
#let _terminator-sym = state("nutthead.ebnf.defining-sym", ";")

// Default padding
#let _pad = state("nutthead.ebnf.pad", 1em)

// Default fonts
#let _monospaced-font = state("nutthead.ebnf.defining-monospaced-font", "DejaVu Sans Mono")
#let _serif-font = state("nutthead.ebnf.defining-monospaced-font", "DejaVu Serif")

// State tracking
#let _in-ebnf = state("nutthead.ebnf.in-ebnf", false)

// Guard to ensure Nutthead EBNF functions can only be used inside the #ebnf[ ] block
#let _ebnf-guard(func) = (..args) => {
  context {
    if _in-ebnf.get() == true {
      func(..args)
    } else {
      panic("Error: This function can only be used inside an #ebnf block!")
    }
  }
}

// Remove leading and trailing whitespace from bodies
#let _normalize-body(body) = {
  if body == [ ] or body == none { return none }

  if not body.has("children") { return body }

  let kids = body.children.fold((), (acc, child) => {
    if child == [ ] {
      if acc.len() == 0 {
        acc
      } else if acc.last() == [ ] {
        acc
      } else {
        acc + (child,)
      }
    } else {
      acc + (child,)
    }
  })

  if kids.len() > 0 and kids.last() == [ ] {
    kids = kids.slice(0, -1)
  }

  kids.join()
}

// Helper padding function
#let _pads(count) = {
  context {
    if count == none {
      return none
    } else if count == auto {
      return h(_pad.get() + 0.5em)
    } else {
      return h(_pad.get() * count + 0.5em)
    }
  }
}

// Enclose body within left and right text
#let _enclose(left: none, right: auto, body) = {
  context {
    let _left = left
    let _right

    if left == none {
      _right = none
    } else if left == _start-comment-sym.get() {
      _right = if right == auto { _end-comment-sym.get() } else { right }
    } else if left == _start-group-sym.get() {
      _right = if right == auto { _end-group-sym.get() } else { right }
    } else if left == _start-option-sym.get() {
      _right = if right == auto { _end-option-sym.get() } else { right }
    } else if left == _start-repeat-sym.get() {
      _right = if right == auto { _end-repeat-sym.get() } else { right }
    } else if left == _first-quote-sym.get() {
      _right = _first-quote-sym.get()
    } else if left == _second-quote-sym.get() {
      _right = _second-quote-sym.get()
    } else if right == auto {
      panic("Cannot infer `right`")
    } else {
      _right = right
    }

    _left + body + _right
  }
}

// EBNF defining-symbol (Section 4)
#let ebnf-defining-symbol = _ebnf-guard(() => {
  _defining-sym.get()
})

#let ebnf-special-sequence-symbol = _ebnf-guard(() => {
  _special-sequence-sym.get()
})

// EBNF defining-symbol (Section 4)
#let ebnf-defining-symbol = _ebnf-guard(() => {
  _defining-sym.get()
})

// EBNF non-terminal-symbol (Section 3.3)
#let ebnf-nonterminal = _ebnf-guard((pad: none, special: false, body) => {
  context {
    let _pad = if pad == auto {
       h(_pad.get()) 
    } else if pad == none {
       h(0em) 
    } else {
      h(_pad.get() * pad)
    }

    if special == true {
      _pad
      emph(body)
      ebnf-special-sequence-symbol()
    } else {
      _pad
      emph(body)
    }
  }
})

// EBNF teminal-symbol (Section 3.7)
#let ebnf-terminal-symbol = _ebnf-guard(body => {
  context {
    text(font: _monospaced-font.get())[#_enclose(left: _first-quote-sym.get(), body)]
  }
})

// EBNF optional-sequence
#let ebnf-optional-sequence = _ebnf-guard((pad: none, body) => {
  context {
    let _body = _normalize-body(body)
    let _pad = _pads(pad)
  
    _enclose(left: _start-option-sym.get(), _pad + _body)
  }
})

// EBNF group-sequence
#let ebnf-group-sequence = _ebnf-guard((pad: none, body) => {
  context {
    let _body = _normalize-body(body)
    let _pad = _pads(pad)
  
    _pad + _enclose(left: _start-group-sym.get(), _body)
  }
})

// EBNF syntax-rule (Section 4.3)
#let ebnf-syntax-rule = _ebnf-guard((rhs-break: false, pad: none, rhs, body) => {
  context {
    let _body = _normalize-body(body)
    let _pad = if pad == auto { h(_pad.get()) } else { h(pad * pad) }

    emph(rhs) + if rhs-break { linebreak() } else { "" }
    _pad
    ebnf-defining-symbol() + h(0.5em)
    _body
  }
})

#let ebnf(body, def-sym: "=") = {
  _in-ebnf.update(true)
  _defining-sym.update(_ => def-sym)

  body

  _in-ebnf.update(false)
}

#ebnf(def-sym: sym.arrow)[
  == nutthead-ebnf

  #table(
    columns: (2fr, 1fr),
    align: left,
    table.header([*EBNF definition*], [*Example*]),
    [```typ #ebnf-nonterminal[Function]```], [#ebnf-nonterminal[Function]],
    [```typ #ebnf-terminal-symbol[safe]```], [#ebnf-terminal-symbol[safe]],
    [```typ #ebnf-defining-symbol()```], [#ebnf-defining-symbol()],
    [```typ #ebnf-special-sequence-symbol()```], [#ebnf-special-sequence-symbol()],
    [```typ 
    #ebnf-group-sequence()[
      #ebnf-nonterminal(special: true)[GenericParams]
    ]
    ```], 
    [#ebnf-group-sequence()[#ebnf-nonterminal(special: true)[GenericParams]]],
  )

  === Syntax Rule
  
  #ebnf-syntax-rule(pad: auto, rhs-break: true, [Function])[
    #ebnf-nonterminal[FunctionQualifiers]
    #ebnf-terminal-symbol[fn]
    #ebnf-nonterminal[IDENTIFIER]
    #ebnf-nonterminal(special: true)[GenericParams] \
    #ebnf-group-sequence(pad: 3)[#ebnf-nonterminal(special: true)[FunctionParameters]]
  ]
]
