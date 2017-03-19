module Main exposing (..)

import Random.Pcg as Random exposing (Generator)
import Html exposing (Html)
import Array exposing (Array)
import VirtualDom exposing (node, attribute)
import AnimationFrame


height : Float
height =
    500


width : Float
width =
    1000


initialTranslateX : Float
initialTranslateX =
    -200


type alias GradientPair =
    ( String, String )


randomGradientIndex : Array GradientPair -> Generator Int
randomGradientIndex pairs =
    let
        numberOfPairs =
            Array.length pairs
    in
        Random.int 0 numberOfPairs


randomStart : Float -> Generator ( Float, Float, Float, ( Float, Float, Float ) )
randomStart minWidth =
    let
        multipledMinWidth =
            minWidth * 4

        randomVX =
            Random.float 0.5 2.5

        randomVR =
            Random.float 0.09 0.9

        randomRotation =
            Random.float 0 180
    in
        Random.map4
            (,,,)
            (Random.float -width (-multipledMinWidth))
            (Random.float minWidth (height - multipledMinWidth))
            (Random.float minWidth multipledMinWidth)
            (Random.map3 (,,) randomVX randomVR randomRotation)


gradientPairs : Array GradientPair
gradientPairs =
    [ ( "#9012ef", "#ce6bdb" )
    , ( "#f0ad00", "#ce6bdb" )
    , ( "#60b4cc", "#8581b0" )
    , ( "#7fd13b", "#8581b0" )
    , ( "#5a6378", "#ce6bdb" )
    ]
        |> Array.fromList


type alias Square =
    { x : Float
    , y : Float
    , transformX : Float
    , transformY : Float
    , size : Float
    , rotation : Float
    , gradientIndex : Int
    , velocityX : Float
    , velocityR : Float
    }


type alias Triangle =
    { x : Float
    , y : Float
    , transformX : Float
    , transformY : Float
    , size : Float
    , rotation : Float
    , gradientIndex : Int
    , velocityX : Float
    , velocityR : Float
    }


randomSquare : Generator Square
randomSquare =
    Random.pair (randomGradientIndex gradientPairs) (randomStart 50)
        |> Random.map
            (\( colorIndex, ( x, y, size, ( vX, vR, rotation ) ) ) ->
                Square x y initialTranslateX 0 size rotation colorIndex vX vR
            )


randomTriangle : Generator Triangle
randomTriangle =
    Random.pair (randomGradientIndex gradientPairs) (randomStart 25)
        |> Random.map
            (\( colorIndex, ( x, y, size, ( vX, vR, rotation ) ) ) ->
                Triangle x y initialTranslateX 0 size rotation colorIndex vX vR
            )


viewGradient : Int -> GradientPair -> Html msg
viewGradient idIndex ( start, end ) =
    node "radialGradient"
        [ attribute "id" ("gradient" ++ toString idIndex)
        , attribute "cx" "50%"
        , attribute "cy" "50%"
        , attribute "r" "75%"
        , attribute "fx" "0%"
        , attribute "fy" "0%"
        ]
        [ node "stop" [ attribute "stopColor" start, attribute "offset" "0%" ] []
        , node "stop" [ attribute "stopColor" end, attribute "offset" "100%" ] []
        ]


viewGradients : Array GradientPair -> List (Html msg)
viewGradients =
    Array.indexedMap viewGradient
        >> Array.toList


viewSquare : Square -> Html msg
viewSquare square =
    node "rect"
        [ attribute "x" <| toString square.x
        , attribute "y" <| toString square.y
        , attribute "stroke" "none"
        , attribute "width" <| toString square.size
        , attribute "height" <| toString square.size
        , attribute "fill" <| "url(#gradient" ++ toString square.gradientIndex ++ ")"
        , attribute "class" "shape"
        , attribute "style" ("transform: translateX(" ++ toString square.transformX ++ "px) rotate(" ++ toString square.rotation ++ "deg);")
        ]
        []


trianglePoints : Triangle -> String
trianglePoints triangle =
    [ toString triangle.x
    , ","
    , toString triangle.y
    , " "
    , toString (triangle.x + triangle.size)
    , ","
    , toString (triangle.y + triangle.size)
    , " "
    , toString triangle.x
    , ","
    , toString (triangle.y + 2 * triangle.size)
    ]
        |> String.join ""


viewTriangle : Triangle -> Html msg
viewTriangle triangle =
    node "polygon"
        [ attribute "points" <| trianglePoints triangle
        , attribute "stroke" "none"
        , attribute "width" <| toString triangle.size
        , attribute "height" <| toString triangle.size
        , attribute "fill" <| "url(#gradient" ++ toString triangle.gradientIndex ++ ")"
        , attribute "class" "shape"
        , attribute "style" ("transform: translateX(" ++ toString triangle.transformX ++ "px) rotate(" ++ toString triangle.rotation ++ "deg);")
        ]
        []


viewSvgParts : Model -> Html.Html Msg
viewSvgParts model =
    List.map viewSquare model.squares
        |> (++) (List.map viewTriangle model.triangles)
        |> (++) (viewGradients gradientPairs)
        |> node "svg" [ attribute "width" "100vw", attribute "height" "50vh", VirtualDom.attribute "viewBox" "0 0 1000 500" ]


view : Model -> Html.Html Msg
view model =
    Html.div
        []
        [ viewSvgParts model ]


type alias Model =
    { squares : List Square
    , triangles : List Triangle
    , ticks : Int
    }


type Msg
    = NoOp
    | NewSquares (List Square)
    | NewTriangles (List Triangle)
    | MoveX Float


moveX : { a | transformX : Float, velocityX : Float, size : Float } -> Float
moveX { transformX, velocityX, size } =
    let
        newX =
            transformX + velocityX
    in
        if (newX > (width * 3 + size)) then
            initialTranslateX
        else
            newX


moveR : { a | rotation : Float, velocityR : Float } -> Float
moveR { rotation, velocityR } =
    let
        newRotation =
            rotation + velocityR
    in
        if newRotation > 360 then
            newRotation - 360
        else
            newRotation


stepSquare : Square -> Square
stepSquare square =
    { square
        | transformX =
            moveX square
        , rotation =
            moveR square
    }


stepTriangle : Triangle -> Triangle
stepTriangle triangle =
    { triangle
        | transformX =
            moveX triangle
        , rotation =
            moveR triangle
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        NewSquares squares ->
            ( { model | squares = squares }, Cmd.none )

        NewTriangles triangles ->
            ( { model | triangles = triangles }, Cmd.none )

        MoveX newXSeed ->
            ( { model
                | squares = List.map stepSquare model.squares
                , triangles = List.map stepTriangle model.triangles
                , ticks = model.ticks + 1
              }
            , if model.ticks < 10 then
                if List.length model.squares < List.length model.triangles then
                    Random.generate NewSquares (Random.list 2 randomSquare)
                else
                    Random.generate NewSquares (Random.list 2 randomTriangle)
              else
                Cmd.none
            )


init : ( Model, Cmd Msg )
init =
    ( { squares = [], triangles = [], ticks = 0 }
    , Cmd.batch
        [ Random.generate NewSquares (Random.list 5 randomSquare)
        , Random.generate NewTriangles (Random.list 5 randomTriangle)
        ]
    )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions =
            (\model ->
                AnimationFrame.diffs (\seed -> MoveX seed)
            )
        }