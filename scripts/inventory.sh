#!/usr/bin/env bash
# Inventory of the KKBox CSVs: bytes, sha256, rows, field counts, last-line check, date ranges.
# Prints no row contents, so no member IDs (msno) reach the output.
set -euo pipefail
cd "$(dirname "$0")/../data/csv"

inv() {  # usage: inv FILE DATE_COLUMN...
  f=$1; shift
  echo "== $f"
  echo "bytes:  $(stat -c %s "$f")"
  echo "sha256: $(sha256sum "$f" | cut -d' ' -f1)"
  echo "ends with newline: $([ -z "$(tail -c1 "$f")" ] && echo yes || echo no)"
  echo "last line fields: $(tail -n 1 "$f" | awk -F, '{print NF}')"
  awk -F, -v cols="$*" '
    BEGIN { n = split(cols, c, " ") }
    NR == 1 { next }
    { rows++; nf[NF]++
      for (i = 1; i <= n; i++) {
        v = $(c[i])
        if (v == "") { empty[i]++; continue }
        if (!(i in min) || v < min[i]) min[i] = v
        if (!(i in max) || v > max[i]) max[i] = v } }
    END {
      print "data rows: " rows
      for (k in nf) print "rows with " k " fields: " nf[k]
      for (i = 1; i <= n; i++)
        print "col " c[i] ": min " min[i] ", max " max[i] ", empty " empty[i]+0 }' "$f"
  echo
}

inv members_v3.csv      6
inv transactions.csv    7 8
inv transactions_v2.csv 7 8
inv user_logs.csv       2
inv user_logs_v2.csv    2
