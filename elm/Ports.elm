port module Ports exposing (triggerAnim, init)


port init : () -> Cmd msg


port triggerAnim : () -> Cmd msg
