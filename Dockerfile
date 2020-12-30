FROM nginx
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir /etc/nginx/default.d 
COPY ngnix_files/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY ngnix_files/ssl-redirect.conf /etc/nginx/default.d
COPY ngnix_files/nginx-selfsigned.key /etc/ssl/private/
COPY ngnix_files/dhparam.pem /etc/ssl/certs/
COPY ngnix_files/index.html /usr/share/nginx/html
COPY ngnix_files/ssl.conf /etc/nginx/conf.d/
COPY ngnix_files/nginx.conf /etc/nginx/nginx.conf
RUN /etc/init.d/nginx start

