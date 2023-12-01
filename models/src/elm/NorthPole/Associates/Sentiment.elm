module NorthPole.Associates.Sentiment exposing (..)


type OverallSentiment
  = Naughty
  | Nice

type alias SentimentScore = Float

naughty: OverallSentiment
naughty = Naughty

nice: OverallSentiment
nice = Nice
