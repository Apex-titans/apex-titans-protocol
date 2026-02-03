# Apex Titans Protocol – Manipulation Detection Model

## Purpose

This document defines how Apex Titans detects and flags market manipulation in a **verifiable, non-predictive** manner. This model does not provide signals or price predictions. It identifies **manipulation events** based on objective data mismatches.

---

## Design Philosophy

Traditional indicators (RSI, MACD, EMA) fail because they:

* React after manipulation
* Are easily gamed by large capital
* Depend only on price

Apex Titans uses **ownership reality vs price behavior**.

> Manipulation is defined as **price or volatility movement not justified by ownership or settlement change**.

---

## Core Data Inputs

### 1. Ownership Proof Data

* Commitment timestamp
* Commitment usage
* Owner address
* Proof consumption order

### 2. Price & Volatility Data

* Spot price movement
* Volatility expansion
* Wick-to-body ratio
* Time-to-range expansion

### 3. Liquidity Behavior

* Order book depth changes
* Liquidity pull timing
* Spread expansion

### 4. Settlement Signals

* Ownership delta
* Proof activation clustering
* Position close/open imbalance

---

## Manipulation Detection Rules

### Rule 1 – Price Expansion Without Ownership Delta

**Condition:**

* Price moves > X% within Y blocks
* Ownership proofs unchanged or inactive

**Result:**

* Flag: `PRICE_ONLY_MOVE`

Interpretation: Synthetic price movement (spoof / wash / leverage-driven)

---

### Rule 2 – Liquidity Pull After Commitment

**Condition:**

* Large ownership commitment detected
* Liquidity removed within N blocks

**Result:**

* Flag: `COMMIT_LIQUIDITY_TRAP`

Interpretation: Intentional stop-hunt or fake breakout setup

---

### Rule 3 – Volatility Spike Without Settlement

**Condition:**

* Volatility spikes
* No corresponding ownership change

**Result:**

* Flag: `VOLATILITY_WITHOUT_SETTLEMENT`

Interpretation: Derivative-driven manipulation

---

### Rule 4 – Repeated Proof Consumption Clustering

**Condition:**

* Same actors consume proofs
* Repeated short-term cycles

**Result:**

* Flag: `CONTROLLED_DISTRIBUTION`

Interpretation: Position cycling to extract liquidity

---

### Rule 5 – Cross-Market Divergence

**Condition:**

* Price divergence across venues
* Ownership reality unchanged

**Result:**

* Flag: `MARKET_DIVERGENCE`

Interpretation: Localized manipulation

---

## Manipulation Flag Output

Flags are:

* Deterministic
* Timestamped
* Auditable
* Non-opinionated

They represent **market state**, not advice.

---

## Integration With Retail Shield Layer

When flags are active:

* New retail entries blocked
* Leverage reduced or disabled
* Cooldown timers activated

Retail cannot execute into flagged zones.

---

## Anti-Gaming Properties

* No reliance on volume alone
* No prediction
* No subjective thresholds
* Requires ownership + market mismatch

Whales cannot fake ownership reality.

---

## Future Upgrades

### ZK Integration

* Ownership delta proven via zero-knowledge
* Detection without revealing positions

### Validator Verification

* Validators confirm flag correctness
* False flags subject to slashing

---

## Summary

Apex Titans does not predict markets.
It exposes manipulation.

Retail losses are prevented not by advice, but by enforcement.
