# oss-audit-24BAI10259
# The Open Source Audit — Git
### Open Source Software (OSS) Capstone Project
**Course:** Open Source Software | VITyarthi
**Student Name:** Parardha Dhar
**Roll Number:** 24BCG10003
**Chosen Software:** Git (Licensed under GPL v2)

---

## >> About This Project

This repository is the submission for the **Open Source Audit** capstone project. The project involves a structured audit of **Git** — one of the most widely used open-source tools in the world — covering its origin story, license, Linux footprint, FOSS ecosystem, and a comparison with proprietary alternatives.

The repository contains **five shell scripts** that demonstrate practical Linux and bash scripting skills, each tied to a concept from the course.

---

## >> Repository Structure

```
oss-audit-[rollnumber]/
│
├── script1_system_identity.sh       # System Identity Report
├── script2_package_inspector.sh     # FOSS Package Inspector
├── script3_disk_permission_auditor.sh  # Disk and Permission Auditor
├── script4_log_analyzer.sh          # Log File Analyzer
├── script5_manifesto_generator.sh   # Open Source Manifesto Generator
│
└── README.md                        
```

---

## >> Script Descriptions

### Script 1 — System Identity Report
**File:** `script1_system_identity.sh`

Displays a formatted welcome screen with key system information including the Linux distribution name, kernel version, currently logged-in user, home directory, system uptime, and current date/time. Also prints a message about the GPL v2 license that covers both Linux and Git.

**Concepts used:** Variables, `echo`, command substitution `$()`, output formatting

---

### Script 2 — FOSS Package Inspector
**File:** `script2_package_inspector.sh`

Checks whether Git is installed on the system using `dpkg`. If installed, it displays version, maintainer, and homepage details. Uses a `case` statement to print a short philosophy note about Git and other well-known open-source packages.

**Concepts used:** `if-then-else`, `case` statement, `dpkg -l`, `apt-cache show`, `grep`, pipe `|`

---

### Script 3 — Disk and Permission Auditor
**File:** `script3_disk_permission_auditor.sh`

Loops through a predefined list of important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) and reports the permissions, owner, group, and disk usage of each. Also checks Git-specific paths like `~/.gitconfig` and `/usr/bin/git`.

**Concepts used:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`, conditional directory checks

---

### Script 4 — Log File Analyzer
**File:** `script4_log_analyzer.sh`

Reads a log file line by line and counts how many lines contain a specified keyword (default: `error`). Includes retry logic if the file is not found, validates for empty files, and prints the last 5 matching lines as a summary.

**Concepts used:** `while read` loop, `if-then`, counter variables, command-line arguments (`$1`, `$2`), `grep`, `tail`, retry loop

---

### Script 5 — Open Source Manifesto Generator
**File:** `script5_manifesto_generator.sh`

Interactively asks the user three questions about their open-source values, then composes a personalised philosophy statement and saves it to a `.txt` file named after the current user. The manifesto is also printed to the terminal.

**Concepts used:** `read` for user input, string concatenation, writing to file with `>` and `>>`, `date` command, `cat`

---

## >> Dependencies

All scripts are written in **bash** and designed for **Ubuntu / Debian Linux**.

The following tools must be available on your system (all pre-installed on Ubuntu):

| Tool | Purpose | Check if installed |
|------|---------|-------------------|
| `bash` | Run the scripts | `bash --version` |
| `git` | Target software for Scripts 1–3 | `git --version` |
| `dpkg` | Package inspection in Script 2 | `dpkg --version` |
| `apt-cache` | Package details in Script 2 | `apt-cache --version` |
| `lsb_release` | Distro name in Script 1 | `lsb_release -a` |
| `du`, `df` | Disk usage in Script 3 | built-in |
| `grep`, `awk`, `cut` | Text processing in Scripts 2–4 | built-in |

To install Git if it is not already present:
```bash
sudo apt update
sudo apt install git
```

---

## >> How to Run the Scripts

### Step 1 — Clone this repository
```bash
git clone https://github.com/aaryanmaurya10/oss-audit-24BAI10259.git
cd oss-audit-24BAI10259
```

### Step 2 — Make all scripts executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_permission_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run each script

**Script 1 — System Identity Report**
```bash
./script1_system_identity.sh
```
No arguments needed. Displays system information and license details.

---

**Script 2 — FOSS Package Inspector**
```bash
./script2_package_inspector.sh
```
No arguments needed. Inspects the `git` package by default.

---

**Script 3 — Disk and Permission Auditor**
```bash
./script3_disk_permission_auditor.sh
```
No arguments needed. Audits `/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, and Git-specific paths.

---

**Script 4 — Log File Analyzer**
```bash
./script4_log_analyzer.sh /var/log/dpkg.log git
```
- **Argument 1:** Path to a log file (e.g. `/var/log/dpkg.log`, `/var/log/syslog`)
- **Argument 2:** Keyword to search for (optional, defaults to `error`)

More examples:
```bash
./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/dpkg.log install
```

---

**Script 5 — Open Source Manifesto Generator**
```bash
./script5_manifesto_generator.sh
```
Interactive script. You will be prompted to answer 3 questions. Your manifesto will be saved as `manifesto_[yourusername].txt` in the current directory.

---

## >> Notes

- All scripts have been tested on **Ubuntu 22.04 LTS**
- Scripts must be run on a Linux system — they will not work on Windows CMD or PowerShell
- Windows users can use **WSL (Windows Subsystem for Linux)** or a virtual machine

---

## 📚 References

- Git Official Website: https://git-scm.com
- Git Source Code (GitHub): https://github.com/git/git
- GPL v2 License Text: https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
- GNU Bash Manual: https://www.gnu.org/software/bash/manual
- The Linux Command Line (free book): https://linuxcommand.org

---
