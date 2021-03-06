vcl 4.0;

backend default {
  .host = "127.0.0.1";
  .port = "8080";
}
sub vcl_recv {
	if (req.url ~ "^[^?]*\.(bmp|bz2|css|doc|eot|flv|gif|gz|ico|jpeg|jpg|js|less|mp[34]|pdf|png|rar|rtf|swf|tar|tgz|txt|wav|woff|xml|zip)(\?.*)?$") {
        unset req.http.Cookie;
        return (hash);
    }
}
sub vcl_backend_response {
	if (req.url ~ "^[^?]*\.(bmp|bz2|css|doc|eot|flv|gif|gz|ico|jpeg|jpg|js|less|mp[34]|pdf|png|rar|rtf|swf|tar|tgz|txt|wav|woff|xml|zip)(\?.*)?$") {
        unset beresp.http.set-cookie;
    }
}
sub vcl_deliver {
    set resp.http.x-cache-hits = obj.hits;
    if (obj.hits > 0) {
        set resp.http.x-cache = "hit";
    } else {
        set resp.http.x-cache = "miss";
    }
}