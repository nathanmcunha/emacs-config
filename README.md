# Vanilla Emacs Configuration

A highly customized Emacs configuration designed to replicate the "Doom Emacs" experience using vanilla Emacs. This setup is structured as a literate program using Org Mode, ensuring it is self-documenting and easy to maintain.

## 📖 Overview

- **Author:** Nathan Martins Cunha
- **Philosophy:** Vanilla Emacs foundation with the ergonomic benefits of Doom Emacs (Evil mode, SPC leader keys, modern UI).
- **Configuration Style:** Literate programming (`config.org`).
- **Language Support:** Java, Python, JavaScript/TypeScript, Markdown, Org Mode, and more via Eglot (LSP).

## ✨ Key Features

This configuration provides a curated "best-of-breed" experience:

### Language Support
- **Java:** Complete Java development stack with Eglot-Java, JDTLS, DAPE debugging, JaCoCo coverage, and Google Java Format
- **Python:** basedpyright (LSP), Ruff (linting/formatting), pytest integration
- **JavaScript/TypeScript:** Full LSP support via Eglot
- **SQL:** Interactive SQL with sqls LSP, sql-indent, connection management, and Org-Babel integration
- **Docker:** Docker/Kubernetes TUI with Podman support and Eglot integration
- **YAML:** Kubernetes schema support and LSP completion
- **Org Mode:** Literate programming with Org-roam, Modern styling, Babel support (Emacs Lisp, SQL, Mermaid)
- **Markdown:** GFM mode with syntax highlighting

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
- **Agent Shell:** Integrated AI assistant shell with rich configuration:
  - GitHub Copilot integration
  - Gemini (Google) with model selection (gemini-3-pro-preview, gemini-3-flash-preview, gemini-2.5-pro, etc.)
  - Opencode backend support
  - YOLO mode toggle for Gemini
  - Model persistence across sessions
  - Welcome messages, context usage indicators, file completion
  - Evil mode integration with state-specific behavior
- **Gptel:** Simple interface for LLM interaction within any buffer.

### Development Tools
- **Eglot:** Native Emacs LSP client (replacing heavy lsp-mode).
  - Java support with JDTLS integration
  - Python support with basedpyright (Pyright fork)
  - Docker and YAML LSP support
  - SQL support via sqls
- **Eglot-Java:** Enhanced Java LSP with extended client capabilities and debugger support.
- **Python Dev:** Comprehensive Python environment with `basedpyright` (LSP), `ruff` (linter/formatter), and pytest integration.
- **DAPE:** Modern debugger adapter (replacing dap-mode) with Java debug support and test-at-point functionality.
- **Magit:** Comprehensive Git interface with Doom-style bindings and refined diffs.
- **Java Coverage:** Integrated JaCoCo coverage visualization with percentage lenses above methods and orange wave highlights on missed lines with tooltips.
- **Flymake:** Native linting with project-wide error search and Consult integration.
- **Apheleia:** Code formatting on save (Google Java Format, Ruff, etc.).
- **Tree-sitter:** Native Tree-sitter integration for superior syntax highlighting.
- **Java Compile:** Integrated JaCoCo coverage visualization with in-buffer lenses and tooltips.

### Quality of Life
- **Built-in Auto-save:** Native `auto-save-visited-mode` with custom advice on window/focus changes.
- **Visual Wrapping:** Built-in `visual-wrap-prefix-mode` (Emacs 30+) for smart line wrapping maintaining indentation.
- **Electric Pair:** Automatic bracket pairing in programming modes.
- **Recentf:** Recent file tracking with project-scoped search.
- **Saveplace:** Restore cursor position on file reopen.
- **Mise:** Environment manager integration for consistent toolchains.
- **Spell Checking:** Jinx (modern spell checker) with English/Portuguese toggle and completion via Cape.
- **Terminal:** Eat terminal emulator with proper Evil mode integration and mouse support.

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
| `b n/p` | `next/previous-buffer` | Next/Prev buffer |
| `b s` | `save-buffer` | Save buffer |
| `b S` | `evil-write-all` | Save all buffers |
| `b r` | `revert-buffer` | Revert buffer |
| `b k` | `kill-current-buffer` | Kill buffer |
| `b K` | `my/kill-all-buffers` | Kill all buffers |
| `b O` | `my/kill-other-buffers` | Kill other buffers |
| `b N` | `evil-buffer` | New buffer |
| `b y` | `my/copy-this-file` | Copy file contents |
| `b R` | `rename-buffer` | Rename buffer |
| `b Y` | `bury-buffer` | Bury buffer |
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
| `c j t` | `java-ts-mode` | Switch to java-ts-mode |
| `c j I` | `my/install-java-tree-sitter` | Install Java Grammar |
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
| `d l` | `dape-info-setup` | Show Layout |
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
| `f f` | `find-file` | Find File |
| `f F` | `find-file` | Find File Anywhere |
| `f n` | `my/create-file` | New File |
| `f c` | `my/copy-this-file` | Copy File |
| `f r` | `consult-recent-file` | Recent Files |
| `f s` | `dirvish-side` | Sidebar |
| `f S` | `write-file` | Save As... |
| `f R` | `my/move-this-file` | Rename/Move File |
| `f d` | `my/delete-this-file` | Delete File |
| `f D` | `my/delete-this-file` | Delete File |
| `f y` | `my/copy-file-path` | Copy Path |
| `f Y` | `my/copy-file-path-relative-to-project` | Copy Relative Path |
| `f p` | *(lambda)* | Open Config |
| `f e` | *(lambda)* | Open Early Init |
| `f E` | *(lambda)* | Browse Emacs.d |

### Project (`SPC p`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `p p` | `project-switch-project` | Switch Project |
| `p b` | `project-switch-to-buffer` | Switch Buffer |
| `p f` | `project-find-file` | Find File |
| `p r` | `my/project-recent-files` | Recent Project Files |
| `p c` | `my/project-compile` | Compile |
| `p t` | `my/project-test` | Test |
| `p x` | `my/project-run` | Run |
| `p k` | `project-kill-buffers` | Kill Buffers |
| `p d` | `project-dired` | Dired |
| `p v` | `project-vc-dir` | VC Dir |
| `p s` | `project-search` | Search (Native) |
| `p /` | `consult-ripgrep` | Search (ripgrep) |
| `p !` | `project-shell-command` | Shell Command |
| `p &` | `project-async-shell-command` | Async Shell Command |
| `p R` | `project-query-replace-regexp` | Query Replace |

### Workspaces (`SPC l`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `l l` | `tab-bar-switch-to-tab` | Switch Workspace |
| `l n` | `tab-new` | New Workspace |
| `l c` | `tab-close` | Close Workspace |
| `l r` | `tab-rename` | Rename Workspace |

### Errors/Flymake (`SPC e`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `e p` | `flymake-show-project-diagnostics` | Panel (Project) |
| `e b` | `flymake-show-buffer-diagnostics` | Panel (Buffer) |
| `e l` | `consult-flymake` | Search Buffer |
| `e L` | `my/consult-flymake-project` | Search Project |
| `e n` | `flymake-goto-next-error` | Next |
| `e N` | `flymake-goto-prev-error` | Prev |

### Spell & Language (`SPC S`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `S s` | `jinx-correct` | Correct Word |
| `S t` | `my/spell-toggle-lang` | Toggle Lang (EN/PT) |
| `S l` | `jinx-languages` | Select Languages |

### Jump (`SPC j`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `j j` | `avy-goto-char-2` | Jump 2 chars |
| `j l` | `avy-goto-line` | Jump line |
| `j w` | `avy-goto-word-1` | Jump word |
| `j c` | `avy-goto-char` | Jump char |

### Notes (`SPC n`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `n r` | `org-roam-buffer-toggle` | Roam Toggle |
| `n f` | `org-roam-node-find` | Find Node |
| `n i` | `org-roam-node-insert` | Insert Node |
| `n d t` | `org-roam-dailies-capture-today` | Capture Today |

### Open (`SPC o`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `o p` | `popper-toggle` | Toggle Popup |
| `o t h` | `my/open-terminal-here` | Terminal Here |
| `o t p` | `my/open-terminal-in-project` | Terminal Project |
| `o d` | `docker` | Docker TUI |
| `o C` | `docker-compose` | Docker Compose |
| `o k` | `kubernetes` | Kubernetes TUI |

### Git (`SPC g`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `g s` | `magit-status` | Magit Status |
| `g S` | `magit-status-here` | Magit Status Here |
| `g /` | `magit-dispatch` | Magit Dispatch |
| `g .` | `magit-file-dispatch` | Magit File Dispatch |
| `g f` | `magit-find-file` | Find File |
| `g b` | `magit-blame-addition` | Blame |
| `g t` | `git-timemachine-toggle` | Time Machine |
| `g i` | `magit-init` | Initialize Repo |
| `g M` | `consult-global-mark` | Jump to Global Mark |
| `g l c` | `magit-log-current` | Log Current Branch |
| `g l f` | `magit-log-buffer-file` | Log Current File |
| `g l g` | `magit-log-all` | Log All Branches |
| `g m` | `magit-file-dispatch` | Git Selection Menu |
| `g r` | `magit-discard` | Git Discard Selection |

### Search (`SPC s`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `s s` | `consult-line` | Search Buffer |
| `s S` | `consult-line-multi` | Search All Buffers |
| `s g` | `consult-goto-line` | Goto Line |
| `s i` | `consult-imenu` | Jump to Symbol |
| `s h` | `consult-outline` | Jump to Heading |
| `s f` | `consult-find` | Find File (Live) |
| `s k` | `consult-yank-pop` | Yank Pop |

### Undo (`SPC u`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `u` | `vundo` | Undo Tree (Visual) |

### Insert/Snippets (`SPC i`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `i s` | `tempel-insert` | Insert Snippet |
| `i S` | `tempel-complete` | Complete Snippet |

### Window (`SPC w`)
| Key | Action | Description |
| :--- | :--- | :--- |
| `w h` | `evil-window-left` | Left |
| `w j` | `evil-window-down` | Down |
| `w k` | `evil-window-up` | Up |
| `w l` | `evil-window-right` | Right |
| `w w` | `evil-window-next` | Next Window |
| `w H` | `evil-window-move-far-left` | Move Left |
| `w J` | `evil-window-move-very-bottom` | Move Down |
| `w K` | `evil-window-move-very-top` | Move Up |
| `w L` | `evil-window-move-far-right` | Move Right |
| `w s` | `evil-window-split` | Split Horizontal |
| `w v` | `evil-window-vsplit` | Split Vertical |
| `w c` | `evil-window-delete` | Close Window |
| `w o` | `delete-other-windows` | Close Others |
| `w =` | `balance-windows` | Balance |

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
