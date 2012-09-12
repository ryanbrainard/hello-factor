USING: namespaces environment accessors math.parser http http.server threads furnace.actions html.forms http.server.dispatchers http.server.responses urls ;

IN: webapps.hello

TUPLE: hello < dispatcher ;

: <hello-action> ( -- action )
    <page-action>
        [ "Hello, world!" "text/plain" <content> ] >>display ;

: <hello> ( -- dispatcher )
    hello new-dispatcher
        <hello-action> "" add-responder ;

: run-hello ( -- http-server )
    <hello>
        main-responder set-global
    "PORT" os-env string>number httpd ;

MAIN: run-hello
