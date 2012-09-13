USING: accessors furnace.actions http.server
http.server.dispatchers http.server.responses io.servers kernel
namespaces environment math.parser ;

IN: webapps.hello

TUPLE: hello < dispatcher ;

: <hello-action> ( -- action )
    <page-action>
        [ "Hello, world!" "text/plain" <content> ] >>display ;

: <hello> ( -- dispatcher )
    hello new-dispatcher
        <hello-action> "" add-responder ;

: run-hello ( -- )
    <hello>
        main-responder set-global
    "PORT" os-env string>number httpd wait-for-server ;

MAIN: run-hello
