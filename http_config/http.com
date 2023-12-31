
server {
    listen 8881;
    location / {
        default_type text/html;
        content_by_lua_block {
            ngx.say("<p>hello,world</p>")
        }
    }
}