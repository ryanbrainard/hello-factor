USING: environment http http.server threads furnace.actions ;
[ "PORT" os-env httpd ] in-thread
<action> [
  <response>
    200 >>code
    "text/plain" >>content-type
    "Hello World" >>body
] >>display main-responder set-global
