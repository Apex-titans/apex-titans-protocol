Apex Titans Protocol – Audit Scope

Purpose

This document defines the exact scope, priorities, and expectations for third‑party security audits of Apex Titans Protocol (ATS). It ensures auditors focus on real risk surfaces rather than generic checklist items.

Apex Titans is not a fund‑holding protocol. The audit scope reflects that reality.


---

Audit Objectives

Audits must answer three core questions:

1. Can ownership truth be forged?


2. Can replay or double‑use of proofs occur?


3. Can validators or governance subvert enforcement?



Anything outside these questions is secondary.


---

In‑Scope Components

1. OwnershipProofRegistry

Auditors should verify:

Commitment uniqueness enforcement

Correct ownership binding (caller → commitment)

Event correctness and completeness

No state overwrite or collision vectors


Primary risks:

Commitment collision

Unauthorized commitment registration



---

2. ProofVerifier

Auditors should verify:

Anti‑replay enforcement

Single‑use proof guarantees

Correct revert behavior on invalid calls

No bypass paths via alternate functions


Primary risks:

Replay attacks

Authorization bypass



---

3. Manipulation Enforcement Hooks (If Enabled)

Auditors should verify:

Deterministic rule execution

No discretionary or admin overrides

Correct state transitions during flag activation


Primary risks:

False enforcement

Enforcement bypass



---

4. Validator & Slashing Logic

Auditors should verify:

Slashing conditions match documentation

No false‑positive slashing vectors

No escape routes for malicious validators


Primary risks:

Validator collusion

Governance capture



---

5. Governance Controls

Auditors should verify:

Timelocks are enforced

Upgrade paths are transparent

Emergency actions are non‑custodial


Primary risks:

Silent upgrades

Centralized control



---

Out‑of‑Scope Components

The following are intentionally out of scope:

User wallet security

Price prediction accuracy

Market profitability

Off‑chain data feeds



---

Assumptions

Auditors may assume:

Base chains provide finality

Cryptographic primitives are sound

No malicious compiler or toolchain



---

Recommended Audit Techniques

Manual code review (required)

Adversarial scenario modeling

Property‑based testing

Replay and race‑condition testing


Automated scanners alone are insufficient.


---

Reporting Expectations

Audit reports should include:

Severity classification

Exploitability analysis

Clear remediation guidance

Confirmation of fixes



---

Disclosure Policy

All audit results will be published

No private vulnerability suppression

Fixes deployed before mainnet consideration



---

Summary

Apex Titans does not need audits to prove fund safety.

It needs audits to prove truth cannot be forged and enforcement cannot be bypassed.

This scope is intentionally narrow, deep, and adversarial.
