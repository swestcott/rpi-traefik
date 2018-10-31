FROM resin/armhf-alpine:3.7

LABEL maintainer="swestcott@gmail.com" \
      org.label-schema.vcs-url="https://github.com/swestcott/rpi-traefik"

ENV TRAEFIK_VERSION 1.7.4

RUN ["cross-build-start"]

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-arm /traefik

RUN apk --update upgrade \
    && apk add ca-certificates \
    && rm -r /var/cache/apk/* \
    && chmod +x /traefik

#COPY traefik_linux-arm /traefik

RUN ["cross-build-end"]

EXPOSE 80 443 8080

ENTRYPOINT [ "/traefik" ]
