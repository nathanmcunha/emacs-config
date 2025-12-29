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
