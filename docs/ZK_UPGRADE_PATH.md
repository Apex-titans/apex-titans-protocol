# Apex Titans Protocol – ZK Upgrade Path

## Purpose

This document describes the Zero-Knowledge (ZK) upgrade path for Apex Titans Protocol (ATS). The goal is to enhance privacy, scalability, and verification efficiency **without changing the core security model**.

Apex Titans uses ZK not for speculation or rollups, but for **privacy-preserving ownership verification** and **manipulation-resistant enforcement**.

---

## Why ZK Is Required

While the current registry-based model is correct for v0.1, it exposes:

* Ownership timing
* Proof usage patterns
* Potential position inference

ZK allows the protocol to:

* Prove ownership **without revealing addresses or amounts**
* Preserve manipulation detection guarantees
* Prevent whale front-running based on visible commitments

---

## ZK Design Principles

* ZK proofs **replace trust**, not logic
* No asset custody inside ZK circuits
* No rollup dependency
* No bridge dependency

ZK is used strictly as a **verification layer**.

---

## ZK Ownership Proof Model (v0.2)

### Statement Proved

> "I control a valid ownership commitment that satisfies the protocol rules and has not been previously consumed."

Without revealing:

* Wallet address
* Asset amount
* Chain of origin

---

## Circuit Inputs

### Private Inputs

* Owner secret key
* Ownership commitment preimage
* Proof nonce

### Public Inputs

* Commitment hash
* Nullifier hash
* Verification root

---

## Anti-Replay via Nullifiers

* Each ownership proof generates a unique nullifier
* Nullifiers are stored on-chain
* Reuse automatically invalidates the proof

This preserves the anti-replay guarantee currently enforced by ProofVerifier.

---

## Manipulation Detection Compatibility

ZK **does not remove** manipulation detection.

Instead:

* Ownership delta proofs are aggregated
* Only delta validity is revealed
* Detection logic uses **proof existence + timing**, not identity

This maintains:

* Price vs ownership mismatch detection
* Liquidity trap identification
* Stop-hunt exposure

---

## Cross-Chain ZK Verification (v0.3)

ZK proofs can be verified across chains using:

* Light client consensus verification
* ZK-SNARK proof validation

No bridges.
No relayers.
No wrapped tokens.

---

## Performance Considerations

* Proof generation: Off-chain
* Proof verification: On-chain
* Gas cost reduced via aggregation
* Optional batching for validators

---

## Security Model

* No trusted setup exposure (preferred universal setup)
* Proof soundness enforced cryptographically
* Nullifier collision resistance
* Governance-controlled circuit upgrades

---

## Upgrade Phases

### Phase A – Registry → ZK Hybrid

* Both registry and ZK proofs supported
* Gradual migration

### Phase B – ZK Primary Verification

* Registry becomes optional
* ZK proofs default

### Phase C – Full ZK + Light Client

* Cross-chain proof verification
* Chain abstraction achieved

---

## Risks & Mitigations

| Risk                  | Mitigation                      |
| --------------------- | ------------------------------- |
| Circuit bug           | Limited rollout + audits        |
| Prover centralization | Multiple prover implementations |
| Gas spikes            | Aggregation & batching          |

---

## Summary

ZK is not an add-on in Apex Titans.
It is the final enforcement layer that ensures:

* Privacy for honest users
* Transparency for manipulation
* Scalability without bridges

Ownership remains provable.
Manipulation remains detectable.
Retail remains protected.
