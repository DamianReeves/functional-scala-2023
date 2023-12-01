module NorthPole.Associates.Activities exposing (..)

import NorthPole.Associates.Activity exposing (Activity)

type alias ActivityList = List Activity

{-| An empty activity list -}
empty : ActivityList
empty =
    []
