#!/bin/bash

# Directorio de origen
SOURCE="$HOME/Descargas"

# Configuración para que los patrones que no coinciden se expandan a nada
shopt -s nullglob

# Definir destinos usando variables de entorno para mayor seguridad
IMG_DIR="$HOME/Imágenes"
DOC_DIR="$HOME/Documentos"
VID_DIR="$HOME/Vídeos"
MUS_DIR="$HOME/Música"

# Crear directorios de destino si no existen
mkdir -p "$IMG_DIR" "$DOC_DIR" "$VID_DIR" "$MUS_DIR"

# Variable para rastrear si se movieron archivos
files_moved=0

# Función para mover archivos y contar
move_files() {
    local target_dir="$1"
    shift
    local files=("$@")
    
    if [ ${#files[@]} -gt 0 ]; then
        mv "${files[@]}" "$target_dir/"
        ((files_moved += ${#files[@]}))
    fi
}

# Ejecutar las categorías
move_files "$IMG_DIR" "$SOURCE"/*.{jpg,jpeg,png,gif,webp}
move_files "$DOC_DIR" "$SOURCE"/*.{doc,docx,txt,odt,pdf,xlsx,pptx}
move_files "$VID_DIR" "$SOURCE"/*.{mp4,mkv,avi,mov}
move_files "$MUS_DIR" "$SOURCE"/*.{mp3,wav,flac,ogg}

# Mensaje final
if [ "$files_moved" -eq 0 ]; then
    echo "No hay archivos que mover en $SOURCE."
else
    echo "¡Organización completada! Se movieron $files_moved archivos a sus respectivas carpetas en $HOME."
fi
