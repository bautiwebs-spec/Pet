#!/usr/bin/env bash
# Genera docs/index.html (página pública vía GitHub Pages) a partir de la propuesta de diseño.
set -euo pipefail
cd "$(dirname "$0")/.."
SRC=design/propuesta-visual-v3.html
OUT=docs/index.html
{
  echo '<!doctype html>'
  echo '<html lang="es-AR">'
  echo '<head>'
  echo '<meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">'
  echo '<meta name="robots" content="noindex">'
  echo '<style>:root{color-scheme:light}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>'
  echo '</head>'
  echo '<body>'
  cat "$SRC"
  echo '</body>'
  echo '</html>'
} > "$OUT"
touch docs/.nojekyll
echo "Generado $OUT"
