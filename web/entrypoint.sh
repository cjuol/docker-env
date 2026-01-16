#!/bin/bash
set -e

PROJECT_DIR="/var/www/html/demo"

# Crear el directorio del proyecto Symfony si no existe
#if [ ! -f "$PROJECT_DIR/composer.json" ]; then
#  echo "⚙️  Creando proyecto Symfony en $PROJECT_DIR..."
#  composer create-project symfony/skeleton:"6.4.*" "$PROJECT_DIR" --no-interaction --prefer-dist
#else
#  echo "✅ Proyecto Symfony ya presente, no se vuelve a crear."
#fi

chown -R www-data:www-data "$PROJECT_DIR"

exec apache2-foreground
