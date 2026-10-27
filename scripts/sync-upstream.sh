#!/usr/bin/env bash
# 上流 gist（k16shikano）の最新版を取り込み、README に記した2点の差分を当て直す。
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

fetch() { # <gist-id> <dest>
  curl -fsSL "https://gist.githubusercontent.com/k16shikano/$1/raw/SKILL.md" -o "$2"
}

fetch fd287c3133457c4fd8f5601d34aa817d "$tmp/japanese-tech-writing.md"
fetch eb2929f13ed19c97188393d297be8432 "$tmp/cognitive-rhythm-writing.md"

cp "$tmp/japanese-tech-writing.md" "$root/skills/japanese-tech-writing/SKILL.md"

dest="$root/skills/cognitive-rhythm-writing/SKILL.md"
license='license: Unlicense（https://gist.github.com/k16shikano/67625f2a7d96e3bbdfae8d571a936063）'
sed \
  -e 's|^作業前に `\.\./japanese-tech-writing/SKILL\.md` を読む。$|作業前に `japanese-tech-writing` スキル（`../japanese-tech-writing/SKILL.md`）を読む。|' \
  "$tmp/cognitive-rhythm-writing.md" |
  awk -v lic="$license" '
    /^---$/ { n++; if (n == 2 && !seen) print lic }
    /^license:/ { seen = 1 }
    { print }
  ' > "$dest"

grep -q 'japanese-tech-writing` スキル' "$dest" || { echo "依存行の差分が当たっていない" >&2; exit 1; }
grep -q '^license:' "$dest" || { echo "license 行が入っていない" >&2; exit 1; }
echo "synced. git diff で上流の変更を確認してください。"
