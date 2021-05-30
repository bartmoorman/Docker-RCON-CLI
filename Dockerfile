FROM bmoorman/alpine:3.13

ARG TARGETARCH \
    TARGETVARIANT

ENV RCON_PORT=25575

RUN apk add --no-cache \
    curl \
    jq \
 && arch=${TARGETARCH}${TARGETVARIANT} \
 && fileUrl=$(curl --silent --location "https://api.github.com/repos/itzg/rcon-cli/releases/latest" | jq --arg arch ${arch} --raw-output '.assets[] | select(.name | endswith("linux_" + $arch + ".tar.gz")) | .browser_download_url') \
 && curl --silent --location "${fileUrl}" | tar xz -C /usr/local/bin

ENTRYPOINT ["rcon-cli"]
