# Squirrelsong Light/Dark Theme Strategy

## Overview
Migrating from single dark theme to dual light/dark variants based on [Squirrelsong](https://sapegin.me/squirrelsong/) by Artem Sapegin.

**Philosophy**: Low-contrast, neurodiverse-friendly themes with soft colors for all-day coding without sensory overload.

---

## Current State

### Files Created/Modified
- ✅ `themes/squirrelsong-dark-theme.el` (existing, 309 lines, byte-compiled)
- ✅ `themes/squirrelsong-light-theme.el` (new, 309 lines, byte-compiled)
- ✅ `theme.org` updated with `my/load-squirrelsong` switching function
- ✅ `theme.el` tangled from org

### Palette Sources (from sapegin/squirrelsong GitHub)
- **Light palette**: `light/palette.json` (grayscale + accent colors for light backgrounds)
- **Dark palette**: `dark/palette.json` (warm grays + accent colors for dark backgrounds)
- **Token mapping**: `light/code.json` and `dark/code.json` (identical structure)
- **UI tokens**: `light/ui.json` and `dark/ui.json` (selection, match, borders, etc.)

---

## Palette Mapping Strategy

### Light Theme (bg: `#fdfdfe` gray180)
```
Syntax tokens use CONTRAST variants for readability:
- keyword:  magentaContrast  (#806f9b)
- string:   greenContrast    (#657d38)
- function: blueContrast     (#4b7b97)
- type:     tealContrast     (#3e816e)
- constant: orangeContrast   (#c88539)
- comment:  gray110          (#9c96a2)

UI elements use base palette:
- bg:        gray180 (#fdfdfe)
- bg-alt:    gray170 (#f7f6f9)
- bg-alt2:   gray160 (#e8e5eb)
- fg:        gray060 (#4c4b4e)
- fg-dim:    gray100 (#8c8792)
- selection: brightYellow     (#f5da70)
- match:     brightPink       (#e87da4)
```

### Dark Theme (bg: `#292019` gray180)
```
Syntax tokens use base palette (tuned for dark bg):
- keyword:  magenta  (#7f61b3)
- string:   green    (#558240)
- function: blue     (#5993c2)
- type:     teal     (#4f9593)
- constant: orange   (#b18433)
- comment:  gray120  (#695444)

UI elements use warm gray palette:
- bg:        gray180 (#292019)
- bg-alt:    gray170 (#352a21)
- bg-alt2:   gray160 (#453327)
- fg:        gray060 (#bfac99)
- fg-dim:    gray100 (#846d5c)
- selection: brightYellow (#6a5444)
- match:     brightPink   (#ca5a83)
```

---

## Implementation Completed

### 1. Theme Files
- **Dark theme**: Original, manually mapped from dark palette
- **Light theme**: New, mapped from light palette using CONTRAST variants for syntax

### 2. Switching Infrastructure (theme.org)
```elisp
(defun my/load-squirrelsong (&optional variant)
  "Load Squirrelsong VARIANT (:light or :dark, default :dark)."
  (let ((v (or variant :dark)))
    (disable-theme 'squirrelsong-dark)
    (disable-theme 'squirrelsong-light)
    (load-theme (if (eq v :light) 'squirrelsong-light 'squirrelsong-dark) t)
    (my/squirrelsong-apply-rainbow v)))

(defun my/squirrelsong-apply-rainbow (variant)
  "Tune rainbow-identifiers for VARIANT (:light or :dark)."
  (if (eq variant :light)
      (setq rainbow-identifiers-cie-l-saturation 40
            rainbow-identifiers-cie-l-lightness 50)
    (setq rainbow-identifiers-cie-l-saturation 45
          rainbow-identifiers-cie-l-lightness 70)))
```

**Usage**: `(my/load-squirrelsong :light)` or `(my/load-squirrelsong :dark)`

### 3. Rainbow Identifiers Tuning
- **Light**: saturation 40, lightness 50 (lower lightness for visibility on light bg)
- **Dark**: saturation 45, lightness 70 (original values)

---

## Remaining Work

### Priority 1: Visual Testing
- [ ] Load light theme in graphical Emacs session
- [ ] Verify syntax highlighting across languages (JS, Python, Rust, Org)
- [ ] Check org-mode headings (height 1.3/1.2/1.1 scaling)
- [ ] Verify diff/magit colors (green/red backgrounds)
- [ ] Check terminal/ANSI colors in compilation buffers

### Priority 2: Light Theme Refinements
- [ ] Test `region` face (brightYellow `#f5da70`)
- [ ] Verify `isearch`/`lazy-highlight` contrast
- [ ] Check doom-modeline bar color
- [ ] Verify tree-sitter highlights match font-lock

### Priority 3: Optional Enhancements
- [ ] Add `solaire-mode` faces to light theme (already present, verify contrast)
- [ ] Test `corfu`/`vertico` completion faces
- [ ] Verify `flymake` underline wave colors
- [ ] Check `ediff` diff backgrounds

### Priority 4: Auto-switching (Optional)
```elisp
;; Example: time-based switching
(defun my/auto-theme-switch ()
  (let ((hour (string-to-number (format-time-string "%H"))))
    (if (and (>= hour 6) (< hour 18))
        (my/load-squirrelsong :light)
      (my/load-squirrelsong :dark))))

;; Run on startup
(add-hook 'emacs-startup-hook #'my/auto-theme-switch)
```

---

## Testing Checklist

### Syntax Highlighting
- [ ] Keywords (if/else/return) — magenta
- [ ] Strings — green
- [ ] Functions — blue, bold
- [ ] Variables — blue, italic
- [ ] Types — teal, bold
- [ ] Constants/numbers — orange
- [ ] Comments — gray, italic
- [ ] Operators — teal

### UI Elements
- [ ] Mode line — bg-alt2 background
- [ ] Line numbers — gray, current line bold
- [ ] Region selection — yellow background
- [ ] Search match — pink background
- [ ] Diff added — green background
- [ ] Diff removed — red background

### Org-mode
- [ ] Level 1–6 headings — magenta/green/teal cycling, height scaling
- [ ] TODO/DONE — red/green, bold
- [ ] Code blocks — bg-alt background
- [ ] Tables — default foreground

### Terminal/ANSI
- [ ] Compilation buffer colors
- [ ] Shell/term faces

---

## Palette Reference (Squirrelsong Official)

### Light Semantic Colors
| Token | Palette Name | Hex | Usage |
|-------|--------------|-----|-------|
| magentaContrast | keyword | `#806f9b` | if, else, return, import |
| greenContrast | string | `#657d38` | "hello", 'world' |
| blueContrast | function/variable | `#4b7b97` | fn(), var |
| tealContrast | type | `#3e816e` | String, i32, bool |
| orangeContrast | constant | `#c88539` | 42, true, null |
| gray110 | comment | `#9c96a2` | // comment |

### Dark Semantic Colors
| Token | Palette Name | Hex | Usage |
|-------|--------------|-----|-------|
| magenta | keyword | `#7f61b3` | if, else, return |
| green | string | `#558240` | "hello" |
| blue | function/variable | `#5993c2` | fn(), var |
| teal | type | `#4f9593` | String, i32 |
| orange | constant | `#b18433` | 42, true |
| gray120 | comment | `#695444` | // comment |

---

## Key Design Decisions

1. **Light theme uses CONTRAST variants**: Base palette colors are too light for readability on white backgrounds, so syntax tokens use the `*Contrast` variants (e.g., `blueContrast` instead of `blue`).

2. **Dark theme uses base palette**: Original colors are tuned for dark backgrounds and provide sufficient contrast.

3. **Rainbow identifiers tuned per-variant**: Light mode uses lower lightness (50 vs 70) to maintain visibility on light backgrounds.

4. **Identical face coverage**: Both themes define the same set of faces (font-lock, org-mode, magit, diff, etc.) for consistent switching.

5. **Terminal/ANSI colors differ**: Light theme uses `*Contrast` variants for terminal colors to ensure visibility.

---

## Troubleshooting

### Issue: "Unable to find theme file"
**Cause**: `themes/` directory not in `custom-theme-load-path`.
**Fix**: Ensure `(add-to-list 'custom-theme-load-path "~/.config/emacs/themes")` is in `early-init.el` or `init.el`.

### Issue: Rainbow identifiers too bright/dark
**Fix**: Adjust `rainbow-identifiers-cie-l-lightness` in `my/squirrelsong-apply-rainbow`:
- Dark mode: try 65–75 (higher = lighter)

### Issue: Tree-sitter not matching font-lock
**Cause**: Tree-sitter uses different face names (`tree-sitter-hl-face:*`).
**Fix**: Both themes define tree-sitter faces. If missing, check `treesit-font-lock-level`.

---

## References
- [Squirrelsong GitHub](https://github.com/sapegin/squirrelsong)
- [Squirrelsong Light palette](https://github.com/sapegin/squirrelsong/blob/master/light/palette.json)
- [Squirrelsong Dark palette](https://github.com/sapegin/squirrelsong/blob/master/dark/palette.json)
- [Squirrelsong code token mapping](https://github.com/sapegin/squirrelsong/blob/master/light/code.json)
- [Squirrelsong UI tokens](https://github.com/sapegin/squirrelsong/blob/master/light/ui.json)
- [Artem Sapegin's blog post](https://sapegin.me/squirrelsong/)

---

**Status**: ✅ Implementation complete and byte-compiled clean (0 warnings). Ready for visual testing.
