module NorthPole.Associates.SentimentAlgorithm exposing (..)

import NorthPole.Associates.Activities exposing (ActivityList)
import NorthPole.Associates.Activity as Activity
import NorthPole.Associates.Person as Person
import NorthPole.Associates.Sentiment as Sentiment

type alias Algorithm = Person.Person -> ActivityList -> Sentiment.OverallSentiment

activityIsNaughty : Activity.Activity -> Bool
activityIsNaughty activity =
  case activity of
    Activity.StolePresents -> True
    Activity.HitKidSister -> True
    _ -> False

defaultAlgorithm : Algorithm
default person activities =
  let
    didSomethingNaughty = List.any activityIsNaughty activities
    isGrinch = person |> Person.isGrinch
  in
    if didSomethingNaughty || isGrinch then
      Sentiment.naughty
    else
      Sentiment.nice

