FROM debian:jessie
MAINTAINER Damien Carcel &lt;damien.carcel@akeneo.com&gt;

ENV DEBIAN_FRONTEND noninteractive

# Install MongoDB
RUN apt-get update && \
    apt-get --yes --quiet install mongodb && \
    apt-get clean && apt-get --yes --quiet autoremove --purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 27017

# Run mongod in foreground
RUN mkdir /data && mkdir /data/db
CMD ["/usr/bin/mongod", "--nojournal"]
