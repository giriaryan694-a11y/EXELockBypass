# EXELockBypass

**Execution behavior research using PowerShell on Windows**
*Made by Aryan Giri*

---

## 📌 Overview

EXELockBypass is a **PowerShell-based proof-of-concept** that explores how Windows execution behavior can be influenced using the `__COMPAT_LAYER=RunAsInvoker` technique.

Rather than acting as a universal bypass, this project demonstrates how **certain execution restrictions can be affected in misconfigured or weakly enforced environments**, allowing applications to run under the current user context without elevation.

This project is intended strictly for:

* Educational learning
* Red team simulations
* Authorized security testing in controlled environments

---

## 🛠 Features

* Demonstrates execution context manipulation using `RunAsInvoker`
* Highlights weaknesses in **improperly enforced execution restrictions**
* Simple text-based interface
* Input validation and basic error handling
* Lightweight and portable (single script)
* **Does not require administrator privileges**

---

## 🧠 How It Works (High-Level)

The script leverages the Windows environment variable:

```
__COMPAT_LAYER=RunAsInvoker
```

This can cause certain applications to:

* Run with the **same privilege level as the current user**
* Avoid triggering elevation prompts in specific scenarios

If security controls rely on assumptions about execution context rather than strict enforcement, this behavior may lead to unintended execution paths.

---

## ⚠️ Limitations

* Does **NOT** bypass properly configured AppLocker policies
* Ineffective against strong Software Restriction Policies (SRP) or WDAC
* May be detected or blocked by modern EDR solutions
* Behavior depends heavily on system configuration

This is a **situational technique**, not a guaranteed bypass.

---

## 🚀 Usage

1. **Download** the script:

   ```powershell
   EXELockBypass.ps1
   ```

2. **Run the script in PowerShell**:

   ```powershell
   .\EXELockBypass.ps1
   ```

3. When prompted, **enter the full path** of the EXE you want to test.

---

## 📝 Example Output

```text
EXELockBypass
-------------
Execution behavior research tool
Made by Aryan Giri

Enter the full path of the EXE (e.g., C:\path\to\setup.exe): C:\locked\app.exe
[*] Attempting execution with modified compatibility layer...
[+] Process launched under current user context (result depends on system policy)
```

---

## 🛡️ Defensive Insight

This project highlights why organizations should:

* Enforce strict application control policies (AppLocker / WDAC)
* Avoid relying solely on user-level restrictions
* Monitor process creation and environment variable usage
* Deploy EDR solutions to detect anomalous execution behavior

For deeper defensive strategies, see:
👉 **[Mitigation & Defensive Guidance](mitigation.md)**

---

## 🔐 Ethics & Disclaimer

⚠ **Important Notice**

* Use this tool **responsibly and legally**
* Only test on systems you own or have **explicit permission** to assess
* Do **not** attempt to bypass security controls without authorization

This project exists to help understand system behavior — not to undermine trust.

---

## 📜 License

This project is open-source and released under the **MIT License**.

---

## ✍️ Author

**Aryan Giri**
Cybersecurity Researcher

> "Understanding how systems behave under constraints is key to securing them."
