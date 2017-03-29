module Tests exposing (..)

import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)
import Test exposing (..)
import Expect
import Map exposing (map)
import String


square : Int -> Int
square x =
    x * x


tests : Test
tests =
    describe "Map"
        [ test "[] Map" <|
            \() -> Expect.equal [] (map square [])
        , test "square Map" <|
            \() -> Expect.equal [ 1, 4, 9 ] (map square [ 1, 2, 3 ])
        , test "toUpper Map" <|
            \() ->
                Expect.equal [ "HELLO", "WORLD" ]
                    (map String.toUpper [ "hello", "world" ])
        , test "reverse Map" <|
            \() ->
                Expect.equal [ "olleh", "dlrow" ]
                    (map String.reverse [ "hello", "world" ])
        ]
