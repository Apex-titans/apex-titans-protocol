# Deploy Guide (Apex Titans Protocol)

This repo currently includes demo contracts and documentation.
Deploy options are below.

## Option A — Remix VM (Free)
Use Remix VM for zero-cost local deployment:
1. Open Remix
2. Compile contracts
3. Deploy using "Remix VM"
4. Use deployed addresses for demo/testing only

## Option B — Public Testnet (Needs Gas)
To deploy publicly (for anyone to verify), you must deploy to a testnet:
- Requires a small amount of testnet gas token
- Recommended: Sepolia (Ethereum) or BSC Testnet

Steps:
1. Connect MetaMask in Remix
2. Switch MetaMask to testnet
3. Deploy contracts
4. Publish addresses in README

## Option C — Mainnet (Needs Real Gas)
Mainnet deployments require real gas.
Do NOT deploy mainnet contracts until:
- the code is audited
- roles/ownership are confirmed
- you fully understand risks

## Notes
- Remix VM addresses are not publicly verifiable
- Testnet/mainnet addresses are permanent once deployed
