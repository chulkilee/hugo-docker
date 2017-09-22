FROM alpine:3.6
ENV HUGO_URL https://github.com/gohugoio/hugo/releases/download/v0.27.1/hugo_0.27.1_Linux-64bit.tar.gz
ENV HUGO_SHA256 0e6cb63e6aca10277b96023c4fed97ac3a3e922d12f073b8a80630946fe289e7
WORKDIR /tmp
RUN apk add --no-cache coreutils curl
RUN curl -sL -o hugo.tar.gz $HUGO_URL && \
  echo "$HUGO_SHA256 hugo.tar.gz" | sha256sum -c - && \
  tar zxf hugo.tar.gz

FROM alpine:3.6
WORKDIR /src
COPY --from=0 /tmp/hugo /usr/local/bin
CMD ["hugo"]
