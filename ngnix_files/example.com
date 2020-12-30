server {
    listen 443 ssl;
    listen [::]:443 ssl;
    include snippets/self-signed.conf;
    include snippets/ssl-params.conf;

    server_name localhost 3.21.127.6;

    root /usr/share/nginx/html;
    index index.html index.htm index.nginx-debian.html;

}

server {
    listen 80;
    listen [::]:80;

    server_name localhost 3.21.127.6;

    return 302 https://3.21.127.6;
}
