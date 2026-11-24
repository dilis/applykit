#!/bin/bash
# Usage: check_ats.sh <full-name>.pdf <keywords.txt>
# Extracts the PDF text (as an ATS parser would see it) and reports keyword counts.
set -euo pipefail
pdf="$1"; kw="$2"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
cat > "$tmp/x.swift" <<'SWIFT'
import PDFKit
let d = PDFDocument(url: URL(fileURLWithPath: CommandLine.arguments[1]))!
print(d.string ?? "")
SWIFT
swift "$tmp/x.swift" "$pdf" 2>/dev/null > "$tmp/text.txt"
echo "== extracted text: $(wc -w < "$tmp/text.txt" | tr -d ' ') words, $(grep -c . "$tmp/text.txt") lines; first lines:"
head -5 "$tmp/text.txt"
echo "== suspicious extraction (space before punctuation, e.g. split words like 'T ypeScript')"
(grep -n -E ' [,.;:)]|[A-Z] [a-z]{3,}[A-Z]' "$tmp/text.txt" || true) | head -10
echo "== keyword coverage (case-insensitive)"
missing=0
while IFS= read -r k; do
  [ -z "$k" ] && continue
  n=$( (grep -o -i -F -- "$k" "$tmp/text.txt" || true) | wc -l | tr -d ' ')
  if [ "$n" -eq 0 ]; then echo "MISSING  $k"; missing=$((missing+1)); else echo "$(printf '%3d' "$n")x     $k"; fi
done < "$kw"
echo "== $missing keyword(s) missing"
