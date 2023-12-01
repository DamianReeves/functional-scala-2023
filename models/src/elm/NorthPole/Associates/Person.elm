module NorthPole.Associates.Person exposing (..)
import NorthPole.Associates.PersonKind exposing (PersonKind, who, grinch)

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

formalName: Person -> String
formalName person =
  let
    personTitle = person |> title |> titleToString
    name =
      case person of
        Who firstName lastName _ _ ->
          firstName ++ " " ++ lastName
        Grinch _ ->
          "Grinch"
  in
    case personTitle of
      "" ->
        name
      _ ->
        personTitle ++ name

isGrinch : Person -> Bool
isGrinch person =
  case person of
    Who _ _ _ _ ->
      False
    Grinch _ ->
      True

title : Person -> Maybe Title
title person =
  case person of
    Who _ _ _ maybeTitle ->
      maybeTitle
    Grinch _ ->
      Just Mr

titleToString : Maybe Title -> String
titleToString maybeTitle =
  case maybeTitle of
    Just someTitle ->
      case someTitle of
        Mr ->
          "Mr."
        Mrs ->
          "Mrs."
        Ms ->
          "Ms."
        Dr ->
          "Dr."
    Nothing ->
      ""
