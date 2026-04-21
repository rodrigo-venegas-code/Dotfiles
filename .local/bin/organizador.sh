#!/bin/bash

# Directorio a organizar
TARGET="$HOME/Descargas"

# Crear carpetas si no existen
mkdir -p "$TARGET/Imagenes" "$TARGET/Documentos" "$TARGET/PDFs"

# Mover archivos
mv "$TARGET"/*.{jpg,jpeg,png,gif} "$TARGET/Imagenes/" 2>/dev/null
mv "$TARGET"/*.{doc,docx,txt,odt} "$TARGET/Documentos/" 2>/dev/null
mv "$TARGET"/*.pdf "$TARGET/PDFs/" 2>/dev/null

echo "¡Organización completada en $TARGET!"
