FROM alpine
LABEL maintainer="Sean Harrison <sah@kruxia.com>"

# -- subversion apache server --
# NOTE: Installing apache2 on Alpine creates user apache -u 100 -g 101
RUN apk update \
    && apk add \
        apache2 \
        apache2-webdav \
        apache2-mod-wsgi \
        mod_dav_svn \
    && apk upgrade \
    && rm -rf /var/cache/apk/*

COPY ./httpd.conf /etc/apache2/httpd.conf
COPY ./dav_svn.conf /etc/apache2/conf.d/dav_svn.conf
COPY ./default-svn.conf /etc/apache2/conf.d/default.conf
COPY ./admin/ /var/admin/

RUN mkdir -p /var/svn \
    && chown apache:apache -R /var/svn

WORKDIR /var/svn
EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
