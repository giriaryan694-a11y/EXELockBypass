# EXELockBypass

**Bypass EXE installation locks in Windows using PowerShell.**
*Made by Aryan Giri*

---

## 📌 Overview

EXELockBypass is a **PowerShell script** designed to bypass EXE installation restrictions in Windows by leveraging the `__COMPAT_LAYER=RunAsInvoker` technique.

This project is intended strictly for **educational learning, red team simulations, and authorized security testing** in controlled environments.

---

## 🛠 Features

* Bypasses common EXE installation locks (e.g., AppLocker, Software Restriction Policies)
* Simple text-based interface
* Input validation and basic error handling
* Lightweight and portable (single script)
* **Does not require administrator privileges**

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

3. When prompted, **enter the full path** of the EXE you want to run.

---

## 📝 Example Output

```text
EXELockBypass
-------------
Bypass EXE installation locks in Windows
Made by Aryan Giri

Enter the full path of the EXE to bypass (e.g., C:\path\to\setup.exe): C:\locked\app.exe
[*] Attempting to bypass EXE lock for: C:\locked\app.exe
[+] Success! The EXE should now run without restrictions.
```

---

## 🔐 Ethics & Disclaimer

⚠ **Important Notice**

* Use this tool **responsibly and legally**
* Only test on systems you own or have **explicit permission** to assess
* Do **not** use this tool to bypass organizational security policies without authorization

The author is **not responsible** for any misuse or damage caused by this tool.

---

## 🛡️ Mitigation & Defense

This project also includes a dedicated defensive research document:

* 👉 **[Mitigation & Defensive Guidance](mitigation.md)** — explains how to detect, prevent, and harden systems against the compatibility-layer technique demonstrated in this tool.

The mitigation content is written from a **blue-team and SOC perspective** and is safe for enterprise and educational environments.

---

## 📜 License

This project is open-source and released under the **MIT License**.

---

## ✍️ Author

**Aryan Giri**
Cybersecurity Researcher

> "True power lies in understanding systems, not breaking trust."
