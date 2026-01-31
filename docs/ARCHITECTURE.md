# Architecture — Apex Titans v0.1

## Components
### 1) OwnershipProofRegistry
- Stores commitment => (owner, timestamp)
- Commitment is a bytes32 value representing an ownership proof reference.

### 2) ProofVerifier
- Reads registry via staticcall
- Validates:
  - commitment exists
  - caller is the stored owner
  - commitment has not been used before
- Marks commitment as used (anti-replay)

### 3) ATS Token
- Fixed supply: 5,000,000 ATS
- No mint function

## Flow (Demo)
1. User creates commitment (bytes32)
2. User calls `commitProof(commitment)` on registry
3. User calls `verifyAndConsume(commitment)` on verifier
4. Verifier accepts once; second attempt fails with `already used`
