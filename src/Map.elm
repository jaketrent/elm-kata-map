module Map exposing (..)


map : (a -> b) -> List a -> List b
map transform list =
    case list of
        [] ->
            []

        head :: tail ->
            transform head :: map transform tail
