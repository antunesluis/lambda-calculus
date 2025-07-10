# Lambda Calculus Interpreter

A lambda calculus interpreter implemented in Haskell as an academic project. The project implements both named and nameless (De Bruijn indices) representations for lambda terms.

## Features

- **Complete parser**: Parses lambda expressions with `lam x . x` or `\x . x` syntax
- **Call-by-value evaluation**: Implements call-by-value reduction strategy
- **Dual representation**: Supports both named and nameless terms (De Bruijn indices)
- **Free variables**: Calculates and displays free variables in expressions
- **Safe substitution**: Implements α-conversion to avoid variable capture
- **Interactive mode**: Command-line interface for testing expressions

## Project Structure

```
lambda-calculus/
├── app/
│   └── Main.hs              # Main program
├── src/
│   ├── Syntax.hs            # AST definition
│   ├── Parser.y             # Happy grammar for parsing
│   ├── Parser.hs            # Generated parser
│   └── Lam.hs               # Evaluation logic
├── test/
│   ├── input1-input5        # Test cases
└── package.yaml             # Project configuration
```

## Installation

### Prerequisites

- [Stack](https://docs.haskellstack.org/en/stable/README/) installed
- GHC and Happy (automatically installed by Stack)

### Building

```bash
# Clone the repository
git clone <repository-url>
cd lambda-calculus

# Install dependencies and build
stack build
```

## Usage

### Interactive Mode

```bash
stack exec lambda-calculus-exe
```

Start an interactive session where you can type lambda expressions:

```
λ> lam x . x
Input: lam x . x
Parsed: Abs 'x' (Var 'x')
Free variables: []
Result: Abs 'x' (Var 'x')
Nameless: AbsN (VarN 0)
Nameless result: AbsN (VarN 0)
Restored: Abs 'a' (Var 'a')

λ> quit
Exiting...
```

### File Processing

```bash
stack exec lambda-calculus-exe input1
```

Process a file containing a lambda expression.

## Supported Syntax

### Lambda Expressions

- **Variables**: `x`, `y`, `z`, etc.
- **Abstraction**: `lam x . x` or `\x . x`
- **Application**: `(f x)` or `((f x) y)`
- **Parentheses**: For precedence `(lam x . x)`

### Examples

```haskell
-- Identity function
lam x . x

-- Constant function
lam x . lam y . x

-- Application
((lam x . x) y)

-- S combinator
lam x . lam y . lam z . ((x z) (y z))
```
