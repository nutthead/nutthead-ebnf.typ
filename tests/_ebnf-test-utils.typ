/// Draws a rectangle around body
///
/// - body (content): Some content
/// - rest (arguments): `rect` arguments
/// -> content
#let test-rect(body, ..rest) = {
  rect(
    inset: (x: 0.8em, y: 0.5em),
    ..rest,
  )[#body]
}
