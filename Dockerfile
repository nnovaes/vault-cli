FROM alpine:3.12.3
ENV vault_ver=1.6.1
SHELL ["/bin/ash", "-eo", "pipefail", "-c"]
RUN apk add --no-cache unzip curl && \
    curl -o tmp/vault.zip https://releases.hashicorp.com/vault/1.6.1/vault_${vault_ver}_linux_amd64.zip && \
    echo "75cd2b8c5527577c0da1105e11fba3c31f4112514a910c4f7ec527c9a8bf42d1  tmp/vault.zip"| sha256sum -c && \
    unzip -d /bin tmp/vault.zip && \
    rm -rf /var/cache/apk && \
    rm /tmp/vault.zip && \
    apk del unzip curl
#ENTRYPOINT [ "/bin/vault" ]