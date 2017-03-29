## Install Language

Install Elm language via [installer](https://guide.elm-lang.org/install.html)

Verify in terminal:

```
elm -v   # should be 0.18.x
```

## Install Test Framework

(requires node)

```
npm install elm-test -g
```

## Download Exercises

```
git clone https://github.com/jaketrent/elm-kata-map
```

## Run Tests

```
cd elm-kata-map && \
elm-test
```

## Comment out Tests

Seems like a smart thing to do, right?

`--` is a line comment

Let's just focus on the first test.  Re-run tests.

## Error #1 - Module

```
The module name is messed up for ./../src/Map.elm

    According to the file's name it should be Map
    According to the source code it should be Main

Which is it?
```

File names are significant.  Must match module name in the file:

```
module Map exposing (..)
```

## Error #2 - Declaration

```
I ran into something unexpected when parsing your code!


I am looking for one of the following things:

    "{-|"
    a definition or type annotation
    ...
```

Look at `Test.elm` to decide the API that the test requires:

```
(map square [])
```

- First arg is a function that takes input and maps to another output.
- Second arg is a list.  This is a core type -- ordered, homogenous, but not indexable.  Deals in sublists.  We'll deal with this later.

## Declare our Function

```
map transform list =
    []
```

- Name of function is first
- Space separated arguments before the equal sign
- Equals will bind the following expression to the identifier
- Start with an empty List (`[]`)

Now it should compile and *pass* the first test.

## Type Annotation

The compiler can infer types.  We can make them explicit.  Sometimes to help the compiler.  Always to help the reader.

```
map : (a -> b) -> List a -> List b
```

- Usually on light directly above declaration
- First is the name of the function
- Separated by `:` colon
- The a list of parameters, separated by `->` arrows
- The final "parameter" is actually the return type; eg `List b`
- Parameters listed as types only; no variable names
- `a` and `b` are generic types; Start with `a` and go in alpha order by convention
- The type `(a -> b)` is a function; uses parens because it's in a type annotation; A function that takes one type and returns another (a map function)
- `List a` is a `List` of generic type `a`

## Pattern Matching

Now uncomment the next test.  It should fail.

Elm has great pattern matching.

```
case list of
    [] ->
        []

    _ ->
        [ 1, 4, 9 ]
```

- `case {var} of` expression is the pattern-matching start.
- Patterns are registered as `{expression} -> {expression}` after the `case`.  
- The pattern can be a literal, eg `[]`
- `_` is the default/catch-all case
- Will need to adjust the type annotation to allow returning a `List number`

This step was just to push the TDD a little further.  Now uncomment the other two tests and finish the real pattern mathing.

## Finish the Solution

```
module Map exposing (..)


map : (a -> b) -> List a -> List b
map transform list =
    case list of
        [] ->
            []

        head :: tail ->
            transform head :: map transform tail
```

- `head :: tail` matches a non-empty `list`
- `::` is an operator for adding an element to the front of a list
- So the pattern can be thought of as "Is there an element at the front of the list?"
- The pattern breaks out the `head` and `tail` variables are actually bound to those values via the pattern matching expression, so they're available to use
- `transform head` changes just the first elemnt
- The call to `map` is recursive;  We send the `transform` function straight through; `tail` becomes the new list (because the first element has already been transformed)
- As the stack returns, the new list will concat using the `::` operator.

Awesome, we did it!  

Any ideas on how to make the solution better?  

Any other thoughts or questions or things to try?




