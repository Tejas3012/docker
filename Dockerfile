FROM ubuntu:latest
RUN apt-get update && apt-get install -y curl 
RUN apt-get install apache2 -y 
CMD echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD service apache2 start
CMD ["apache2ctl", "-D", "FOREGROUND"]
WORKDIR /var/www/html
RUN rm index.html
RUN curl -o finexo.zip  https://www.free-css.com/assets/files/free-css-templates/download/page296/finexo.zip
RUN  apt-get update && apt-get install -y unzip
RUN unzip finexo.zip -d finexo 
RUN rm  finexo.zip
RUN cd  finexo
RUN mv /var/www/html/finexo/*  /var/www/html 

