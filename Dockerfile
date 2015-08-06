FROM ubuntu:14.04

ENV APP_DIR /home/app

RUN apt-get update
RUN apt-get -y install memcached

#Configure nginx
RUN apt-get install -y nginx-extras
RUN unlink /etc/nginx/sites-enabled/default
COPY ./config/local.vhost.conf /etc/nginx/sites-available/local
COPY ./config/gzip.conf        /etc/nginx/conf.d/gzip.conf
COPY ./config/nginx.conf       /etc/nginx/nginx.conf
RUN ln -s /etc/nginx/sites-available/local /etc/nginx/sites-enabled/local

#prepare volume to be mounted
RUN mkdir ${APP_DIR}
VOLUME ${APP_DIR}

#Expose port 80
EXPOSE 80 443

#run nginx
#CMD ["nginx", "-g", "daemon off;"]
