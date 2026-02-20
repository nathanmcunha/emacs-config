# Operational Instructions for Agents

## CRITICAL INSTRUCTION: Configuration & Lisp Diagnostics

These rules are mandatory whenever touching the Emacs configuration. Follow this exact order to avoid shipping broken code.

### 1. Syntax Validation (Elisp & Org) 

**For Emacs Lisp files (`init.el`, `early-init.el`, `bin/emacs-cli`):**
- **Validate:** `python scripts/validate_elisp_syntax.py --files FILE.el`
- **Simulate:** `python scripts/validate_elisp_syntax.py --simulate-edit --file FILE.el --old OLD --new NEW`
- **Blocker:** If the tool reports issues, do NOT apply the change. Fix the syntax first.

**For Org Configuration (`config.org`):**
- **Validate:** `./bin/validate-config`
- This script checks for unclosed source blocks and basic syntax errors in the literate config.

### 2. Batch Lint/Compile Workflow

Use these commands to verify that changes don't break the startup or compilation.

**Smoke Test (Load Configuration):**
- `emacs -Q --batch --eval '(setq user-emacs-directory default-directory)' -l init.el --eval '(message "Startup OK")'`
- *Note:* This will attempt to tangle `config.org`. Ensure `config.org` is valid before running.

**Byte-Compile (Stricter Checks):**
- `emacs -Q --batch -L . --eval '(setq byte-compile-error-on-warn t)' -f batch-byte-compile init.el early-init.el`

### 3. Escaping Rules (Common Traps)

- **Quotes in Strings:** Escape inner quotes with backslash (`\"`), not backticks.
  - Correct: `"Org uses \"* User\""`
- **Regex:** Double-escape backslashes inside strings.
  - Correct: `"^\\* User"` (matches literal `\* User`)

## CRITICAL INSTRUCTION: Session Snapshot at Start

At this stage of the project; Agent MUST NOT run any Git commands UNTIL User asks.
Before making any changes in a new working session (first action after opening the repo), create a local rollback snapshot using file copies only.

- **Create Snapshot:**
  ```bash
  mkdir -p snapshots/$(date +%Y%m%d-%H%M%S)
  cp -a init.el early-init.el config.org bin/ scripts/ README.md GEMINI.md snapshots/$(date +%Y%m%d-%H%M%S)/ 2>/dev/null || true
  ```
- **Audit:** Always show the full Stdout/Stderr of the snapshot commands.
- **Rollback:** If requested, restore from the matching `snapshots/<timestamp>/` directory via `cp -a`.

## CRITICAL INSTRUCTION: Codebase Grounding

**Rule:** Never assume the existence or signature of a function.
- **Check Definitions:** Read `config.org` or `init.el` to verify custom functions (e.g., `my/yas-try-expand-first`) before using them.
- **Project Structure:**
  - `init.el`: Bootstrapping.
  - `config.org`: Main logic (tangled to `.el`).
  - `.local/`: All generated data (do not rely on files here for config).

## Commit Discipline

- **Defer Commits:** Request evaluation first.
- **Snapshot First:** Use the snapshot mechanism for iterations.
- **Commit:** Only commit when the user explicitly approves or after a successful "wrap up".

## Project Performance Benchmark

A benchmark script is available to compare Projectile vs project.el performance.

### Running Benchmarks

```bash
# Run on a specific project
./scripts/benchmark-project.sh ~/projects/my-project

# Run on multiple projects
./scripts/benchmark-project.sh ~/workspace ~/projects

# Run on current directory
./scripts/benchmark-project.sh .
```

### What It Measures

- `projectile-find-file` (cached/uncached)
- `project-find-file` (native/fd)
- `projectile-switch-to-buffer`
- `project-switch-to-buffer`

### Using Results

Use benchmark results to:
- Decide which file finding approach to use
- Identify performance bottlenecks
- Validate optimization changes
- Make informed keybinding decisions