FROM python:2

MAINTAINER Jacob Evans "docker@jacobdevans.com"

ENV PATH /reposado/code:$PATH

RUN mkdir -p /reposado/code /reposado/html /reposado/metadata \
    && curl -sSL https://github.com/wdas/reposado/tarball/master | tar zx \
    && cp -rf wdas-reposado-*/code/* /reposado/code/ \
    && rm -f master /etc/nginx/sites-enabled/default /etc/service/nginx/down \
    && rm -rf wdas-reposado-* /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY preferences.plist /reposado/code/

VOLUME /reposado/html
VOLUME /reposado/metadata
