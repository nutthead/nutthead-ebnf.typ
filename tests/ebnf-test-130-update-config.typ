#import "../ebnf.typ" : *

== Test: `_update-config`

=== `_configuration.get()`

#context repr(_configuration.get())

=== Test 1: `_update-config(none, none)`

#context _update-config(none, none)

=== Test 2: `_update-config("sym-prod", "=")`

1. `_update-config("sym-prod", "=")`

#context _update-config("sym-prod", "=")

2. `_configuration.get()`

#context repr(_configuration.get())