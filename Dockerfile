FROM nginx:latest

# RUN SOME PHP SCRIPT

# ADD NEW CONFIG FILE
RUN ["rm", "/etc/nginx/conf.d/default.conf"]
COPY conf/nginx.conf /etc/nginx

# BUILD THE WEB FILES
COPY build /data/www

# RUN NGINX
RUN ["service", "nginx", "start"]

EXPOSE 80

