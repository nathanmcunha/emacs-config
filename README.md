# Doom-Like Vanilla Emacs Configuration

A highly customized Emacs configuration designed to replicate the "Doom Emacs" experience using vanilla Emacs. This setup is structured as a literate program using Org Mode, ensuring it is self-documenting and easy to maintain.

## 📖 Overview

- **Author:** Nathan Martins Cunha
- **Philosophy:** Vanilla Emacs foundation with the ergonomic benefits of Doom Emacs (Evil mode, SPC leader keys, modern UI).
- **Configuration Style:** Literate programming (`config.org`).

## ✨ Key Features

This configuration provides a curated "best-of-breed" experience:

- **Vim Emulation:** Full Evil mode setup with `evil-collection`, `evil-surround`, `evil-snipe`, and many more extensions.
- **Workspaces:** Isolated buffer and sidebar views using `perspective.el` and `persp-projectile`.
- **Key Management:** Doom-style leader keys (`SPC`) powered by `general.el` and `which-key`.
- **Modern UI:**
  - `doom-themes`, `doom-modeline`, and `org-modern` for a sleek aesthetic.
  - `nerd-icons` for rich iconography.
  - Minimalist defaults (no toolbars, scrollbars, or menus).
- **Completion System:** A focused stack using `vertico`, `orderless`, `marginalia`, `consult`, and `corfu`.
- **Development:**
  - `lsp-mode` & `dap-mode` for IDE-like intelligence and debugging.
  - `magit` for Git integration.
  - `projectile` for project management.
  - `treemacs` for a workspace-aware file explorer sidebar.

## 🛠️ Management Tools

This config includes a set of CLI tools for maintenance:

- **`bin/emacs-cli sync`**: Fast installation of missing packages. Use `-r` to force a network refresh.
- **`bin/emacs-cli update`**: Updates all packages and prunes obsolete ones.
- **`bin/validate-config`**: Checks `config.org` for syntax errors or unclosed source blocks.

## 🚀 Installation

1.  **Backup your existing configuration:**
    ```bash
    mv ~/.config/emacs ~/.config/emacs.bak
    ```

2.  **Clone this repository:**
    ```bash
    git clone <your-repo-url> ~/.config/emacs
    ```

3.  **Install Fonts:**
    Ensure you have a [Nerd Font](https://www.nerdfonts.com/) installed (e.g., JetBrains Mono Nerd Font). After opening Emacs, run `M-x nerd-icons-install-fonts`.

4.  **Sync Packages:**
    ```bash
    ./bin/emacs-cli sync
    ```

## ⌨️ Common Keybindings

| Key | Action |
| :--- | :--- |
| `SPC p p` | Switch Project (and create Workspace) |
| `SPC TAB` | Switch Workspace (Perspective) |
| `SPC e e` | Toggle Treemacs Explorer |
| `SPC g s` | Magit Status |
| `SPC f f` | Find File |
| `SPC b b` | Switch Buffer (Current Workspace) |
| `SPC w h/j/k/l` | Window Navigation |

## 📂 Structure

- **`init.el`**: Entry point. Sets up performance and the package manager.
- **`config.org`**: Main configuration. Edit this file to customize your Emacs.
- **`bin/`**: CLI management scripts.
- **`early-init.el`**: UI and performance optimizations for startup.

## 🔧 Customization

To modify the configuration:
1. Edit `config.org`.
2. Run `./bin/emacs-cli sync` if you added new packages.
3. Restart Emacs to apply changes.