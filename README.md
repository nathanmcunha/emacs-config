# Emacs Configuration (Nix + Literate Org)

A modular, literate Emacs configuration designed to be built and managed via **Nix/Home Manager**. The source of truth is a set of Org files that tangle into Emacs Lisp on build.

## ✅ Modular Org layout

`config.org` is a tiny aggregator that includes the actual modules:

```text
config.org
├── core.org
├── ui.org
├── completion.org
├── tools.org
└── bindings.org
```

This keeps tangling fast and diffs clean while preserving a single entry point for Nix (`config.org`).

## 🧱 Nix + Home Manager usage

This repo is intended to be consumed by a Home Manager module using `emacsWithPackagesFromUsePackage`, pointing at `config.org`.

Typical usage (in your dotfiles):
- `emacsWithPackagesFromUsePackage { config = emacs-config + "/config.org"; }`
- Emacs runs as a daemon via systemd user service
- Tree-sitter grammars and LSP servers are provided by Nix

The result is a **reproducible Emacs build** without runtime package installs.

## 🧵 Tangling / regenerating

Because this config is literate, edits go into the `.org` files. Emacs Lisp is generated during build.

If you want to tangle manually inside Emacs:

1. Open `config.org`
2. Run: `M-x org-babel-tangle`

Nix builds also tangle automatically when configured via `emacsWithPackagesFromUsePackage`.

## 🖥️ Using emacsclient

If you run Emacs as a daemon (recommended), connect via:

```bash
emacsclient -c
```

To stop the daemon cleanly:

```bash
emacsclient --eval '(kill-emacs)'
```

## 🔧 Updating the config

1. Edit any `.org` module (core/ui/completion/tools/bindings)
2. Rebuild with Home Manager
3. Restart Emacs or reload your config

---

This config is intended to stay clean, Nix-first, and modular. If you want a new module split (e.g., `lsp.org`, `lang.org`, `org.org`), open a PR or just add a new `#+include` in `config.org`.
