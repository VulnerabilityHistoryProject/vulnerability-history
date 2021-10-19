# uses the specified ruby version - i'm just going from the version in the germfile, so if that changes, this should change
FROM ruby:3.0-alpine

ENV APP_PATH /var/app
ENV BUNDLER_VERSION 2.2.17
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV TEMP_PATH /tmp/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000
ENV RAILS_DB host.docker.internal

COPY ./entrypoints/dev-docker-entrypoint.sh /usr/local/bin/dev-entrypoint.sh
COPY ./entrypoints/test-docker-entrypoint.sh /usr/local/bin/test-entrypoint.sh
COPY ./entrypoints/webpacker-docker-entrypoint.sh /usr/local/bin/webpacker-entrypoint.sh
RUN chmod +x /usr/local/bin/dev-entrypoint.sh && chmod +x /usr/local/bin/test-entrypoint.sh && chmod +x /usr/local/bin/webpacker-entrypoint.sh

# setup dependencies for rails
RUN apk -U add --no-cache \
    build-base \
    git \
    postgresql-dev \
    postgresql-client \
    libxml2-dev \ 
    libxslt-dev \
    nodejs \
    yarn \
    imagemagick \
    tzdata \
    less \ 
    sqlite-dev \
    && rm -rf /var/cache/apk* \
    && mkdir -p $APP_PATH

RUN gem install bundler --version 2.2.17 \
&& rm -rf $GEM_HOME/cache/*

WORKDIR $APP_PATH

EXPOSE $RAILS_PORT
EXPOSE 3035
EXPOSE 4444
EXPOSE 5900

ENTRYPOINT ["bundle", "exec"]