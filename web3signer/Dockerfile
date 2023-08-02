ARG UPSTREAM_VERSION

FROM consensys/web3signer:$UPSTREAM_VERSION
USER root
RUN apt update && apt install ca-certificates wget --yes

ENV CHAIN_CONFIG_FILE_PATH /configs/mainnet/shared/config.yaml

RUN mkdir -p "$(dirname ${CHAIN_CONFIG_FILE_PATH})"

# Get Lukso config and genesis for Prysm
RUN wget https://raw.githubusercontent.com/lukso-network/network-configs/main/mainnet/shared/config.yaml -O ${CHAIN_CONFIG_FILE_PATH}

COPY /security /security
COPY entrypoint.sh /usr/bin/entrypoint.sh

#USER web3signer
EXPOSE 9000
ENTRYPOINT /bin/bash /usr/bin/entrypoint.sh