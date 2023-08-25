#!/bin/bash

export KEYFILES_DIR="/data/keyfiles"
export NETWORK="lukso"
export WEB3SIGNER_API="http://web3signer.web3signer-${NETWORK}.dappnode:9000"

# Assign proper value to LUKSO_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_LUKSO. The UI uses the web3signer domain in the Header "Host"
case "$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_LUKSO" in
"prysm-${NETWORK}.dnp.dappnode.eth")
  ETH2_CLIENT_DNS="validator.prysm-${NETWORK}.dappnode"
  ;;
"teku-${NETWORK}.dnp.dappnode.eth")
  ETH2_CLIENT_DNS="validator.teku-${NETWORK}.dappnode"
  ;;
"lighthouse-${NETWORK}.dnp.dappnode.eth")
  ETH2_CLIENT_DNS="validator.lighthouse-${NETWORK}.dappnode"
  ;;
"nimbus-${NETWORK}.dnp.dappnode.eth")
  ETH2_CLIENT_DNS="beacon-validator.nimbus-${NETWORK}.dappnode"
  ;;
"lodestar-${NETWORK}.dnp.dappnode.eth")
  ETH2_CLIENT_DNS="validator.lodestar-${NETWORK}.dappnode"
  ;;
*)
  echo "_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_LUKSO env is unknown. Setting ${_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_LUKSO} as ETH2_CLIENT_DNS"
  ETH2_CLIENT_DNS=$_DAPPNODE_GLOBAL_CONSENSUS_CLIENT_LUKSO
  ;;
esac

# IMPORTANT! The dir defined for --key-store-path must exist and have specific permissions. Should not be created with a docker volume
mkdir -p "$KEYFILES_DIR"

if grep -Fq "/opt/web3signer/keyfiles" ${KEYFILES_DIR}/*.yaml; then
  sed -i "s|/opt/web3signer/keyfiles|$KEYFILES_DIR|g" ${KEYFILES_DIR}/*.yaml
fi

# Run web3signer binary
exec /opt/web3signer/bin/web3signer \
  --key-store-path="$KEYFILES_DIR" \
  --http-listen-port=9000 \
  --http-listen-host=0.0.0.0 \
  --http-host-allowlist="web3signer.web3signer-${NETWORK}.dappnode,brain.web3signer-${NETWORK}.dappnode,$ETH2_CLIENT_DNS" \
  --http-cors-origins=* \
  --metrics-enabled=true \
  --metrics-host 0.0.0.0 \
  --metrics-port 9091 \
  --metrics-host-allowlist="*" \
  --idle-connection-timeout-seconds=900 \
  eth2 \
  --network=${NETWORK} \
  --slashing-protection-db-url=jdbc:postgresql://postgres.web3signer-${NETWORK}.dappnode:5432/web3signer \
  --slashing-protection-db-username=postgres \
  --slashing-protection-db-password=password \
  --slashing-protection-pruning-enabled=true \
  --slashing-protection-pruning-epochs-to-keep=500 \
  --key-manager-api-enabled=true \
  ${EXTRA_OPTS}
