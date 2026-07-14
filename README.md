# DevOps Automation: Bash Scripts Pack 🚀

This repository contains a collection of Bash scripts designed to automate routine system administration, resource monitoring, and log management tasks on Linux servers. The project was built as part of an intensive DevOps engineering training program.

## 🛠 Tech Stack
* **OS:** Linux (Ubuntu / WSL)
* **Scripting:** Bash (Advanced)
* **Version Control:** Git, GitHub

## 📋 Script Descriptions

| Script Name | Features / Functionality | Bash Concepts Used |
| :--- | :--- | :--- |
| `smart_backup.sh` | Automates directory backups with file existence checks. | `if/else` statements, environment variables, working with `tar` archives. |
| `gen_logs.sh` | A utility tool to generate synthetic test logs for further analysis. | `for` loops, random number generation, stream redirection (`>`). |
| `check_hosts.sh` | Pings and monitors the availability of remote servers from a list. | Exit code analysis (`$?`), loops, hiding output using `/dev/null`. |
| `rotate_logs.sh` | Automates the cleanup, archiving, and rotation of old log files. | Checking file size (`-s` flag), date manipulation. |
| `check_disk.sh` | "Disk Guardian" — monitors disk space utilization and triggers alerts. | Complex pipelines (pipes with `df`, `awk`, `sed`), numerical comparisons (`-gt`). |

## 🚀 How to Run the Project Locally

### 1. Clone the Repository
```bash
git clone git@github.com:scabaniukas-devops/devops_training.git
cd devops_training/scripts
