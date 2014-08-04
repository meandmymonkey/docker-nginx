FROM ubuntu:14.04

MAINTAINER Andreas Hucks "andreas@inputrequired.org"

RUN \
    add-apt-repository -y ppa:nginx/stable && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        python-software-properties \
        nginx

RUN \
    mkdir /var/www && echo "Nginx container" > /var/www/index.html

ADD default /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx"]