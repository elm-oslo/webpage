module Main exposing (..)

import Random.Pcg as Random exposing (Generator, Seed)
import Svg exposing (Svg)
import Svg.Attributes exposing (..)
import Html
import Array exposing (Array)
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


randomStart : Float -> Float -> Generator ( Float, Float, ( Float, Float, Float ) )
randomStart modifier minWidth =
    let
        multipledMinWidth =
            minWidth * modifier

        randomVX =
            Random.float 0.5 2

        randomVR =
            Random.float 0.09 0.45

        randomRotation =
            Random.float 45 (360 - 45)

        randomSize =
            Random.int 0 (Array.length sizes)
                |> Random.map
                    (\index ->
                        Array.get index sizes
                            |> Maybe.withDefault 1
                            |> (\size -> size * minWidth)
                    )

        randomY =
            (Random.float minWidth (height - multipledMinWidth))
    in
        Random.map3
            (,,)
            randomY
            randomSize
            (Random.map3 (,,) randomVX randomVR randomRotation)


sizes : Array Float
sizes =
    [ 1
    , 2
    , 2
    , 3
    , 3
    , 3
    , 4
    , 4
    , 4
    , 4
    , 5
    , 5
    , 5
    , 5
    , 6
    , 6
    , 6
    , 6.5
    , 6.5
    , 7
    ]
        |> Array.fromList


gradientPairs : Array GradientPair
gradientPairs =
    [ ( "#9012ef", "#ce6bdb" )
    , ( "#f0ad00", "#ce6bdb" )
    , ( "#60b4cc", "#8581b0" )
    , ( "#7fd13b", "#8581b0" )
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
    , size : Float
    , rotation : Float
    , initialRotation : Float
    , gradientIndex : Int
    , velocityX : Float
    , velocityR : Float
    }


type alias Triangle =
    { x : Float
    , y : Float
    , transformX : Float
    , size : Float
    , rotation : Float
    , initialRotation : Float
    , gradientIndex : Int
    , velocityX : Float
    , velocityR : Float
    }


randomSquare : Float -> Generator Square
randomSquare x =
    Random.pair (randomGradientIndex gradientPairs) (randomStart 8 35)
        |> Random.map
            (\( colorIndex, ( y, size, ( vX, vR, rotation ) ) ) ->
                Square x y initialTranslateX size rotation rotation colorIndex vX vR
            )


randomTriangle : Float -> Generator Triangle
randomTriangle x =
    Random.pair (randomGradientIndex gradientPairs) (randomStart 16 25)
        |> Random.map
            (\( colorIndex, ( y, size, ( vX, vR, rotation ) ) ) ->
                Triangle x y initialTranslateX size rotation rotation colorIndex vX vR
            )


viewGradient : Int -> GradientPair -> Svg msg
viewGradient idIndex ( start, end ) =
    Svg.radialGradient
        [ Svg.Attributes.id ("gradient" ++ toString idIndex)
        , Svg.Attributes.cx "50%"
        , Svg.Attributes.cy "50%"
        , Svg.Attributes.r "75%"
        , Svg.Attributes.fx "0%"
        , Svg.Attributes.fy "0%"
        ]
        [ Svg.stop [ stopColor start, Svg.Attributes.offset "0%" ] []
        , Svg.stop [ stopColor end, Svg.Attributes.offset "100%" ] []
        ]


viewGradients : Array GradientPair -> List (Svg msg)
viewGradients =
    Array.indexedMap viewGradient
        >> Array.toList


viewSquare : Square -> Svg msg
viewSquare square =
    Svg.rect
        [ x <| toString square.x
        , y <| toString square.y
        , stroke "none"
        , Svg.Attributes.width <| toString square.size
        , Svg.Attributes.height <| toString square.size
        , fill <| "url(#gradient" ++ toString square.gradientIndex ++ ")"
        , class "shape"
        , Svg.Attributes.style ("transform: translateX(" ++ toString square.transformX ++ "px) rotate(" ++ toString square.rotation ++ "deg);")
        , Svg.Attributes.rx "3"
        , Svg.Attributes.ry "3"
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


viewTriangle : Triangle -> Svg msg
viewTriangle triangle =
    Svg.polygon
        [ points <| trianglePoints triangle
        , stroke "none"
        , Svg.Attributes.width <| toString triangle.size
        , Svg.Attributes.height <| toString triangle.size
        , fill <| "url(#gradient" ++ toString triangle.gradientIndex ++ ")"
        , class "shape"
        , Svg.Attributes.style
            ("transform: translateX("
                ++ toString triangle.transformX
                ++ "px) rotate("
                ++ toString triangle.rotation
                ++ "deg);"
            )
        ]
        []


viewSvgParts : Model -> Html.Html Msg
viewSvgParts model =
    List.map viewSquare model.squares
        |> (++) (List.map viewTriangle model.triangles)
        |> (++) (viewGradients gradientPairs)
        |> Svg.svg [ id "backdrop", viewBox "0 0 1000 500" ]


view : Model -> Html.Html Msg
view model =
    viewSvgParts model


type alias Model =
    { squares : List Square
    , triangles : List Triangle
    , seed : Seed
    }


type Msg
    = NewSquares (List Square)
    | NewTriangles (List Triangle)
    | MoveX Float


moveX : { a | x : Float, transformX : Float, velocityX : Float, size : Float, initialRotation : Float } -> Float
moveX { x, transformX, velocityX, size, initialRotation } =
    let
        newX =
            transformX + velocityX
    in
        if x + newX > width * 1.5 then
            if initialRotation > 0 then
                -1.75 * width
            else
                0
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
        NewSquares squares ->
            ( { model | squares = (model.squares ++ squares) }, Cmd.none )

        NewTriangles triangles ->
            ( { model | triangles = (model.triangles ++ triangles) }, Cmd.none )

        MoveX newDiff ->
            ( { model
                | squares = List.map stepSquare model.squares
                , triangles = List.map stepTriangle model.triangles
              }
            , Cmd.none
            )


spreadOverWidth : Int -> Float -> Float -> List Float
spreadOverWidth n min max =
    let
        step =
            (max - min) / (toFloat n)
    in
        List.range 0 n
            |> List.map toFloat
            |> List.map (\index -> min + index * step)


type ShapeGenerator
    = TriangleShape Float
    | SquareShape Float


evenOddShapes : List Float -> List ShapeGenerator
evenOddShapes spread =
    spread
        |> List.indexedMap
            (\i size ->
                if i % 2 == 0 then
                    SquareShape size
                else
                    TriangleShape size
            )


randomShapes : List (Cmd Msg)
randomShapes =
    evenOddShapes (spreadOverWidth 8 -width width)
        |> List.map
            (\shape ->
                case shape of
                    SquareShape size ->
                        Random.generate NewSquares (Random.list 1 (randomSquare size))

                    TriangleShape size ->
                        Random.generate NewTriangles (Random.list 1 (randomTriangle size))
            )


randomShapesFromSeed : Model -> Model
randomShapesFromSeed model =
    evenOddShapes (spreadOverWidth 8 -width width)
        |> List.foldl
            (\shape model ->
                case shape of
                    SquareShape size ->
                        let
                            ( newSquare, nextSeed ) =
                                Random.step (randomSquare size) model.seed
                        in
                            { model | seed = nextSeed, squares = newSquare :: model.squares }

                    TriangleShape size ->
                        let
                            ( newTriangle, nextSeed ) =
                                Random.step (randomTriangle size) model.seed
                        in
                            { model | seed = nextSeed, triangles = newTriangle :: model.triangles }
            )
            model


initialModel : Model
initialModel =
    { squares = []
    , triangles = []
    , seed = Random.initialSeed 227852860
    }


init : ( Model, Cmd Msg )
init =
    ( randomShapesFromSeed initialModel
    , Cmd.none
    )


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions =
            (\model ->
                Sub.batch
                    [ AnimationFrame.diffs (\seed -> MoveX seed) ]
            )
        }
