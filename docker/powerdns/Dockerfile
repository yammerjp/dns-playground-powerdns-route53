# https://takapi86.hatenablog.com/entry/2020/12/27/191235
FROM debian

RUN apt-get update -qqy \
 && apt-get install -qqy \
    pdns-server \
    pdns-backend-sqlite3 \
    sqlite3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY ./pdns.conf /etc/pdns/pdns.conf

RUN mkdir -p /var/lib/powerdns \
  && sqlite3 /var/lib/powerdns/pdns.sqlite3 < /usr/share/doc/pdns-backend-sqlite3/schema.sqlite3.sql

RUN chown -R pdns:pdns /var/lib/powerdns

CMD ["/usr/sbin/pdns_server"]
