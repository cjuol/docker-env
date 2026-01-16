# Docker Development Environment with PHP and MariaDB

## Description

This repository provides a fully containerized development environment with Docker, ideal for PHP projects. It includes Apache with PHP 8.3, MariaDB, Composer and PHPUnit pre-configured, allowing you to start developing immediately without worrying about environment configuration.

## Prerequisites

- Docker Engine 20.10 or higher
- Docker Compose v2.0 or higher
-Git
- Access to ports 80 (web) and 3306 (database)

## Facility

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

## Use

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

Once the containers are started, you can access your application at: `http://localhost`

## Project Structure

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

## Configuration

### Database

The MariaDB container is configured with the following credentials (defined in `docker-compose.yml`):

- **Host:** `db`
- **Port:** `3306`
- **Database:** `demo_db`
- **User:** `demo_user`
- **Password:** `demo_password`
- **root user:** `root`
- **root password:** `example`

### Development Directory

Place your code in the `development/` folder. This folder is mounted at `/var/www/html/demo` inside the web container.

### Framework Selection

The environment supports the automatic creation of Symfony or Laravel projects. To configure it, add the `FRAMEWORK` environment variable to the `docker-compose.yml` file:

```yaml
services:
  web:
    environment:
      - FRAMEWORK=laravel  # Opciones: symfony, laravel, none
```

**Available values:**
- `symfony` - Automatically creates a Symfony 6.4 project
- `laravel` - Automatically creates a Laravel project with Filament and Livewire pre-installed
- `none` (default) - Don't create any projects, use your own code in `development/`

**Note:** Project creation only occurs if a `composer.json` file does not exist in the development directory.

### Personalization

You can modify:
- `web/Dockerfile`: To add additional PHP extensions or tools
- `web/entrypoint.sh`: To customize container initialization
- `docker-compose.yml`: To adjust ports, environment variables or add services

## Contribute

Contributions are welcome. Please:

1. Fork the project
2. Create a branch for your feature (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

[Specifies the project license]

## Contact

**Cristobal Jurado Oller** - [@Cjuol](https://github.com/Cjuol) - c.jurado.oller@gmail.com

Repository: [https://github.com/cjuol/docker-env](https://github.com/cjuol/docker-env)