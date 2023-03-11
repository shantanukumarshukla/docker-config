FROM redis:3.0-alpine

ADD redis-sentinel.conf /etc/redis-sentinel.conf

# redis likes to write to it's own config file
RUN chown redis:redis /etc/redis-sentinel.conf

# normal redis PORT 6379 is still exposed :(
#   see: https://github.com/docker/docker/issues/3465
EXPOSE 26379

CMD ["redis-server", "/etc/redis-sentinel.conf", "--sentinel"]

