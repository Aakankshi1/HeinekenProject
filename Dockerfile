FROM nginx
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir /etc/nginx/default.d 
COPY nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY ssl-redirect.conf /etc/nginx/default.d
COPY nginx-selfsigned.key /etc/ssl/private/
COPY dhparam.pem /etc/ssl/certs/
COPY index.html /usr/share/nginx/html
COPY ssl.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
RUN /etc/init.d/nginx start

