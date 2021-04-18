module Main exposing (..)

import Array exposing (append, fromList, get, length, slice, toList)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Browser
import File exposing (File)
import File.Download as Download
import Html exposing (Html, a, div, h1, img, input, p, text, textarea)
import Html.Attributes exposing (class, disabled, placeholder, src, style, value)
import Html.Events exposing (onClick, onInput)
import List exposing (drop, map, reverse)
import List.Extra exposing (splitAt)
import String exposing (split)



---- MODEL ----


type alias Model =
    { content : String, csv : String }


init : ( Model, Cmd Msg )
init =
    ( { content = "", csv = "" }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp
    | Change String
    | Download


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change newContent ->
            ( { model | content = newContent, csv = parseAutoview newContent }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        Download ->
            ( model, save model.csv )


save : String -> Cmd Msg
save csv =
    Download.string "output.csv" "text/csv" csv


parseAutoview : String -> String
parseAutoview content =
    String.split "\n" content
        |> drop 35
        |> map (String.split "\t")
        |> map (String.join ",")
        |> String.join "\n"



---- VIEW ----


view : Model -> Html Msg
view model =
    Grid.container []
        [ bootstrapCDN
        , div [ style "margin" "24px" ]
            [ textarea [ class "form-control", style "margin-bottom" "24px", placeholder "Text autoview", value model.content, onInput Change ] []
            , textarea [ class "form-control", style "height" "320px", value model.csv, placeholder "Text output csv", disabled True ] []
            , a [ class "btn btn-primary", onClick Download ] [ text "download output csv" ]
            ]
        ]


bootstrapCDN : Html Msg
bootstrapCDN =
    CDN.stylesheet



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
