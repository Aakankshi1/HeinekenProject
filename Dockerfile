FROM nginx
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir /etc/nginx/snippets /etc/nginx/sites-available /etc/nginx/sites-enabled /etc/nginx/default.d 
COPY example.com /etc/nginx/sites-available/
COPY ssl-params.conf /etc/nginx/snippets/
COPY nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt
COPY self-signed.conf /etc/nginx/snippets
COPY ssl-redirect.conf /etc/nginx/default.d
RUN ln -s /etc/nginx/sites-available/www.example.com /etc/nginx/sites-enabled/
COPY nginx-selfsigned.key /etc/ssl/private/
COPY dhparam.pem /etc/ssl/certs/
COPY index.html /usr/share/nginx/html
COPY ssl.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
RUN /etc/init.d/nginx start

