FROM alpine
LABEL maintainer="Sean Harrison <sah@kruxia.com>"

# -- subversion apache server --
RUN apk update \
    && apk add \
        apache2 \
        apache2-webdav \
        mod_dav_svn \
    && apk upgrade \
    && rm -rf /var/cache/apk/*

WORKDIR /etc/apache2
COPY ./dav_svn.conf /etc/apache2/conf.d/dav_svn.conf
COPY ./default-svn.conf /etc/apache2/conf.d/default-svn.conf

RUN mkdir -p /var/svn \
    && chown apache:apache -R /var/svn

WORKDIR /var/svn
EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
