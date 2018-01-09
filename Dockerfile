FROM hypriot/rpi-alpine:3.6

LABEL maintainer="swestcott@gmail.com"

ENV TRAEFIK_VERSION 1.4.6

RUN sed -i -e 's/http/https/g' /etc/apk/repositories \
	&& apk upgrade --no-cache \
	&& apk add --no-cache ca-certificates

ADD https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_linux-arm /traefik
#COPY traefik_linux-arm /traefik

RUN chmod +x /traefik

EXPOSE 80 443 8080

ENTRYPOINT [ "/traefik" ]
