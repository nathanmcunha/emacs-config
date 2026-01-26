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

## 🚀 Installation

1. **Backup your existing configuration:**
   ```bash
   mv ~/.config/emacs ~/.config/emacs.bak
   ```

2. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/.config/emacs
   ```

3. **Install Fonts:**
   Ensure you have a [Nerd Font](https://www.nerdfonts.com/) installed (e.g., JetBrains Mono Nerd Font). After opening Emacs, run `M-x nerd-icons-install-fonts`.

4. **Sync Packages:**
   ```bash
   ./bin/emacs-cli sync
   ```

## ⌨️ Keybindings

All keybindings use Doom-style leader keys:
- **`SPC`**: Leader key (in normal/visual/insert modes)
- **M-SPC`**: Global prefix leader key

### Files & Buffers

| Key | Action |
| :--- | :--- |
| `SPC .` | Find file anywhere |
| `SPC ,` | Switch buffer |
| `SPC TAB` | Last buffer / Switch workspace |
| `SPC b b` | Switch buffer (project) |
| `SPC b B` | Switch buffer (all) |
| `SPC b i` | Ibuffer |
| `SPC b n` / `SPC b p` | Next/Previous buffer |
| `SPC b s` | Save buffer |
| `SPC b S` | Save all buffers |
| `SPC b r` | Revert buffer |
| `SPC b k` | Kill buffer |
| `SPC b K` | Kill all buffers |
| `SPC b O` | Kill other buffers |
| `SPC b N` | New buffer |
| `SPC f f` | Find file in project |
| `SPC f F` | Find file anywhere |
| `SPC f r` | Recent files |
| `SPC f s` | Save file |
| `SPC f S` | Save as... |
| `SPC f R` | Rename/move file |
| `SPC f D` | Delete file |
| `SPC f y` | Copy file path |
| `SPC f Y` | Copy relative path |
| `SPC f p` | Open config.org |
| `SPC f e` | Open early-init.el |
| `SPC f E` | Browse .emacs.d |

### Windows

| Key | Action |
| :--- | :--- |
| `SPC w h/j/k/l` | Navigate window left/down/up/right |
| `SPC w w` | Next window |
| `SPC w H/J/K/L` | Move window left/down/up/right |
| `SPC w s` | Split horizontal |
| `SPC w v` | Split vertical |
| `SPC w c` | Close window |
| `SPC w o` | Close other windows |
| `SPC w =` | Balance windows |

### Search (Consult)

| Key | Action |
| :--- | :--- |
| `SPC s s` | Search in current buffer |
| `SPC s S` | Search in all buffers |
| `SPC s g` | Go to line |
| `SPC s i` | Jump to symbol (imenu) |
| `SPC s h` | Jump to heading |
| `SPC s f` | Find file (live) |
| `SPC s k` | Yank pop (kill ring) |

### Git (Magit)

| Key | Action |
| :--- | :--- |
| `SPC g s` | Magit status |
| `SPC g S` | Magit status here |
| `SPC g /` | Magit dispatch |
| `SPC g .` | Magit file dispatch |
| `SPC g f` | Find file in Git |
| `SPC g b` | Blame addition |
| `SPC g t` | Git time machine |
| `SPC g i` | Initialize repo |
| `SPC g l c` | Log current branch |
| `SPC g l f` | Log current file |
| `SPC g l g` | Log all branches |
| `SPC g r` | Discard selection |
| `SPC g s` | Stage selection (in visual mode) |

### Project (Projectile)

| Key | Action |
| :--- | :--- |
| `SPC p p` | Switch project (with workspace) |
| `SPC p b` | Switch project buffer |
| `SPC p f` | Find file in project |
| `SPC p r` | Recent files |
| `SPC p d` | Remove project |
| `SPC p a` | Add project |
| `SPC p s` | Save project buffers |
| `SPC p k` | Kill project buffers |
| `SPC p c` | Compile project |
| `SPC p t` | Run tests |
| `SPC p i` | Invalidate cache |
| `SPC p !` | Run command in root |
| `SPC p x` | Run async command in root |
| `SPC p /` | Search in project (ripgrep) |

### Workspace (Perspective)

| Key | Action |
| :--- | :--- |
| `SPC W s` | Switch workspace |
| `SPC W n` | New/switch workspace |
| `SPC W k` | Kill workspace |
| `SPC W r` | Rename workspace |

### Explorer (Treemacs)

| Key | Action |
| :--- | :--- |
| `SPC e e` | Toggle Treemacs |
| `M-0` | Select Treemacs window |

### Code & LSP

| Key | Action |
| :--- | :--- |
| `SPC c a` | Code actions |
| `SPC c r` | Rename |
| `SPC c f` | Format buffer |
| `SPC c d` | Go to definition |
| `SPC c D` | Find references |
| `SPC c j n` | Java: New project |
| `SPC c j i` | Java: Organize imports |
| `SPC c j r` | Java: Restart Eglot |
| `SPC c j t` | Java: Switch to java-ts-mode |
| `SPC c j I` | Java: Install tree-sitter |

### Debug (DAPE)

| Key | Action |
| :--- | :--- |
| `SPC d t` | Debug test at point |
| `SPC d b` | Toggle breakpoint |
| `SPC d c` | Continue |
| `SPC d n` | Next (Step Over) |
| `SPC d i` | Step In |
| `SPC d o` | Step Out |
| `SPC d r` | Restart |
| `SPC d l` | Show layout |
| `SPC d Q` | Quit debugger |

### Errors (Flymake)

| Key | Action |
| :--- | :--- |
| `SPC e p` | Show project errors |
| `SPC e b` | Show buffer errors |
| `SPC e l` | Search buffer errors |
| `SPC e L` | Search project errors |
| `SPC e n` | Next error |
| `SPC e N` | Previous error |

### Undo

| Key | Action |
| :--- | :--- |
| `SPC u` | Visual undo tree (vundo) |

### Notes (Org Roam)

| Key | Action |
| :--- | :--- |
| `SPC n r` | Toggle Roam buffer |
| `SPC n f` | Find node |
| `SPC n i` | Insert node |
| `SPC n d t` | Capture today's daily note |

### Terminal

| Key | Action |
| :--- | :--- |
| `SPC o t h` | Open terminal here |
| `SPC o t p` | Open terminal in project |

### Jump (Evil Easymotion)

| Key | Action |
| :--- | :--- |
| `SPC j w` | Jump to word |
| `SPC j l` | Jump to line |
| `SPC j c` | Jump to char |
| `SPC j s` | Jump to char (timer) |
| `SPC j j` | Jump to line |

### Utility

| Key | Action |
| :--- | :--- |
| `SPC SPC` | M-x (execute extended command) |
| `SPC h r r` | Reload config |
| `SPC ;` | Embark act |
| `SPC a` | Embark actions |

## 📂 Structure

- **`init.el`**: Entry point. Sets up performance and the package manager.
- **`config.org`**: Main configuration. Edit this file to customize your Emacs.
- **`bin/`**: CLI management scripts.
- **`early-init.el`**: UI and performance optimizations for startup.
- **`snippets/`**: Custom Yasnippet snippets.

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
