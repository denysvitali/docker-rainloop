FROM soch1/alpine-nginx-php
WORKDIR /app
USER root
RUN apk add php7-iconv
ARG RAINLOOP_VERSION=1.15.0
RUN wget https://github.com/RainLoop/rainloop-webmail/releases/download/v${RAINLOOP_VERSION}/rainloop-community-${RAINLOOP_VERSION}.zip -O /tmp/rainloop.zip && \
      mkdir public && \
      cd public && \
      unzip /tmp/rainloop.zip && \
      chown nginx:nginx data/ && \
      chmod 755 data/
COPY ./nginx/conf.d/default.conf /etc/nginx/conf.d/
ENV NGINX_DEFAULT_ROOT=public
COPY --chown=nginx entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
USER nginx
