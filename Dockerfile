FROM bmoorman/alpine:3.11

ENV RCON_PORT=25575

RUN apk add --no-cache \
    curl \
    jq \
 && fileUrl=$(curl --silent --location "https://api.github.com/repos/itzg/rcon-cli/releases/latest" | jq --raw-output '.assets[] | select(.name | contains("linux_amd64.tar.gz")) | .browser_download_url') \
 && curl --silent --location "${fileUrl}" | tar xz -C /usr/local/bin

ENTRYPOINT ["/usr/local/bin/rcon-cli"]
