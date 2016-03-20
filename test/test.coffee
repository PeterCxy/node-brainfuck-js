bf = require '../lib/bf'

result = ''
addResult = (c) -> result += c
input = []
getInput = -> input.pop()

# Hello, World
console.log '---- Hello, World! ---'
code = bf.compile '++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++.', 'addResult'
console.log code
eval code
console.log "Result: #{result}"

# Add
console.log '---- Add ----'
result = ''
code = bf.compile ',>,<[->+<]>.', 'addResult', 'getInput()'
console.log code
input = [48, 2] # 48 -> '0', 50 -> '2'
eval code
console.log "Result: #{result}"

