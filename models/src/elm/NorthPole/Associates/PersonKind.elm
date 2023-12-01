module NorthPole.Associates.PersonKind exposing (..)
import NorthPole.Associates.Person as Person

type PersonKind
  = Who
  | Grinch

fromPerson: Person.Person -> PersonKind
fromPerson person =
  case person of
    Person.Who _ _ _ _ -> Person.Who
    Person.Grinch -> Person.Grinch