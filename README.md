# DAppNode Package _Web3signer-LUKSO_

![](node-avatar.png)

<!--Brief introduction about the source project (official project definition is an option): -->

A validator client contributes to the consensus of the Ethereum Blockchain by signing proposals and attestations of blocks, using a BLS private key which must be available to this client at all times.

The BLS remote signer API is designed to be consumed by validator clients, looking for a more secure avenue to store their BLS12-381 private key(s), enabling them to run in more permissive and scalable environments.

More information about the EIP can be found at [the official website](https://eips.ethereum.org/EIPS/eip-3030)

### Why _Web3signer_ ?

<!--What can you do with this package?: -->

Client diversity is a key benefit of DAppNode, with our implementation of ConsenSys's remote Web3Signer you will be able to use different clients and don't need to put all your trust in just one validator client. The remote signer can work as a load balancer, keeping your validators always validating.

### Requirements

Rquirements to run The DAppNode Web3Signer-LUKSO

<!--Requirements to run the Dappnode package in a list: -->

- **Validator**: Set up your validator at https://deposit.mainnet.lukso.network
- **Execution Layer Client**: You need to have installed and synced an EL client such as LUKSO Geth
- **Consensus Layer Client**: You need to have installed and synced a CL client such as Prysm LUKSO
