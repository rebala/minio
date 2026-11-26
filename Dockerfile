FROM alpine:3.20

RUN apk add --no-cache ca-certificates && \
    addgroup -S minio && adduser -S minio -G minio

# Copy the binary from builder
COPY ./minio /usr/local/bin/minio

USER minio
WORKDIR /home/minio

COPY dockerscripts/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

EXPOSE 9000 9001
VOLUME ["/data"]

CMD ["minio"]
