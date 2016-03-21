module Table (table, Props) where

{-|
# Table
![A screenshot of the table in-action](https://cloud.githubusercontent.com/assets/1227109/13919585/f838f042-ef33-11e5-9a9e-7f75d6e266db.png)
@docs table, Props
-}

import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (map, indexedMap)


{-|
- Use the caption to describe the purpose of the table (it helps out visually impaired people)
- Pass in HTML for the headers (accepting HTML lets you do fancy things like use buttons)
- In the same way, pass in lists of HTML for rows
-}
type alias Props =
  { caption : String
  , headers : List Html
  , rows : List (List Html)
  }


cell : Int -> Html -> Html
cell idx content =
  if idx == 0 then
    th [ scope "row" ] [ content ]
  else
    td [] [ content ]


header : Html -> Html
header content =
  th [ scope "col" ] [ content ]


row : List Html -> Html
row content =
  tr [] (indexedMap cell content)


{-| Simple enough, just pass in props and you'll get back a semantic, accessible table!
-}
table : Props -> Html
table props =
  Html.table
    []
    [ caption
        []
        [ text props.caption ]
    , thead
        []
        [ tr [] (map header props.headers) ]
    , tbody
        []
        (map row props.rows)
    ]
