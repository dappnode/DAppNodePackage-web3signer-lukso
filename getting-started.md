## Welcome to the Web3signer for Lukso:

- This package is the entrypoint for handling your validator keystores
- The Web3signer takes care of signing requests for your validator, so that your Consensus Layer (CL) client can be changed with just a few clicks.
- All Staking Management is now in the [Stakers UI](http://my.dappnode/stakers/lukso)
- The Flyway service takes care of importing the previous version's slashing protection database when an update is installed, so it's meant to run only once per update, and *it is normal to see that the Flyway service is stopped**
