server {
  listen 8080;

  server_name example.com www.example.com;

  set $upstream "http://widget.empire";

  location / {
    include conf.d/proxy_common.conf;
    proxy_pass $upstream;
    proxy_ssl_session_reuse off;
  }
}
