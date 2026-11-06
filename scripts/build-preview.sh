#!/usr/bin/env bash
# Genera las páginas públicas de GitHub Pages a partir de las propuestas de diseño.
#   docs/index.html     → versión vigente (V4)
#   docs/v3/index.html  → versión anterior, para comparar
#   docs/v5/index.html  → vista previa de la V5 (sin aprobar)
set -euo pipefail
cd "$(dirname "$0")/.."
wrap() {
  local src="$1" out="$2"
  mkdir -p "$(dirname "$out")"
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
    cat "$src"
    echo '</body>'
    echo '</html>'
  } > "$out"
  echo "Generado $out"
}
wrap design/propuesta-visual-v4.html docs/index.html
# Vista previa sin aprobar: no reemplaza la dirección principal
[ -f design/propuesta-visual-v5.html ] && wrap design/propuesta-visual-v5.html docs/v5/index.html
wrap design/propuesta-visual-v3.html docs/v3/index.html
touch docs/.nojekyll
