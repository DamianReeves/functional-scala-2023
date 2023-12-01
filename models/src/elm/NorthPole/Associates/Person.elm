module NorthPole.Associates.Person exposing (..)

type alias Age = Int
type alias FirstName = String
type alias LastName = String

type Title
  = Mr
  | Mrs
  | Ms
  | Dr


type alias PersonDTO =
    { firstName : FirstName
    , lastName : LastName
    , age : Age
    , title : Maybe Title
    }

type Person
  = Who FirstName LastName Age (Maybe Title)
  | Grinch Age

fullName : Person -> String
fullName person =
  case person of
    Who firstName lastName _ _ ->
      firstName ++ " " ++ lastName
    Grinch _ ->
      "The Grinch"

title : Person -> Maybe Title
title person =
  case person of
    Who _ _ _ title ->
      title
    Grinch _ ->
      Just Mr