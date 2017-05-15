port module Ports
    exposing
        ( triggerAnim
        , init
        , startBuyTicketAnim
        , stopBuyTicketAnim
        , scrollToId
        )


port init : () -> Cmd msg


port triggerAnim : () -> Cmd msg


port startBuyTicketAnim : () -> Cmd msg


port stopBuyTicketAnim : () -> Cmd msg


port scrollToId : String -> Cmd msg
