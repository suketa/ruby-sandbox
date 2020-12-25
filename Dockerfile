FROM ruby:2.7.2-alpine3.12

ENV RUBY_VERSION_MAJOR=3
ENV RUBY_VERSION_MINOR=0
ENV RUBY_VERSION_PATCH=0

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache --virtual=.build-dependencies \
      build-base \
      curl \
      curl-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      yaml-dev \
      zlib-dev && \
    apk add --update --no-cache \
      bash \
      git \
      openssh
RUN curl https://cache.ruby-lang.org/pub/ruby/${RUBY_VERSION_MAJOR}.${RUBY_VERSION_MINOR}/ruby-${RUBY_VERSION_MAJOR}.${RUBY_VERSION_MINOR}.${RUBY_VERSION_PATCH}.tar.gz -o ruby.tar.gz && tar zxvf ruby.tar.gz && cd ruby* && ./configure && make && make install

