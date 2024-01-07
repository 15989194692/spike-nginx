
server {
    listen 8881;
    location /hello {
        limit_req zone=mylimit burst=1;
        default_type text/html;
        content_by_lua_block {
            ngx.say("<p>hello,world</p>")
        }
    }

    location /spike-web {
        default_type text/plain;
            proxy_pass http://spike-web;
    }

    location /spike-support {
        default_type text/plain;
            proxy_pass http://spike-support/;
    }

}



