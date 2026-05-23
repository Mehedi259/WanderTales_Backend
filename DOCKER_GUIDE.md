# Docker Guide

## Development Setup

### Start All Services
```bash
docker-compose -f docker-compose.dev.yml up -d
```

### View Logs
```bash
# All services
docker-compose -f docker-compose.dev.yml logs -f

# Specific service
docker-compose -f docker-compose.dev.yml logs -f backend
```

### Stop Services
```bash
docker-compose -f docker-compose.dev.yml down
```

### Rebuild Services
```bash
docker-compose -f docker-compose.dev.yml up -d --build
```

## Production Setup

### Deploy
```bash
docker-compose -f docker-compose.prod.yml up -d
```

### Update Services
```bash
docker-compose -f docker-compose.prod.yml pull
docker-compose -f docker-compose.prod.yml up -d --force-recreate
```

## Useful Commands

### Execute Commands in Container
```bash
# Django shell
docker-compose exec backend python manage.py shell

# Create superuser
docker-compose exec backend python manage.py createsuperuser

# Run migrations
docker-compose exec backend python manage.py migrate
```

### Database Backup
```bash
# Backup
docker-compose exec db pg_dump -U postgres wondertales > backup.sql

# Restore
docker-compose exec -T db psql -U postgres wondertales < backup.sql
```

### Clean Up
```bash
# Remove stopped containers
docker-compose down

# Remove volumes (WARNING: deletes data)
docker-compose down -v

# Clean system
docker system prune -af
```

## Docker Best Practices

### Multi-stage Builds
```dockerfile
# Build stage
FROM python:3.11 AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

# Runtime stage
FROM python:3.11-slim
COPY --from=builder /root/.local /root/.local
```

### .dockerignore
```
__pycache__
*.pyc
.git
.env
node_modules
```

### Health Checks
```dockerfile
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8001/health/ || exit 1
```

## Troubleshooting

### Container Won't Start
```bash
# Check logs
docker-compose logs service_name

# Inspect container
docker inspect container_name
```

### Out of Disk Space
```bash
# Check disk usage
docker system df

# Clean up
docker system prune -af --volumes
```

### Network Issues
```bash
# List networks
docker network ls

# Inspect network
docker network inspect wondertales_default
```
