//
// ISO/IEC 14977 : 1996(E) Parser
// Reference: https://www.cl.cam.ac.uk/~mgk25/iso-14977.pdf
//
#let _id_pattern = regex("[a-zA-Z0-9]")
#let _id_start_pattern = regex("[a-zA-Z]")

#let _is_whitespace(char) = {
  char.match(regex("^\\s$")) != none
}

#let _lex_identifier(input, idx) = {
  let start = idx
  let len = input.len()

  while idx < len and input.at(idx).match(_id_pattern) != none {
    idx += 1
  }

  let word = input.slice(start, idx)
  let token = (type: "identifier", value: word)

  (token: token, next_index: idx)
}

#let _lex_terminal_string(input, idx) = {
  let start = idx
  let i = idx + 1
  let len = input.len()
  let quote = input.at(idx)

  while (i < len) {
    let char = input.at(i)
    if char == quote {
      return (
        token: (type: "terminal", value: input.slice(start, i + 1)),
        next_index: i + 1,
      )
    }

    i += 1
  }
}

#let _lex_comment(input, idx) = {
  let i = idx + 2
  let len = input.len()

  while i < len - 1 {
    if (input.at(i) == "*" and input.at(i + 1) == ")") {
      return (
        token: (type: "comment", value: input.slice(idx, i + 2)),
        next_index: i + 2,
      )
    }
    i += 1
  }

  panic("Unclosed comment starting at index " + str(index))
}

#let _tokenize(body) = {
  let input = body.children.filter(it => it.func() == raw).map(it => it.text).join("\n")
  let tokens = ()
  let i = 0
  let len = input.len()

  while (i < len) {
    let char = input.at(i)

    if (_is_whitespace(char)) {
      i += 1
      continue
    }

    if (char in ("'", "\"")) {
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

    if (char == "(" and i + 1 < len and input.at(i + 1) == "*") {
      let token = _lex_comment(input, i)
      tokens.push(token.token)
      i = token.next_index
      continue
    }

    if (char.match(_id_start_pattern) != none) {
      let token = _lex_identifier(input, i)
      tokens.push(token.token)
      i = token.next_index
      continue
    }

    tokens.push((type: "operator", value: char))
    i += 1
  }

  tokens
}

#let _parse_nested(tokens, idx, end_char, node_type, root_parser) = {
  let len = tokens.len()
  let start_content = idx + 1

  if start_content < len and tokens.at(start_content).value == end_char {
    return (
      node: (
        type: node_type,
        content: (type: "sequence", children: ()),
      ),
      next_index: start_content + 1,
    )
  }

  let body = root_parser(tokens, start_content)
  let current_idx = body.next_index

  if current_idx >= len or tokens.at(current_idx).value != end_char {
    panic(
      "Expected closing '"
        + end_char
        + "', found: "
        + (if current_idx < len { repr(tokens.at(current_idx)) } else { "EOF" }),
    )
  }

  return (
    node: (type: node_type, content: body.node),
    next_index: current_idx + 1,
  )
}

#let _parse_term(tokens, idx, root_parser) = {
  let len = tokens.len()

  // Safety check
  if idx >= len {
    panic("Unexpected end of input inside a definition.")
  }

  let token = tokens.at(idx)
  let val = token.value

  if token.type == "terminal" {
    return (
      node: (type: "terminal", value: val),
      next_index: idx + 1,
    )
  }

  if token.type == "identifier" {
    return (
      node: (type: "identifier", value: val),
      next_index: idx + 1,
    )
  }

  if val == "(" {
    return _parse_nested(tokens, idx, ")", "group", root_parser)
  }

  if val == "[" {
    return _parse_nested(tokens, idx, "]", "option", root_parser)
  }

  if val == "{" {
    return _parse_nested(tokens, idx, "}", "repetition", root_parser)
  }

  panic("Unexpected token in term: " + repr(token))
}

#let _parse_single_definition(tokens, index, root_parser) = {
  let result = _parse_term(tokens, index, root_parser)

  let items = (result.node,)
  let current_idx = result.next_index
  let len = tokens.len()

  while current_idx < len {
    let token = tokens.at(current_idx)

    if token.value == "," {
      current_idx += 1

      let next_result = _parse_term(tokens, current_idx, root_parser)
      items.push(next_result.node)
      current_idx = next_result.next_index
    } else {
      break
    }
  }

  if items.len() == 1 {
    return (node: items.first(), next_index: current_idx)
  } else {
    return (
      node: (type: "sequence", children: items),
      next_index: current_idx,
    )
  }
}

#let _parse_definitions_list(tokens, idx) = {
  let result = _parse_single_definition(tokens, idx, _parse_definitions_list)
  let options = (result.node,)

  let current_idx = result.next_index
  let len = tokens.len()

  while current_idx < len {
    let token = tokens.at(current_idx)

    if token.value == "|" {
      current_idx += 1
      let next_result = _parse_single_definition(tokens, current_idx, _parse_definitions_list)
      options.push(next_result.node)
      current_idx = next_result.next_index
    } else {
      break
    }
  }

  if options.len() == 1 {
    return (
      node: options.at(0),
      next_index: current_idx,
    )
  } else {
    return (
      node: (
        type: "choice",
        children: options,
      ),
      next_index: current_idx,
    )
  }
}

#let _parse_syntax_rule(tokens, idx) = {
  let len = tokens.len()
  if (idx + 2 > len) {
    panic("Unexpected end of input while looking for a syntax rule.")
  }

  let name_token = tokens.at(idx)
  let assign_token = tokens.at(idx + 1)

  if name_token.type != "identifier" or assign_token.value != "=" {
    panic("Expected syntax rule (Name = ...), found: " + repr(name_token))
  }

  let body_result = _parse_definitions_list(tokens, idx + 2)
  let current_idx = body_result.next_index

  if current_idx >= len or tokens.at(current_idx).value != ";" {
    panic("Syntax rule '" + name_token.value + "' missing ending ';'")
  }

  return (
    node: (
      type: "rule",
      name: name_token.value,
      definition: body_result.node,
    ),
    next_index: current_idx + 1,
  )
}

#let _compile(node) = {
  let t = node.type

  // --- Leaves (The actual text) ---
  if t == "terminal" {
    // Terminals are literal strings. We show them in monospace.
    // We add quotes back in for clarity.
    return raw("'" + node.value + "'")
  } else if t == "identifier" {
    // Identifiers are usually standard text, often italicized in formal grammars.
    return text(style: "italic", node.value)
  } // --- Lists (Joined items) ---
  else if t == "sequence" {
    // Join items with a comma.
    // We map 'compile' recursively over the children.
    return node.children.map(_compile).join(text(weight: "bold", ", "))
  } else if t == "choice" {
    // Join items with a pipe.
    return node.children.map(_compile).join(text(weight: "bold", " | "))
  } // --- Wrappers (Brackets) ---
  else if t == "option" {
    // [ ... ]
    return [\[ #_compile(node.content) \]]
  } else if t == "repetition" {
    // { ... }
    return [{ #_compile(node.content) }]
  } else if t == "group" {
    // ( ... )
    return [( #_compile(node.content) )]
  } // --- The Rule (Top Level) ---
  else if t == "rule" {
    return box[
      #text(weight: "bold", node.name)
      #h(0.5em) #sym.eq #h(0.5em)
      #_compile(node.definition)
      #h(0.5em) #sym.semi
    ]
  } else {
    panic("Unknown node type during compilation: " + t)
  }
}

#let ebnf(input) = {
  let tokens = _tokenize(input)

  let rules = ()
  let idx = 0
  let len = tokens.len()

  while idx < len {
    let result = _parse_syntax_rule(tokens, idx)
    rules.push(result.node)
    idx = result.next_index
  }

  stack(
    dir: ttb,
    spacing: 0.8em,
    ..rules.map(_compile),
  )
}

== Tokenize

#_tokenize[
  ```
  | 'a' "b" - * = ; IdentifierName (* Hello *)
  ```
]

#_lex_identifier("FunctionName", 0)

#_lex_terminal_string("\"Hello\"", 0)

#_lex_comment("(* Hello World *)", 0)

== `_parse_term`

#_parse_term(
  (
    (
      type: "terminal",
      value: "'a'",
    ),
  ),
  0,
  _parse_definitions_list,
)

#_parse_term(
  (
    (
      type: "terminal",
      value: "\"a\"",
    ),
  ),
  0,
  _parse_definitions_list,
)

#_parse_term(
  (
    (
      type: "identifier",
      value: "FunctionName",
    ),
  ),
  0,
  _parse_definitions_list,
)

#_parse_term(
  (
    (
      type: "identifier",
      value: "FunctionName",
    ),
  ),
  0,
  _parse_definitions_list,
)

#_parse_term(
  (
    (
      type: "operator",
      value: "(",
    ),
    (
      type: "identifier",
      value: "FunctionName",
    ),
    (
      type: "operator",
      value: ")",
    ),
  ),
  0,
  _parse_definitions_list,
)

== `ebnf`

#ebnf[
  ```
  Baz = () ;
  Baz = {} ;
  Baz = [] ;
  ```
]
