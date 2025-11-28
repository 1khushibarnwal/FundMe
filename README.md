# FundMe

## About

This is a minimal project allowing users to fund the contract owner with donations. The smart contract accepts ETH as donations, denominated in USD. Donations have a minimal USD value, otherwise they are rejected. The value is priced using a Chainlink price feed, and the smart contract keeps track of doners in case they are to be rewarded in the future.

## Requirements
[git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) \
[foundry](https://getfoundry.sh/)

## Quick Start

```bash
git clone https://github.com/1khushibarnwal/FundMe 
cd FundMe 
make
```


## Deploy

```foundry
forge script script/DeployFundMe.s.sol
```

# Deployment to a testnet or mainnet
1. Setup environment variables
You'll want to set your SEPOLIA_RPC_URL and PRIVATE_KEY as environment variables. You can add them to a .env file, similar to what you see in.

* PRIVATE_KEY: The private key of your account (like from [metamask](https://metamask.io/)).

NOTE: FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
You can [learn how to export it here](https://metamask.zendesk.com/auth/v2/login/signin?return_to=https%3A%2F%2Fmetamask.zendesk.com%2Fhc%2Fen-us%2Farticles%2F360015289632-How-to-Export-an-Account-Private-Key&theme=hc&locale=en-gb&brand_id=20016643355548&auth_origin=20016643355548%2Cfalse%2Ctrue).


* SEPOLIA_RPC_URL: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://www.alchemy.com/)


Optionally, add your ETHERSCAN_API_KEY if you want to verify your contract on [Etherscan](https://etherscan.io/).

2. Get testnet ETH
Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your metamask.

3. Deploy
```
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Scripts
After deploying to a testnet or local net, you can run the scripts.

Using cast deployed locally example:
```
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```
or
```
forge script script/Interactions.s.sol:FundFundMe --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
forge script script/Interactions.s.sol:WithdrawFundMe --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
```

## Withdraw
```
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()"  --private-key <PRIVATE_KEY>
```

## Estimate gas
You can estimate how much gas things cost by running:
```
forge snapshot
```
And you'll see an output file called .gas-snapshot

# Formatting
To run code formatting:
```
forge fm
```

## Contributing

Pull requests are welcome. 

Please make sure to update tests as appropriate.

I am working on deploying it in the L2 ecosystem, any suggestion to it will be of a great help.
Though I have a ZkSyncDevOps.t.sol file, but it doesn't solve this issue pretty well.
# Thank you!
If you appreciated this, feel free to follow me and suggest me changes that could help me improve!

