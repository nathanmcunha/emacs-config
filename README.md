# Doom-Like Vanilla Emacs Configuration

A highly customized Emacs configuration designed to replicate the "Doom Emacs" experience using vanilla Emacs. This setup is structured as a literate program using Org Mode, ensuring it is self-documenting and easy to maintain.

## 📖 Overview

- **Author:** Nathan Martins Cunha
- **Philosophy:** Vanilla Emacs foundation with the ergonomic benefits of Doom Emacs (Evil mode, SPC leader keys, modern UI).
- **Configuration Style:** Literate programming (`config.org`).

## ✨ Key Features

This configuration provides a curated "best-of-breed" experience:

- **Vim Emulation:** Full Evil mode setup with `evil-collection`, `evil-surround`, `evil-snipe`, and more.
- **Key Management:** Doom-style leader keys (`SPC`) powered by `general.el` and `which-key`.
- **Modern UI:**
  - `doom-themes` & `doom-modeline` for a sleek aesthetic.
  - `nerd-icons` for rich iconography.
  - Minimalist defaults (no toolbars, scrollbars, or menus).
- **Completion System:** A focused stack using `vertico`, `orderless`, `marginalia`, `consult`, and `corfu`.
- **Development:**
  - `lsp-mode` for IDE-like language support (Java, etc.).
  - `magit` for Git integration.
  - `projectile` for project management.
  - `treemacs` for a file explorer sidebar.

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
    Ensure you have a [Nerd Font](https://www.nerdfonts.com/) installed (e.g., JetBrains Mono Nerd Font) for icons to render correctly.

4.  **Start Emacs:**
    On the first run, Emacs will automatically download and install all required packages via `package.el`. This may take a few minutes.

## ⌨️ Keybindings

This config uses `general.el` to mimic Doom Emacs bindings.

- **Leader Key:** `SPC` (in Normal/Visual mode) or `C-SPC` (in Insert mode).
- **M-x:** `SPC SPC`
- **Buffer Operations:**
  - Switch Buffer: `SPC b b`
  - Kill Buffer: `SPC b k`
- **File Explorer:**
  - Toggle Treemacs: `SPC o p` (Assuming standard Doom bindings, check `config.org` for customization)

## 📂 Structure

- **`init.el`**: The entry point. Bootstraps package management and loads the configuration.
- **`config.org`**: The main configuration file. Written in Org mode, containing source blocks that are tangled into Elisp. Edit this file to make changes.
- **`early-init.el`**: Optimization settings loaded before the GUI initializes.

## 🔧 Customization

To modify the configuration:
1. Open `config.org`.
2. Edit the source blocks or documentation.
3. Restart Emacs (or evaluate the blocks) to apply changes.
