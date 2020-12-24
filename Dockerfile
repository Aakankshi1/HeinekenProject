FROM nginx:1.18.0 
MAINTAINER mailaakankshi@gmail.com 

COPY heinekenproject.crt /etc/ssl/certs
RUN cat /etc/ssl/certs/heinekenproject.crt >> /etc/ssl/certs/ca-certificates.crt
RUN update-ca-certificates
COPY ./index.html /usr/share/nginx/html
EXPOSE 80 443
CMD ["nginx"]