FROM bmoorman/alpine:3.15

ARG TARGETOS \
    TARGETARCH \
    TARGETVARIANT

ENV RCON_PORT=25575

RUN apk add --no-cache \
    curl \
    jq \
 && target=${TARGETOS}_${TARGETARCH}${TARGETVARIANT} \
 && fileUrl=$(curl --silent --location "https://api.github.com/repos/itzg/rcon-cli/releases/latest" | jq --arg target ${target} --raw-output '.assets[] | select(.name | endswith($target + ".tar.gz")) | .browser_download_url') \
 && curl --silent --location "${fileUrl}" | tar xz -C /usr/local/bin

ENTRYPOINT ["rcon-cli"]
