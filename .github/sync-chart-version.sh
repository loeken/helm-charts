#!/usr/bin/env bash
# Called by Renovate postUpgradeTasks (see renovate.json).
# For every values.yaml changed in the current update, sets Chart.yaml
# version/appVersion to the image tag, so the sync lands inside Renovate's
# own commit and automerge stays intact.
set -eu

changed="$(git diff --name-only | grep 'values.yaml$' || true)"
[ -n "$changed" ] || exit 0

for values_file in $changed; do
  chart_file="$(dirname "$values_file")/Chart.yaml"
  [ -f "$chart_file" ] || continue
  tag="$(grep -E '^[[:space:]]*tag:' "$values_file" | head -n 1 | sed -E 's/^[[:space:]]*tag:[[:space:]]*"?([^"]+)"?.*/\1/' | sed -E 's/[[:space:]]+$//' || true)"
  if [ -n "$tag" ]; then
    sed -i.bak -E "s/^appVersion: .*/appVersion: $tag/" "$chart_file"
    sed -i.bak -E "s/^version: .*/version: $tag/" "$chart_file"
    rm -f "$chart_file.bak"
  fi
done
