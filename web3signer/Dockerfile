ARG UPSTREAM_VERSION

FROM consensys/web3signer:$UPSTREAM_VERSION
USER root

COPY entrypoint.sh /usr/bin/entrypoint.sh

#USER web3signer
EXPOSE 9000
ENTRYPOINT /bin/bash /usr/bin/entrypoint.sh