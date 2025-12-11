# Emacs Configuration

## Directory Overview

This directory contains a highly customized configuration for the Emacs editor, designed to replicate a "Doom Emacs" like experience using vanilla Emacs. The configuration is structured as a literate program using Org Mode, making it well-documented and easy to manage.

## Key Files

*   `init.el`: The main entry point for the configuration. It sets up the package manager and then loads the literate configuration from `config.org`.
*   `config.org`: The heart of the configuration. This file uses Org Mode to structure the entire setup, with code blocks that are tangled on-the-fly when Emacs starts. It contains detailed explanations for each part of the configuration.
*   `elpa/`: This directory contains all the Emacs packages installed and managed by `package.el`.
*   `eln-cache/`: Contains pre-compiled ("natively-compiled") Elisp files for faster performance.

## Usage

This directory controls the entire behavior of the user's Emacs setup. Any changes to the files within this directory, especially `config.org`, will alter the editor's functionality, appearance, and keybindings.

The configuration is loaded automatically when Emacs starts. To modify the setup, the user should edit the `config.org` file and then restart Emacs to see the changes.

## Main Features & Technologies

The configuration is built around a "best-of-breed" set of modern Emacs packages:

*   **Package Management**: `package.el` (built-in) with `use-package` for declarative configuration.
*   **Editing Style**: Full Vim emulation via `evil-mode` and a comprehensive suite of `evil-*` plugins (like `evil-surround`, `evil-snipe`, etc.).
*   **User Interface**:
    *   **Theme**: `doom-themes`
    *   **Modeline**: `doom-modeline`
    *   **Icons**: `nerd-icons`
    *   **Keybinding Hints**: `which-key`
*   **Completion Framework**:
    *   `vertico`: Modern minibuffer completion UI.
    *   `orderless`: Advanced "fuzzy" filtering.
    *   `marginalia`: Rich annotations in the minibuffer.
    *   `consult`: Powerful search and navigation commands.
    *   `embark`: Contextual actions on completion candidates.
    *   `corfu`: In-buffer completion-at-point UI.
*   **Development Environment**:
    *   **LSP**: `lsp-mode` for language intelligence, with specific configurations for Java (`lsp-java`).
    *   **Debugging**: `dap-mode` for a graphical debugger interface.
    *   **Project Management**: `projectile`.
    *   **Git Integration**: `magit`.
    *   **File Explorer**: `treemacs`.
    *   **Environment Management**: `mise` integration to manage different SDKs (e.g., Java versions).

This setup is sophisticated and provides a powerful, IDE-like experience within Emacs, tailored heavily for a Vim user who appreciates the extensibility of Emacs.
