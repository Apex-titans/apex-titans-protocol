Apex Titans Protocol – Testnet Deployment Guide

Purpose

This guide provides a step-by-step, reproducible process for deploying Apex Titans Protocol (ATS) to a public testnet. It is designed for engineers and operators to deploy safely, verify correctness, and publish results transparently.

This guide assumes no custody of user funds and prioritizes replay safety, auditability, and rollback readiness.


---

Supported Testnets (Initial)

Ethereum Sepolia (recommended)

BSC Testnet (optional)


> Choose one testnet for v0.2 to minimize surface area.




---

Prerequisites

Tooling

Node.js (LTS)

Hardhat or Foundry

Ethers.js / Viem

Testnet RPC endpoint

Block explorer API key (for verification)


Accounts

Deployer EOA (fresh, limited funds)

Multisig (optional, for governance-ready flows)



---

Deployment Order (Mandatory)

1. OwnershipProofRegistry


2. ProofVerifier


3. ATS Token (testnet instance)



> Do NOT change this order.




---

Step 1 – Pre-Deployment Checks

[ ] Contracts compile cleanly

[ ] Compiler versions pinned

[ ] Test suite passing

[ ] Testnet Security Checklist reviewed

[ ] Deployer balance sufficient



---

Step 2 – Deploy OwnershipProofRegistry

Deploy with no constructor privileges

Record deployed address

Verify contract on block explorer


Verification checklist:

No owner-only asset functions

Events emitted correctly



---

Step 3 – Deploy ProofVerifier

Initialize with registry address

Confirm anti-replay logic wired

Verify on block explorer


Verification checklist:

Invalid proofs revert

Reuse attempts revert



---

Step 4 – Deploy ATS Token (Testnet)

Fixed supply deployment

No mint/burn privileges enabled

Verify on block explorer


Verification checklist:

Total supply fixed

No owner mint functions



---

Step 5 – Post-Deployment Validation

Run the following flows on-chain:

Commit ownership proof

Verify ownership

Consume proof (single-use)

Attempt replay (must fail)


Record tx hashes publicly.


---

Step 6 – Observability Setup

Index commitment events

Index proof consumption events

Basic dashboards for:

Commitment count

Replay failures




---

Step 7 – Public Disclosure

Publish:

Network name

Contract addresses

Verified source links

Demo transaction hashes


No marketing language.


---

Rollback & Recovery

If critical issues are found:

Halt further interaction (do not migrate users)

Publish incident notice

Patch in new deployment


No silent redeployments.


---

Go / No-Go Criteria

Proceed only if:

Replay protection holds

Ownership verification correct

No critical issues reported


Otherwise, remain in testnet.


---

Summary

Testnet deployment is a validation step, not a launch.

Apex Titans moves forward only when:

Ownership truth is provable

Enforcement cannot be bypassed

Transparency is maintained
