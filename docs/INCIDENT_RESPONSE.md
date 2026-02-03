Apex Titans Protocol – Incident Response Plan

Purpose

This document defines how Apex Titans Protocol (ATS) detects, communicates, and responds to security incidents or abnormal protocol behavior. The goal is to protect retail users, preserve transparency, and prevent cascading damage.

This plan prioritizes truthful disclosure over reputation management.


---

Guiding Principles

1. User Safety First – protect retail participants from further harm


2. Transparency by Default – no silent fixes or hidden changes


3. Containment Before Recovery – stop spread, then repair


4. No Custody Assumptions – protocol does not hold user funds




---

Incident Classification

Severity Levels

Critical – ownership truth can be forged, replay possible, enforcement bypass

High – validator collusion risk, governance failure, ZK circuit flaw

Medium – incorrect flags, false positives, monitoring outages

Low – UI, indexing, or documentation issues



---

Detection Sources

Incidents may be detected via:

On-chain alerts (replay attempts, invariant breaks)

Validator anomaly reports

Community-submitted evidence

External researchers / auditors


All reports are logged publicly.


---

Immediate Response Actions

For Critical / High Incidents

1. Acknowledge publicly within a defined response window


2. Activate emergency pause (enforcement modules only)


3. Preserve evidence (on-chain state, logs, events)


4. Disable affected pathways (non-custodial)



No funds can be seized or frozen.


---

Investigation Process

Reproduce the issue in isolation

Identify root cause

Assess blast radius

Propose remediation with evidence


Independent reviewers are encouraged.


---

Communication Plan

Initial Disclosure

What happened

What is affected

What is NOT affected

Immediate actions taken


Ongoing Updates

Timeline of findings

Fix progress

Verification steps


Final Report

Root cause analysis

Impact assessment

Preventive measures


All communications are public.


---

Remediation & Fix Deployment

Fixes reviewed by validators

Subject to governance timelocks (unless emergency-approved)

Regression testing required


No hotfixes without disclosure.


---

Recovery & Lessons Learned

After resolution:

Post-mortem published

Checklist updates

Documentation updates

Governance improvements if needed



---

Bug Bounty & Responsible Disclosure

Responsible disclosure encouraged

Clear reporting channels

Recognition or rewards when applicable



---

Summary

Apex Titans assumes incidents will occur.

What matters is how the protocol responds:

Fast acknowledgement

Honest disclosure

Non-custodial containment

Verified fixes


Retail trust is preserved through transparency, not silence.
