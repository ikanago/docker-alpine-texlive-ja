FROM paperist/alpine-texlive-ja:latest

RUN apk update \
    && apk add git

RUN rm -rf /var/cache/apk/*
RUN rm -rf /tmp/*

RUN chmod -R 777 /usr/local/texlive

ARG UID=1000
RUN adduser -D -u ${UID} latex
USER ${UID}

WORKDIR /workdir

CMD ["sh"]
