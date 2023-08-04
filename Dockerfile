# Use Alpine Linux as our base image so that we minimize the overall size our final container, and minimize the surface area of packages that could be out of date.
FROM alpine:3.18 AS hugo 


# config
ENV HUGO_VERSION=0.116.1
#ENV HUGO_TYPE=
ENV HUGO_TYPE=_extended

COPY ./run.sh /run.sh
ENV HUGO_ID=hugo${HUGO_TYPE}_${HUGO_VERSION}
RUN wget -O - https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_ID}_linux-amd64.tar.gz | tar -xz -C /tmp \
    && mkdir -p /usr/local/sbin \
    && mv /tmp/hugo /usr/local/sbin/hugo \
    && rm -rf /tmp/${HUGO_ID}_linux_amd64 \
    && rm -rf /tmp/LICENSE.md \
    && rm -rf /tmp/README.md

RUN apk add --update git asciidoctor gcompat  libc6-compat libstdc++ curl git gnupg  lsb-release \
    && apk upgrade \
    && apk add --no-cache ca-certificates \
    && chmod 0777 /run.sh

VOLUME /src
VOLUME /output

WORKDIR /src
CMD ["/run.sh"]

EXPOSE 1313


COPY . /data
WORKDIR /data
RUN hugo --gc --minify

FROM nginx:alpine
COPY --from=hugo /data/public /usr/share/nginx/html