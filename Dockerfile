# 使用官方 Nginx 镜像作为基础镜像
FROM openresty/openresty:latest

# 复制 OpenResty 配置文件到镜像中
ADD /conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
ADD /http_config/http.com /usr/local/openresty/nginx/http_config/http.com
ADD /http_config/server_upstream.conf /usr/local/openresty/nginx/http_config/server_upstream.conf

# 如果需要，将其他配置文件、静态文件等复制到镜像中
# COPY additional-config.conf /etc/nginx/conf.d/
# COPY static-html-directory /usr/share/nginx/html/

# 暴露 Nginx 默认的 HTTP 端口
EXPOSE 8881

# 在容器启动时运行 Nginx
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
# ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /spike-support-executable.jar --spring.profiles.active=$PROFILES"]