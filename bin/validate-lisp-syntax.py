import subprocess
import sys
from pathlib import Path


def _elisp_escape(value: str) -> str:
    return value.replace("\\", "\\\\").replace('"', '\\"')


def check_elisp_parens(filename: str) -> bool:
    file_path = Path(filename)
    if not file_path.is_file():
        print(f"❌ Error: File '{filename}' not found.")
        return False

    print(f"🔍 Analyzing: {filename} ...")
    escaped_path = _elisp_escape(str(file_path))
    elisp = (
        f'(with-temp-buffer '
        f'(insert-file-contents "{escaped_path}") '
        f'(emacs-lisp-mode) '
        f'(check-parens))'
    )
    proc = subprocess.run(
        ["emacs", "-Q", "--batch", "--eval", elisp],
        capture_output=True,
        text=True,
        check=False,
    )

    if proc.returncode == 0:
        print(f"✅ Success: Parentheses are balanced in {filename}.")
        return True

    details = (proc.stderr or proc.stdout).strip()
    print(f"❌ Error: Parentheses check failed for {filename}.")
    if details:
        print(details)
    return False

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python validate-lisp-syntax.py <file1.el> <file2.el> ...")
        sys.exit(1)
    
    overall_success = True
    for file_path in sys.argv[1:]:
        if not check_elisp_parens(file_path):
            overall_success = False
            print("-" * 40)
    
    if not overall_success:
        sys.exit(1)
