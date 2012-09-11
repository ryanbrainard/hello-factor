USING: namespaces environment accessors math.parser http http.server threads furnace.actions ;
[ "PORT" os-env string>number httpd ] in-thread
<action> [
  <response>
    200 >>code
    "text/plain" >>content-type
    "Hello World" >>body
] >>display main-responder set-global
