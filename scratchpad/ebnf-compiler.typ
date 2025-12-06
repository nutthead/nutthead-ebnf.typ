#let _id_pattern = regex("[a-zA-Z0-9]")
#let _id_start_pattern = regex("[a-zA-Z]")

#let _is_whitespace(char) = {
  char.match(regex("\s")) != none
}

#let _lex_identifier(input, idx) = {
  let start = idx
  let len = input.len()

  while idx < len and input.at(idx).match(_id_pattern) != none {
    idx += 1
  }

  let word = input.slice(start, idx)
  let token = (type: "identifier", value: word)

  (token: token, next_index: idx + 1)
}

#let _lex_terminal_string(input, idx) = {
  let start = idx
  let j = idx + 1
  let len = input.len()
  let quote = input.at(idx)

  while (j < len) {
    let char = input.at(j)
    if char == quote {
      return (
        token: (type: "string", value: input.slice(start, j + 1)),
        next_index: j + 1
      )
    }

    j += 1  
  }
}

#let _tokenize(body) = {
  let input = body.children.filter(it => it.func() == raw).map(it => it.text).join([\ ])
  let tokens = ()
  let i = 0
  let len = input.len()

  while (i < len) {
    let char = input.at(i)

    if (_is_whitespace(char)) {
      i += 1
      continue
    }

    if (char in ("`", "\"")) {
      let token = _lex_terminal_string(input, i)
      tokens.push(token.token)
      i = token.next_index
      continue
    }

    if (char in ("*", "-", "|", "=", ";")) {
      tokens.push((type: "operator", value: char))
      i += 1
      continue
    }

    if (char.match(_id_start_pattern) != none) {
      let token = _lex_identifier(input, i)
      tokens.push(token.token)
      i = token.next_index
      continue
    }

    i += 1
  }

  tokens
}

== `_is_whitespace(char)`

#table(
  columns: (2fr, 3fr),
  [`#_is_whitespace(" ")`], [#_is_whitespace(" ")],
  [`#_is_whitespace("")`], [#_is_whitespace("")],
  [`#_is_whitespace("a")`], [#_is_whitespace("a")],
  [`#_lex_identifier("FuncName")`], [#_lex_identifier("FuncName", 0)],
)



== `_tokenize(body)`

#_tokenize[
  ```
  Function = FunctionQualifiers "fn" IDENTIFIER
  
  "Hello"
  * - , | = ; IdentifierName
  "Hi" - "Ola"
  ```
]

