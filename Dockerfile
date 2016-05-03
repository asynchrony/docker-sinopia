FROM node:4-slim

WORKDIR /root

RUN npm install -g sinopia2 sinopia-ldap \
 && mkdir /root/sinopia \
 && apt-get update \
 && apt-get install -y curl --no-install-recommends \
 && rm -rf /var/lib/apt/lists/* \
 && curl -sSL https://github.com/kelseyhightower/confd/releases/download/v0.12.0-alpha3/confd-0.12.0-alpha3-linux-amd64 -o /usr/bin/confd \
 && echo "437524fe3334bd9d0424ed0ece265472e789d19e /usr/bin/confd" | sha1sum -c - \
 && chmod +x /usr/bin/confd \
 && apt-get purge -y --auto-remove curl

COPY confd /etc/confd
COPY start.sh /start.sh

EXPOSE 4873

CMD ["/start.sh"]