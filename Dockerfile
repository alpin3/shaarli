FROM alpin3/php7-apache
MAINTAINER kost - https://github.com/kost

ENV SHAARLI_VERSION=0.12.1
ENV SHAARLI_URL=https://github.com/shaarli/Shaarli/releases/download/v$SHAARLI_VERSION/shaarli-v$SHAARLI_VERSION-full.tar.gz

RUN apk --update --no-cache add wget ca-certificates php-zlib php-dom php-curl php-simplexml php-tokenizer php-xmlwriter php-xml php-session php-ctype php-gd php-ldap git \
    && mkdir /php \
    && cd /php \
    && curl -L $SHAARLI_URL | tar -xvz --strip-components=1 -C /php -f -  \
    && chown -R apache:apache cache data pagecache tmp \
    && echo "LoadModule rewrite_module modules/mod_rewrite.so" > /etc/apache2/conf.d/rewrite.conf \
    && echo "Success"

ADD scripts/ /scripts
VOLUME ["/php/data"]

