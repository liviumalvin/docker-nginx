FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install memcached

#Configure nginx
RUN apt-get install -y nginx-extras
RUN unlink /etc/nginx/sites-enabled/default

COPY /configs/local.vhost.conf /etc/nginx/sites-available/local
COPY /configs/gzip.conf        /etc/nginx/conf.d/gzip.conf
COPY /configs/nginx.conf       /etc/nginx/nginx.conf

RUN ln -s /etc/nginx/sites-available/local /etc/nginx/sites-enabled/local

#run nginx
#CMD ["nginx", "-g", "daemon off;"]
