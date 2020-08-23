FROM nginx:latest

# ADD NEW CONFIG FILE
RUN ["rm", "/etc/nginx/conf.d/default.conf"]
COPY conf/nginx.conf /etc/nginx

# BUILD THE WEB FILES
COPY srcs /data/www

# RUN NGINX
RUN ["service", "nginx", "start"]

FROM phpmyadmin/phpmyadmin:latest

FROM mariadb:latest
FROM mariadb/server:latest

EXPOSE 80

