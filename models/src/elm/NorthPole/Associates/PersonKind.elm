module NorthPole.Associates.PersonKind exposing (..)

{--| The Kind of Person --}
type PersonKind
  = Who
  | Grinch

grinch: PersonKind
grinch = Grinch

who: PersonKind
who = Who

{--| Is this person a Grinch? --}
isGrinch: PersonKind -> Bool
isGrinch kind =
  case kind of
    Grinch -> True
    Who -> False
