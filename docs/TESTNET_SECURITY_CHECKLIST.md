Apex Titans Protocol – Testnet Security Checklist

Purpose

This checklist defines mandatory security validations that must be completed before, during, and after public testnet deployment. It is designed to prevent premature releases, surface hidden attack vectors, and ensure the protocol’s retail-protection guarantees remain intact.

This document is operational, not theoretical.


---

Phase A – Pre-Deployment Checks

A1. Contract Integrity

[ ] Contracts compile with no warnings

[ ] Compiler version pinned and documented

[ ] No unused state variables

[ ] No upgrade hooks enabled unintentionally


A2. Permission & Access Control

[ ] No owner-only functions that affect user funds

[ ] No hidden admin mint or burn paths

[ ] Emergency pause is non-custodial and scoped


A3. Replay Protection

[ ] Proofs cannot be reused

[ ] Nullifier / consumed-proof state verified

[ ] Cross-function replay attempts fail


A4. Input Validation

[ ] Zero-value proofs rejected

[ ] Invalid commitment hashes rejected

[ ] Unauthorized callers reverted



---

Phase B – Deployment Verification

B1. Deployment Correctness

[ ] Correct network selected

[ ] Verified contract addresses published

[ ] Bytecode matches compiled artifacts


B2. Event & Logging

[ ] Commitment events emitted correctly

[ ] Proof consumption events emitted

[ ] No sensitive data in logs



---

Phase C – Functional Adversarial Testing

C1. Ownership Abuse

[ ] Attempt proof usage by non-owner (must fail)

[ ] Attempt double-consumption (must fail)


C2. Gas & Griefing

[ ] Gas usage within expected bounds

[ ] No gas-based DoS vectors


C3. Timing Attacks

[ ] Commit and consume in same block tested

[ ] Delayed consumption tested



---

Phase D – Manipulation Enforcement Validation

D1. Detection Inputs

[ ] Ownership delta accurately tracked

[ ] Price-only movements flagged


D2. Retail Shield Behavior

[ ] Entries blocked during active flags

[ ] Cooldown timers enforced



---

Phase E – Validator & Slashing Simulation (If Enabled)

[ ] Invalid attestation triggers slash

[ ] False flag confirmation penalized

[ ] Collusion simulation tested



---

Phase F – Observability & Monitoring

[ ] Indexers operational

[ ] Flag visibility dashboards

[ ] Alerting for abnormal proof patterns



---

Phase G – Rollback & Incident Response

[ ] Clear rollback plan

[ ] Public incident disclosure template

[ ] No silent hotfixes



---

Exit Criteria (Go/No-Go)

Testnet is considered valid only if:

No critical or high severity issues remain

Replay protection holds under stress

Retail shield enforcement is deterministic


Failure to meet any exit criteria delays progression.


---

Summary

Security is not assumed. It is verified.

Apex Titans does not move to mainnet until testnet proves:

Ownership truth cannot be forged

Manipulation cannot bypass enforcement

Retail protection holds under adversarial conditions
