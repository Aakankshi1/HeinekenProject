FROM nginx
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
#RUN mkdir /etc/ssl/private
#COPY nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
#COPY nginx-selfsigned.key /etc/ssl/private/
#COPY dhparam.pem /etc/ssl/certs/
COPY index.html /usr/share/nginx/html
#COPY ssl.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
#VOLUME /usr/share/nginx/html
#VOLUME /etc/nginx
RUN /etc/init.d/nginx start
