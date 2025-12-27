# Mitigation & Defensive Guidance

> This document provides **defensive controls, detection ideas, and hardening guidance** related to the Windows compatibility-layer technique (e.g., `RunAsInvoker`) demonstrated by this project.
>
> **Scope:** Educational and authorized security testing only. No offensive instructions are included.

---

## Executive Summary

Some Windows applications rely on **compatibility layers** to adjust how they run. When misused, these layers can allow an executable to start **without elevation prompts**, weakening execution controls. Effective defense focuses on **application control**, **least privilege**, and **visibility**.

---

## Preventive Controls (Block or Reduce Risk)

### 1) Application Control (Strongest)

* **Windows Defender Application Control (WDAC):** Prefer WDAC with a deny-by-default allowlist. Start in **Audit** mode, then move to **Enforced** once validated.
* **AppLocker:** If WDAC is not available, use AppLocker rules (Publisher/Hash/Path). Test thoroughly in Audit mode to avoid gaps.

### 2) Least Privilege & Environment Hardening

* Avoid granting **local administrator** rights to standard users.
* Enforce **code-signing** for internal tools where possible.
* Restrict execution from **user-writable locations** (Downloads, Temp, user profile paths) using application control policies.

### 3) Control Compatibility Settings

* Monitor and restrict changes to compatibility flags stored under:

  * `HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers`
  * `HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers`
* Use endpoint management and Group Policy to **limit who can write** to these keys.
* Review Group Policy settings related to **Program Compatibility Assistant (PCA)** and test any changes with pilot users.

---

## Visibility & Detection

### Logging

* Enable **Process Creation auditing with command line** so launches include full command-line context.
* Deploy **Sysmon** (or equivalent EDR telemetry) to capture high-fidelity process creation events.
* Collect **AppLocker / WDAC** logs centrally (SIEM).

### What to Monitor

* New or modified registry values under **AppCompatFlags\Layers**, especially entries referencing unexpected paths.
* Installers or setup binaries running **without typical elevation behavior**.
* Executables launched from **non-standard locations** while application control policies are active.

---

## Hunting Ideas (Conceptual)

* Identify process launches where installer-type binaries execute without expected elevation prompts.
* Alert on registry writes that introduce new compatibility entries pointing to user-writable directories.
* Correlate AppLocker/WDAC audit events with subsequent successful executions.

*(Tune thresholds carefully to reduce false positives.)*

---

## Incident Response (If Abuse Is Suspected)

1. Capture the **process tree**, command line, parent process, and execution time.
2. Export relevant **event logs** (process creation, AppLocker/WDAC, EDR).
3. Review and remove **unauthorized compatibility entries**.
4. Assess the host for **persistence or lateral activity**.
5. Update policies to prevent recurrence.

---

## Limitations & Notes

* Compatibility features exist for legitimate legacy applications; changes can impact users.
* Always test policy changes in **Audit** mode before enforcement.
* Defense effectiveness increases when **prevention + detection** are deployed together.

---

## Responsible Use

This guidance is provided to help defenders **understand, detect, and mitigate** risks. Apply controls only on systems you own or are authorized to manage.

---

## Maintainer

**Aryan Giri**
Cybersecurity Researcher

> "Defense is not the absence of attack—it is preparation, visibility, and restraint."
