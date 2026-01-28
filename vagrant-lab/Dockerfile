FROM almalinux:9

RUN dnf install -y httpd && dnf clean all

COPY html/ /var/www/html/
RUN chown -R apache:apache /var/www/html

EXPOSE 80
CMD ["/usr/sbin/httpd","-DFOREGROUND"]

