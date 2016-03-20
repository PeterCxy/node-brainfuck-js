exports.compile = (code, o = 'console.log', i = '0') ->
  indent = 0
  out = []
  out.add = (l) ->
    out.push (new Array(indent + 1).join ' ') + l

  # Create an Array for cells
  out.push "var cells = new Uint8Array(2000);"

  # Initialize the pointer
  out.push "var ptr = 0;"

  # Loop over the code and compile
  for c in code.split ''
    switch c
      when '<' then out.add 'ptr--;'
      when '>' then out.add 'ptr++;'
      when '+' then out.add 'cells[ptr]++;'
      when '-' then out.add 'cells[ptr]--;'
      when '['
        # Implement the '[]' block with while loops
        out.add "while (cells[ptr] !== 0) {"
        indent += 2
      when ']'
        indent -= 2
        out.add "}"
      when '.'
        out.add "#{o}(String.fromCharCode(cells[ptr]));"
      when ','
        out.add "cells[ptr] = parseInt(#{i});"

  return out.join '\n'
