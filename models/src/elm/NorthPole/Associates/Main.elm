module NorthPole.Associates.Main exposing (..)
import NorthPole.Associates.Activities as Activities
import NorthPole.Associates.Activity exposing (Activity(..))
import NorthPole.Associates.Person exposing (Person(..), theGrinch, cindyLouWho)
import NorthPole.Associates.Person as P
import NorthPole.Associates.Sentiment exposing (OverallSentiment)
import NorthPole.Associates.SentimentAlgorithm as SentimentAlgorithm

theAlgorithm: P.Person -> Activities.ActivityList -> OverallSentiment
theAlgorithm = SentimentAlgorithm.defaultAlgorithm

data: List (Person, Activities.ActivityList)
data = [
  (theGrinch, Activities.empty),
  (cindyLouWho, [MadeBed, BrushedTeeth])
]

main: List (Person, OverallSentiment)
main =
  List.map (\(person, activities) -> (person, theAlgorithm person activities)) data
