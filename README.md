# Lambda Calculus

## Project Structure

```bash
lambda-calculus/
├── src/
│   ├── Grammar.y        # Arithmetic expressions parser
│   └── ParserToDo.y     # Lambda calculus parser
├── app/
│   ├── Main.hs          # Main executable
│   ├── GrammarTest.hs   # Arithmetic parser tests
│   └── LambdaTest.hs    # Lambda parser tests
├── test/
│   ├── entradaExp.txt   # Arithmetic expression example
│   └── entradaLambda.txt # Lambda expression example
```

## How to Use

Prerequisites:

- Stack (<https://haskellstack.org>)
- Happy (stack install happy)

### Compilation

```bash
stack build
```

### Execution

For lambda expressions:

```bash
echo "\x.x y" | stack exec lambda-calculus-exe

stack exec lambda-calculus-exe < test/entradaLambda.txt
```
