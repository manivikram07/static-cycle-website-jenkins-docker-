FROM httpd
MAINTAINER name manikanta
LABEL this is my first dockerfile
EXPOSE 80
COPY . /usr/local/apache2/htdocs/
