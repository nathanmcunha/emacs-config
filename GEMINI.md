# Emacs Configuration

## Directory Overview

This directory contains a highly customized configuration for the Emacs editor, designed to replicate a "Doom Emacs" like experience using vanilla Emacs. The configuration is structured as a literate program using Org Mode (`config.org`), making it well-documented and easy to manage.

## Key Files & Directories

*   `init.el`: The main entry point. Sets up the package manager, performance defaults, and loads `config.org`.
*   `config.org`: The heart of the configuration. Contains all settings, keybindings, and package definitions in a literate format.
*   `bin/`: Helper scripts for managing the configuration.
    *   `emacs-cli`: The primary tool for syncing, updating, and building packages.
    *   `validate-config`: A diagnostic tool to check `config.org` for syntax errors.
*   `elpa/`: Installed packages.
*   `snippets/`: Custom Yasnippet snippets.
* When request a plan , create a org file in plan/ folder.
## CLI Tools

This configuration comes with a powerful CLI to manage your Emacs installation.

### `bin/emacs-cli`
*   `sync`: Fast installation of missing packages. Use `-r` to force a network refresh.
*   `update`: Updates all packages to their latest versions (stops running Emacs server automatically).
*   `doctor`: Checks the health of your environment.

### `bin/validate-config`
Use this script if your configuration isn't loading correctly. It attempts to "tangle" `config.org` and reports any unclosed code blocks or syntax errors.

## Main Features

The configuration is built around a "best-of-breed" set of modern Emacs packages:

### 1. Workspaces & Project Management
*   **Perspective.el**: Full workspace isolation. Each workspace has its own list of buffers and window layout.
*   **Projectile**: Project management integration.
*   **Treemacs**: Sidebar file explorer that automatically scopes to the current workspace/project.
*   **Workflow**:
    *   `SPC p p`: Switch project. This automatically creates or switches to a dedicated workspace for that project.
    *   `SPC TAB`: Quickly switch between active workspaces.
    *   `SPC W`: Advanced workspace management (rename, delete, save state).

### 2. Editing & Navigation
*   **Evil Mode**: Full Vim emulation (Normal, Visual, Insert states).
*   **Evil Collection**: Vim bindings for almost every Emacs mode (Magit, Dired, etc.).
*   **Completion**:
    *   **Vertico/Orderless/Marginalia**: The "Doom" standard for minibuffer completion (fuzzy search).
    *   **Corfu/Cape**: In-buffer code completion (Intellisense).

### 3. Visuals & UI
*   **Theme**: `doom-themes` (Solarized Light configured).
*   **Modeline**: `doom-modeline` (Lean configuration: Line number only, no percentage/column).
*   **Org Modern**: Modern styling for Org mode (bullets, badges, tables).
*   **Diminish**: Hides minor modes to keep the modeline clean.

### 4. Development Environment
*   **LSP**: `lsp-mode` for language intelligence (Java, etc.).
*   **DAP**: `dap-mode` for graphical debugging.
*   **Magit**: The best Git client available.
*   **Apheleia**: Auto-formatting on save.

## Keybinding Cheat Sheet (Leader `SPC`)

| Key | Action | Description |
| :--- | :--- | :--- |
| `SPC p p` | Switch Project | Opens project in a workspace. |
| `SPC TAB` | Switch Workspace | Cycle through active workspaces. |
| `SPC e e` | Toggle Treemacs | Open/close the file explorer sidebar. |
| `SPC g s` | Magit Status | Open the Git status window. |
| `SPC .` | Find File | Open a file in the current project. |
| `SPC b b` | Switch Buffer | Switch to an open buffer in current workspace. |
| `SPC c a` | Code Action | LSP Code Actions (fix imports, etc). |

## Maintenance

To modify the setup, edit `config.org` and restart Emacs.

If you add a new package block to `config.org`, run:
```bash
./bin/emacs-cli sync
```
This ensures the package is installed and ready for your next session.
# Operational Instructions for Agents

## CRITICAL INSTRUCTION: Configuration & Lisp Diagnostics

These rules are mandatory whenever touching the Emacs configuration. Follow this exact order to avoid shipping broken code.

### 1. Syntax Validation (Elisp & Org) 

**For Emacs Lisp files (`init.el`, `early-init.el`, `bin/emacs-cli`):**
- **Validate:** `python scripts/validate_elisp_syntax.py --files FILE.el`
- **Simulate:** `python scripts/validate_elisp_syntax.py --simulate-edit --file FILE.el --old OLD --new NEW`
- **Blocker:** If the tool reports issues, do NOT apply the change. Fix the syntax first.

**For Org Configuration (`config.org`):**
- **Validate:** `./bin/validate-config`
- This script checks for unclosed source blocks and basic syntax errors in the literate config.

### 2. Batch Lint/Compile Workflow

Use these commands to verify that changes don't break the startup or compilation.

**Smoke Test (Load Configuration):**
- `emacs -Q --batch --eval '(setq user-emacs-directory default-directory)' -l init.el --eval '(message "Startup OK")'`
- *Note:* This will attempt to tangle `config.org`. Ensure `config.org` is valid before running.

**Byte-Compile (Stricter Checks):**
- `emacs -Q --batch -L . --eval '(setq byte-compile-error-on-warn t)' -f batch-byte-compile init.el early-init.el`

### 3. Escaping Rules (Common Traps)

- **Quotes in Strings:** Escape inner quotes with backslash (`\"`), not backticks.
  - Correct: `"Org uses \"* User\""`
- **Regex:** Double-escape backslashes inside strings.
  - Correct: `"^\\* User"` (matches literal `\* User`)

## CRITICAL INSTRUCTION: Session Snapshot at Start

At this stage of the project; Agent MUST NOT run any Git commands UNTIL User asks.
Before making any changes in a new working session (first action after opening the repo), create a local rollback snapshot using file copies only.

- **Create Snapshot:**
  ```bash
  mkdir -p snapshots/$(date +%Y%m%d-%H%M%S)
  cp -a init.el early-init.el config.org bin/ scripts/ README.md GEMINI.md snapshots/$(date +%Y%m%d-%H%M%S)/ 2>/dev/null || true
  ```
- **Audit:** Always show the full Stdout/Stderr of the snapshot commands.
- **Rollback:** If requested, restore from the matching `snapshots/<timestamp>/` directory via `cp -a`.

## CRITICAL INSTRUCTION: Codebase Grounding

**Rule:** Never assume the existence or signature of a function.
- **Check Definitions:** Read `config.org` or `init.el` to verify custom functions (e.g., `my/yas-try-expand-first`) before using them.
- **Project Structure:**
  - `init.el`: Bootstrapping.
  - `config.org`: Main logic (tangled to `.el`).
  - `.local/`: All generated data (do not rely on files here for config).

## Commit Discipline

- **Defer Commits:** Request evaluation first.
- **Snapshot First:** Use the snapshot mechanism for iterations.
- **Commit:** Only commit when the user explicitly approves or after a successful "wrap up".
