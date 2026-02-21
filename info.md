# Wunix

## Stable Public Release — v1.0.0

Wunix is a developer terminal command pack designed to improve terminal joy.

It provides useful utilities together with entertainment commands.

---

## Philosophy

- Developer productivity focused
- Lightweight command ecosystem
- Open source contribution friendly 

Note: Wunix is not a terminal replacement and does not attempt to modify core Windows shell behavior.

---

## Installation

1. Download the repository
2. Add the Wunix root directory to your system PATH

After installation, commands can be used directly from terminal.
(Make sure to restart any open terminal to use Wunix)

---

## Repository Structure
Wunix/ (in PATH)
│
├── *.cmd
├── *.exe
│
├── Helpers/ → Internal pipeline helpers (not in PATH)
├── Assets/ → Configuration and data files (not in PATH)
├── Source/ → Source code for executable utilities (not in PATH)
├── Packages/ → Used by gett (not in PATH)
├── Styles/ → Contains *.moo and *.wstyle (not in PATH)

---

## Available Commands

### Utility Commands

- about wunix
- admin
- alias
- backupall
- clipboard
- create
- echoo
- gett
- rm
- trash
- wx

### Fun! Commands

- cowsay
- fortune
- matrix
- nyancat
- rick
- sl
- lolcat
- french

### System Helper Commands

- neofetch
- wunix
- wunix help / list
- wx (opens Wunix Terminal)

---

## Testing Commands

You can verify command health using:
wunix test <command>

Example:
wunix test clipboard
wunix test gett

---

## Contribution Rules

- New commands are welcome.
- Commands should be self-contained scripts when possible.
- Use source folder for modifying executable implementations.
- Prefer batch scripts unless functionality requires compiled binaries.

Internal helper scripts should remain inside the `Helpers/` directory.

---

## Package Installer

Wunix includes a package installer pipeline. (kind of)

Use:
gett <package>

Packages are downloaded and staged using repository index files.

Package Installer Library can be found in `Assets/gett_library.txt`

---

## License

Open source project. Contributors may submit improvements via GitHub pull requests.

---

## Project Status

Wunix is released as a **Stable Public Release**.

Future updates will follow semantic versioning.

- VRDOG28 aka. Dogwhilenew
- Wunix Version v1.0.0

---
