# Doom-Like Vanilla Emacs Configuration

A highly customized Emacs configuration designed to replicate the "Doom Emacs" experience using vanilla Emacs. This setup is structured as a literate program using Org Mode, ensuring it is self-documenting and easy to maintain.

## 📖 Overview

- **Author:** Nathan Martins Cunha
- **Philosophy:** Vanilla Emacs foundation with the ergonomic benefits of Doom Emacs (Evil mode, SPC leader keys, modern UI).
- **Configuration Style:** Literate programming (`config.org`).
- **Language Support:** Java, Python, JavaScript/TypeScript, Markdown, Org Mode, and more via Eglot (LSP).

## ✨ Key Features

This configuration provides a curated "best-of-breed" experience:

### Core
- **Vim Emulation:** Full Evil mode setup with `evil-collection`, `evil-surround`, `evil-nerd-commenter`, and many more extensions.
- **Key Management:** Doom-style leader keys (`SPC` / `M-SPC`) powered by native Emacs 30+ keymaps and `which-key`.
- **Undo System:** Native Emacs 28+ `undo-redo` with increased limits, and `vundo` (visual undo tree).

### Modern UI
- **Themes:** `doom-themes` with `doom-solarized-light` by default.
- **Modeline:** `doom-modeline` with custom configuration and Flymake integration.
- **Icons:** `nerd-icons` throughout (mode line, completions, file explorer, etc.).
- **Minimalist Defaults:** No toolbars, scrollbars, or menus for maximum screen real estate.
- **Rainbow Identifiers:** Unique colors for each variable/identifier for better code readability.

### Completion System
- **Vertico:** Modern vertical completion UI.
- **Orderless:** Flexible fuzzy matching.
- **Marginalia:** Rich annotations in completions.
- **Consult:** Enhanced search and navigation commands.
- **Corfu:** In-buffer auto-completion with icons and documentation popups.
- **Cape:** Additional completion backends (file, dabbrev, keywords).
- **Tempel:** Simple and flexible snippet system replacing heavy Yasnippet.

### Project Management
- **Native Project.el:** Lightweight project navigation, file finding, and command execution using Emacs' built-in system.
- **Workspaces:** Built-in `tab-bar-mode` for isolated workspace management.
- **Dirvish:** Modern, polished Dired experience replacing traditional sidebar explorers with project-aware navigation.

### AI Assistant
- **Agent Shell:** Integrated AI assistant shell supporting GitHub Copilot, Gemini (Google), and Opencode backends.
- **Gptel:** Simple interface for LLM interaction within any buffer.

### Development Tools
- **Eglot:** Native Emacs LSP client (replacing heavy lsp-mode).
- **Eglot-Java:** Java LSP support with JDTLS integration.
- **Python Dev:** Comprehensive Python environment with `pet` (venv management), `pyright` (LSP), `ruff` (linter), and `pytest` integration.
- **DAPE:** Modern debugger adapter (replacing dap-mode) with Java debug support.
- **Magit:** Comprehensive Git interface with Doom-style bindings.
- **Java Coverage:** Integrated JaCoCo coverage visualization with in-buffer lenses and tooltips.
- **Flymake:** Native linting with project-wide error search and Consult integration.
- **Apheleia:** Code formatting on save (Google Java Format, Black, etc.).
- **Tree-sitter:** Native Tree-sitter integration for superior syntax highlighting and structural navigation.

### Quality of Life
- **Built-in Auto-save:** Native `auto-save-visited-mode` with custom advice on window/focus changes.
- **Visual Wrapping:** Built-in `visual-wrap-prefix-mode` (Emacs 30+) for smart line wrapping maintaining indentation.
- **Recentf:** Recent file tracking with project-scoped search.
- **Saveplace:** Restore cursor position on file reopen.
- **Mise:** Environment manager integration for consistent toolchains.

## 🛠️ Management Tools

This config includes a set of CLI tools for maintenance:

- **`bin/emacs-cli sync`**: Synchronizes packages with `elpaca`. Automatically detects failures and prints detailed error logs for troubleshooting.
- **`bin/emacs-cli update`**: Updates all packages to their latest versions.
- **`bin/emacs-cli doctor`**: Environment health check and validation baseline.
- **`bin/test-validators`**: Runs the full validation suite (Org blocks, parens, tangle, startup smoke test, strict byte-compile).
- **`bin/validate-config [file.org]`**: Validates `config.org` by checking source block balance and tangling.

Common `emacs-cli` options (`sync`/`update`): `-v/--verbose`, `-s/--safe` (sync), `-d/--dry-run` (sync), `-b/--background`, `-t/--timeout N`, `--skip-wait`.

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
    ├── etc/            # Misc configuration data
```

## 🚀 Installation

1. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/.config/emacs
   ```

2. **Install Fonts:**
   Ensure you have a [Nerd Font](https://www.nerdfonts.com/) installed. After opening Emacs, run `M-x nerd-icons-install-fonts`.

3. **Sync Packages:**
   ```bash
   ./bin/emacs-cli sync
   ```

## ⌨️ Keybindings

All keybindings use Doom-style leader keys:
- **`SPC`**: Leader key (Normal/Visual states)
- **`M-SPC`**: Global leader (Insert/Emacs states)

### Top Level
| Key | Action | Description |
| :--- | :--- | :--- |
| `SPC .` | `find-file` | Find file anywhere |
| `SPC ,` | `switch-to-buffer` | Switch buffer |
| `SPC \`` | `evil-switch-to-windows-last-buffer` | Last window buffer |
| `SPC SPC` | `execute-extended-command` | M-x |
| `SPC ;` | `embark-act` | Embark Act |
| `SPC u` | `vundo` | Undo Tree (Visual) |

### AI Assistant (`SPC a`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `a s` | `agent-shell` | Agent Shell Menu |
| `a g` | `agent-shell-google-start-gemini` | Gemini CLI |
| `a o` | `agent-shell-opencode-start-agent` | Opencode Agent |
| `a q` | `gptel-send` | Gptel Send |

### Buffer (`SPC b`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `b b` | `consult-buffer` | Switch buffer |
| `b B` | `switch-to-buffer` | Switch buffer (Global) |
| `b i` | `ibuffer` | IBuffer |
| `b k` | `kill-current-buffer` | Kill buffer |
| `b K` | `my/kill-all-buffers` | Kill all buffers |
| `b O` | `my/kill-other-buffers` | Kill other buffers |
| `b n/p` | `next/previous-buffer` | Next/Prev buffer |
| `b s` | `save-buffer` | Save buffer |
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
| `c j r` | `my/eglot-restart` | Restart LSP |
| `c C t` | `my/java-coverage-toggle` | Toggle Coverage |
| `c C h` | `my/java-coverage-browse-report` | Open HTML Report |

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

### Explorer (`SPC E`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `E .` | `dirvish` | Current Directory |
| `E e` | `my/dirvish-project` | Project Root |
| `E f` | `dirvish-fd` | Find Files (fd) |

### Files (`SPC f`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `f f` | `my/project-find-file` | Find in Project |
| `f r` | `consult-recent-file` | Recent Files |
| `f R` | `my/move-this-file` | Rename/Move File |
| `f D` | `my/delete-this-file` | Delete File |
| `f y` | `my/copy-file-path` | Copy Path |
| `f p` | *(lambda)* | Open Config |

### Project (`SPC p`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `p p` | `project-switch-project` | Switch Project |
| `p f` | `project-find-file` | Find File |
| `p /` | `consult-ripgrep` | Search (ripgrep) |
| `p r` | `my/project-recent-files` | Recent Project Files |
| `p c` | `my/project-compile` | Compile |
| `p t` | `my/project-test` | Test |
| `p x` | `my/project-run` | Run |

### Workspaces (`SPC l`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `l l` | `tab-bar-switch-to-tab` | Switch Workspace |
| `l n` | `tab-new` | New Workspace |
| `l c` | `tab-close` | Close Workspace |
| `l r` | `tab-rename` | Rename Workspace |

## 🔧 Customization

To modify the configuration:

1. Edit `config.org` - it's a literate Org file with embedded Emacs Lisp.
2. Run `./bin/emacs-cli sync` if you added new packages.
3. Restart Emacs or reload config with `SPC h r r` to apply changes.

## 🐛 Troubleshooting

- **Package or build issues**: Run `./bin/emacs-cli doctor`, then `./bin/emacs-cli sync`.
- **Config errors**: Run `./bin/test-validators` for the full suite.
- **Java LSP issues**: Run `SPC c j r` to restart JDTLS.

## 📝 License

This configuration is provided as-is for personal use and customization.
