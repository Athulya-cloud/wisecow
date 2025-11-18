FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
        cowsay \
        netcat-openbsd \
        fortune-mod \
        fortunes \
        fortunes-min \
        fortunes-ubuntu-server \
        fortunes-off \
        fortunes-mario \
        fortunes-bofh-excuses \
    && ln -s /usr/games/fortune /usr/local/bin/fortune \
    && ln -s /usr/games/cowsay /usr/local/bin/cowsay \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY wisecow.sh .

RUN chmod +x wisecow.sh

EXPOSE 4499

CMD ["./wisecow.sh"]
