FROM nginx:alpine 
MAINTAINER mailaakankshi@gmail.com 

COPY heinekenproject.crt /etc/ssl/certs
RUN cat /etc/ssl/certs/heinekenproject.crt >> /etc/ssl/certs/ca-certificates.crt
RUN update-ca-certificates
COPY ./beginner-html-site-styled/index.html /usr/share/nginx/html
CMD /usr/sbin/nginx -g 'daemon off;'