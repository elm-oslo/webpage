port module Ports exposing
    ( init
    , scrollToId
    , startBuyTicketAnim
    , stopBuyTicketAnim
    , triggerAnim
    )


port init : () -> Cmd msg


port triggerAnim : () -> Cmd msg


port startBuyTicketAnim : () -> Cmd msg


port stopBuyTicketAnim : () -> Cmd msg


port scrollToId : String -> Cmd msg
