module NorthPole.Associates.Main exposing (..)
import NorthPole.Associates.Activities as Activities
import NorthPole.Associates.Person exposing (Person(..), theGrinch)
import NorthPole.Associates.Person as P

data: List (Person, Activities.ActivityList)
data = [
  (theGrinch, Activities.empty)
]

main: String
main = "Hello, World!"
