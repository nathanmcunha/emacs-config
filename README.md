# Doom-Like Vanilla Emacs Configuration

A highly customized Emacs configuration designed to replicate the "Doom Emacs" experience using vanilla Emacs. This setup is structured as a literate program using Org Mode, ensuring it is self-documenting and easy to maintain.

## 📖 Overview

- **Author:** Nathan Martins Cunha
- **Philosophy:** Vanilla Emacs foundation with the ergonomic benefits of Doom Emacs (Evil mode, SPC leader keys, modern UI).
- **Configuration Style:** Literate programming (`config.org`).
- **Language Support:** Java, JavaScript/TypeScript, Markdown, Org Mode, and more via Eglot (LSP).

## ✨ Key Features

This configuration provides a curated "best-of-breed" experience:

### Core
- **Vim Emulation:** Full Evil mode setup with `evil-collection`, `evil-surround`, `evil-snipe`, `evil-lion`, `evil-numbers`, and many more extensions.
- **Key Management:** Doom-style leader keys (`SPC` / `M-SPC`) powered by `general.el` and `which-key`.
- **Undo System:** Enhanced undo with `undo-fu`, `undo-fu-session` (persistent history), and `vundo` (visual undo tree).

### Modern UI
- **Themes:** `doom-themes` with `doom-solarized-light` by default.
- **Modeline:** `doom-modeline` with custom configuration.
- **Icons:** `nerd-icons` throughout (mode line, completions, file explorer, etc.).
- **Minimalist Defaults:** No toolbars, scrollbars, or menus for maximum screen real estate.

### Completion System
- **Vertico:** Modern vertical completion UI.
- **Orderless:** Flexible fuzzy matching.
- **Marginalia:** Rich annotations in completions.
- **Consult:** Enhanced search and navigation commands.
- **Corfu:** In-buffer auto-completion with Yasnippet integration.
- **Cape:** Additional completion backends (file, dabbrev, keywords).

### Project Management
- **Projectile:** Project navigation, file finding, and command execution.
- **Perspective:** Workspace management with isolated buffer lists.
- **Treemacs:** Project file tree sidebar with git status integration.
- **Persp-Projectile:** Automatic workspace creation when switching projects.

### Development Tools
- **Eglot:** Native Emacs LSP client (replacing heavy lsp-mode).
- **Eglot-Java:** Java LSP support with JDTLS integration.
- **DAPE:** Modern debugger adapter (replacing dap-mode).
- **Magit:** Comprehensive Git interface with Doom-style bindings.
- **Flymake:** Native linting with project-wide error search.
- **Apheleia:** Code formatting on save.

### Quality of Life
- **Super Save:** Auto-save on focus change, window switch, or buffer kill.
- **Adaptive Wrap:** Smart line wrapping maintaining indentation.
- **Evil Escape:** Quick escape from insert mode with custom sequence.
- **Recentf:** Recent file tracking.
- **Saveplace:** Restore cursor position on file reopen.
- **Eat:** Modern terminal emulator with Evil integration.

## 🛠️ Management Tools

This config includes a set of CLI tools for maintenance:

- **`bin/emacs-cli sync`**: Fast installation of missing packages. Use `-r` to force a network refresh.
- **`bin/emacs-cli update`**: Updates all packages and prunes obsolete ones.
- **`bin/validate-config`**: Checks `config.org` for syntax errors or unclosed source blocks.

## 📂 Structure

This configuration keeps your `~/.config/emacs/` clean by strictly separating configuration from generated data.

```text
~/.config/emacs/
├── init.el             # Entry point (bootstraps the environment)
├── config.org          # Main Literate Configuration (EDIT THIS)
├── early-init.el       # Startup optimizations
├── bin/                # CLI management tools
└── .local/             # All generated/downloaded files (Git ignored)
    ├── packages/       # Installed packages (ELPA), LSPs, Grammars
    ├── state/          # Persistent history, bookmarks, sessions
    ├── cache/          # Disposable cache, backups, autosaves
    ├── docs/           # Documentation archive
    └── etc/            # Misc configuration data
```

A backup of the essential configuration is maintained in `emacs-config.tar.gz`.

## 🚀 Installation

1. **Backup your existing configuration:**
   ```bash
   mv ~/.config/emacs ~/.config/emacs.bak
   ```

2. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/.config/emacs
   ```
   *Alternatively, if restoring from a backup, extract the archive:*
   ```bash
   tar -xzf emacs-config.tar.gz -C ~/.config/emacs
   ```

3. **Install Fonts:**
   Ensure you have a [Nerd Font](https://www.nerdfonts.com/) installed (e.g., JetBrains Mono Nerd Font). After opening Emacs, run `M-x nerd-icons-install-fonts`.

4. **Sync Packages:**
   ```bash
   ./bin/emacs-cli sync
   ```
   *This will automatically populate `.local/packages/`.*

## ⌨️ Keybindings

All keybindings use Doom-style leader keys:
- **`SPC`**: Leader key (Normal/Visual states)
- **`M-SPC`**: Global leader (Insert/Emacs states)

### Top Level
| Key | Action | Description |
| :--- | :--- | :--- |
| `SPC .` | `find-file` | Find file anywhere |
| `SPC ,` | `switch-to-buffer` | Switch buffer |
| `SPC TAB` | `mode-line-other-buffer` | Last buffer |
| `SPC \`` | `evil-switch-to-windows-last-buffer` | Last window buffer |
| `SPC SPC` | `execute-extended-command` | M-x |
| `SPC ;` | `embark-act` | Embark Actions |
| `SPC u` | `vundo` | Undo Tree |

### Buffer (`SPC b`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `b b` | `projectile-switch-to-buffer` | Switch buffer (Project) |
| `b B` | `switch-to-buffer` | Switch buffer (Global) |
| `b i` | `ibuffer` | IBuffer |
| `b k` | `kill-current-buffer` | Kill buffer |
| `b K` | `my/kill-all-buffers` | Kill all buffers |
| `b O` | `my/kill-other-buffers` | Kill other buffers |
| `b n/p` | `next/previous-buffer` | Next/Prev buffer |
| `b s` | `save-buffer` | Save buffer |
| `b S` | `evil-write-all` | Save all |
| `b r` | `revert-buffer` | Revert buffer |
| `b y` | `my/copy-this-file` | Copy file contents |

### Code & LSP (`SPC c`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `c a` | `eglot-code-actions` | Code Actions |
| `c r` | `eglot-rename` | Rename symbol |
| `c f` | `apheleia-format-buffer` | Format buffer |
| `c d` | `xref-find-definitions` | Go to definition |
| `c D` | `xref-find-references` | Find references |
| `c j n` | `eglot-java-create-project` | New Java Project |
| `c j i` | `eglot-java-organize-imports` | Organize Imports |
| `c j r` | `my/eglot-restart` | Restart JDTLS |
| `c C t` | `my/java-coverage-toggle` | Toggle Coverage |

### Debug (`SPC d`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `d t` | `my/java-debug-test-at-point` | Debug Test (Cursor) |
| `d b` | `dape-breakpoint-toggle` | Toggle Breakpoint |
| `d c` | `dape-continue` | Continue |
| `d n` | `dape-next` | Step Over |
| `d i` | `dape-step-in` | Step In |
| `d o` | `dape-step-out` | Step Out |
| `d r` | `dape-restart` | Restart Session |
| `d Q` | `dape-kill` | Quit Debugger |

### Errors (`SPC e`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `e p` | `flymake-show-project-diagnostics` | Project Errors |
| `e b` | `flymake-show-buffer-diagnostics` | Buffer Errors |
| `e l` | `consult-flymake` | Search Buffer Errors |
| `e L` | `my/consult-flymake-project` | Search Project Errors |
| `e n/N` | `flymake-goto-next/prev-error` | Next/Prev Error |

### Files (`SPC f`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `f f` | `projectile-find-file` | Find in Project |
| `f F` | `find-file` | Find Anywhere |
| `f r` | `consult-recent-file` | Recent Files |
| `f s` | `save-buffer` | Save |
| `f S` | `write-file` | Save As... |
| `f y` | `my/copy-file-path` | Copy Path |
| `f Y` | `my/copy-file-path-relative...` | Copy Relative Path |
| `f p` | *(lambda)* | Open Config |

### Git (`SPC g`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `g s` | `magit-status` | Status |
| `g /` | `magit-dispatch` | Dispatch Menu |
| `g f` | `magit-find-file` | Find File in Git |
| `g b` | `magit-blame-addition` | Blame |
| `g t` | `git-timemachine-toggle` | Time Machine |
| `g l c` | `magit-log-current` | Log Current Branch |
| `g l g` | `magit-log-all` | Log All |

### Project (`SPC p`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `p p` | `projectile-switch-project` | Switch Project |
| `p f` | `projectile-find-file` | Find File |
| `p /` | `consult-ripgrep` | Search (Grep) |
| `p b` | `projectile-switch-to-buffer` | Switch Buffer |
| `p c` | `projectile-compile-project` | Compile |
| `p t` | `projectile-test-project` | Test |
| `p !` | `projectile-run-shell-command...` | Run Cmd |

### Search (`SPC s`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `s s` | `consult-line` | Search Buffer |
| `s S` | `consult-line-multi` | Search All Buffers |
| `s g` | `consult-goto-line` | Go to Line |
| `s i` | `consult-imenu` | Jump to Symbol |
| `s f` | `consult-find` | Find File (Live) |
| `s k` | `consult-yank-pop` | Yank Ring |

### Windows (`SPC w`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `w h/j/k/l` | `evil-window-...` | Navigate |
| `w H/J/K/L` | `evil-window-move-...` | Move Window |
| `w s` | `evil-window-split` | Split Horizontal |
| `w v` | `evil-window-vsplit` | Split Vertical |
| `w c` | `evil-window-delete` | Close Window |
| `w =` | `balance-windows` | Balance |

### Workspaces (`SPC W`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `W s` | `persp-switch` | Switch Workspace |
| `W n` | `persp-switch` | New/Switch |
| `W k` | `persp-kill` | Kill Workspace |
| `W r` | `persp-rename` | Rename Workspace |

## 🔧 Customization

To modify the configuration:

1. Edit `config.org` - it's a literate Org file with embedded Emacs Lisp.
2. Run `./bin/emacs-cli sync` if you added new packages.
3. Restart Emacs or reload config with `SPC h r r` to apply changes.

### Adding New Packages

1. Add `(use-package package-name :ensure t ...)` to the appropriate section in `config.org`.
2. Run `./bin/emacs-cli sync` to install.

### Customizing Keybindings

Keybindings are defined using `general.el` and the `my-leader-def` macro:

```emacs-lisp
(my-leader-def
  "c"   '(:ignore t :which-key "code")
  "c f" '(my-function :which-key "description"))
```

## 🎨 Themes

The default theme is `doom-solarized-light`. To change:

1. Edit the Themes section in `config.org`
2. Change `(load-theme 'doom-solarized-light t)` to your preferred theme
3. Reload config

Available themes include all `doom-themes` colorschemes.

## 🐛 Troubleshooting

- **Package not found**: Run `./bin/emacs-cli sync -r` to refresh package list
- **Config errors**: Run `./bin/validate-config` to check syntax
- **Java LSP issues**: Ensure JDTLS is installed via `eglot-java` and run `SPC c j r` to restart
- **Debugging fails**: Make sure to launch test with `SPC d t` first, then attach with DAPE

## 📝 License

This configuration is provided as-is for personal use and customization.
