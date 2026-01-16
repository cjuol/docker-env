# Entorno de Desarrollo Docker con PHP y MariaDB

## Descripción

Este repositorio proporciona un entorno de desarrollo completamente containerizado con Docker, ideal para proyectos PHP. Incluye Apache con PHP 8.3, MariaDB, Composer y PHPUnit preconfigurados, permitiéndote comenzar a desarrollar inmediatamente sin preocuparte por la configuración del entorno.

## Requisitos Previos

- Docker Engine 20.10 o superior
- Docker Compose v2.0 o superior
- Git
- Acceso a puertos 80 (web) y 3306 (base de datos)

## Instalación

```bash
# Clona el repositorio
git clone https://github.com/cjuol/docker-env.git

# Navega al directorio
cd docker-env

# Levanta los contenedores
docker-compose up -d

# Verifica que los contenedores estén corriendo
docker-compose ps
```

## Uso

```bash
# Iniciar los contenedores
docker-compose up -d

# Detener los contenedores
docker-compose down

# Ver logs del contenedor web
docker logs -f docker-env-web-1

# Acceder al contenedor web
docker exec -it docker-env-web-1 bash

# Ejecutar comandos de Composer
docker exec docker-env-web-1 composer install

# Ejecutar tests con PHPUnit
docker exec docker-env-web-1 phpunit
```

Una vez iniciados los contenedores, puedes acceder a tu aplicación en: `http://localhost`

## Estructura del Proyecto

```
.
├── .github/
│   └── workflows/
│       └── translate-readme.yml    # Workflow para traducir README automáticamente
├── development/                     # Carpeta para el código de tu proyecto en desarrollo
├── web/                            # Configuración del contenedor web
│   ├── Dockerfile                  # Imagen Docker con PHP 8.3 + Apache
│   └── entrypoint.sh              # Script de inicialización del contenedor
├── docker-compose.yml             # Orquestación de servicios (web + db)
└── README.md                      # Este archivo
```

## Configuración

### Base de Datos

El contenedor de MariaDB está configurado con las siguientes credenciales (definidas en `docker-compose.yml`):

- **Host:** `db`
- **Puerto:** `3306`
- **Base de datos:** `demo_db`
- **Usuario:** `demo_user`
- **Contraseña:** `demo_password`
- **Usuario root:** `root`
- **Contraseña root:** `example`

### Directorio de Desarrollo

Coloca tu código en la carpeta `development/`. Esta carpeta está montada en `/var/www/html/demo` dentro del contenedor web.

### Selección de Framework

El entorno soporta la creación automática de proyectos Symfony o Laravel. Para configurarlo, añade la variable de entorno `FRAMEWORK` en el archivo `docker-compose.yml`:

```yaml
services:
  web:
    environment:
      - FRAMEWORK=laravel  # Opciones: symfony, laravel, none
```

**Valores disponibles:**
- `symfony` - Crea automáticamente un proyecto Symfony 6.4
- `laravel` - Crea automáticamente un proyecto Laravel con Filament y Livewire preinstalados
- `none` (por defecto) - No crea ningún proyecto, usa tu propio código en `development/`

**Nota:** La creación del proyecto solo ocurre si no existe un archivo `composer.json` en el directorio de desarrollo.

### Personalización

Puedes modificar:
- `web/Dockerfile`: Para agregar extensiones PHP adicionales o herramientas
- `web/entrypoint.sh`: Para personalizar la inicialización del contenedor
- `docker-compose.yml`: Para ajustar puertos, variables de entorno o agregar servicios

## Contribuir

Las contribuciones son bienvenidas. Por favor:

1. Haz fork del proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## Licencia

[Especifica la licencia del proyecto]

## Contacto

**Cristobal Jurado Oller** - [@Cjuol](https://github.com/Cjuol) - c.jurado.oller@gmail.com

Repositorio: [https://github.com/cjuol/docker-env](https://github.com/cjuol/docker-env)