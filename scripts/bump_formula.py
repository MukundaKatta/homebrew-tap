"""Rewrite the first `url` and `sha256` directives in a Homebrew Formula.

Usage:
    python3 scripts/bump_formula.py Formula/<name>.rb <new_url> <new_sha256>
"""

from __future__ import annotations

import re
import sys
from pathlib import Path


def main() -> int:
    if len(sys.argv) != 4:
        print(__doc__, file=sys.stderr)
        return 2
    path, new_url, new_sha = sys.argv[1], sys.argv[2], sys.argv[3]
    src = Path(path).read_text()
    src = re.sub(r'^(\s*)url\s+"[^"]+"',
                 lambda m: f'{m.group(1)}url "{new_url}"',
                 src, count=1, flags=re.MULTILINE)
    src = re.sub(r'^(\s*)sha256\s+"[^"]+"',
                 lambda m: f'{m.group(1)}sha256 "{new_sha}"',
                 src, count=1, flags=re.MULTILINE)
    Path(path).write_text(src)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
