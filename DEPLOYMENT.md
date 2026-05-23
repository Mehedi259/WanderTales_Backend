# Deployment Guide

## Production Deployment Steps

### 1. Server Setup
- Ubuntu 22.04 LTS
- Docker & Docker Compose installed
- Nginx configured
- SSL certificates (Let's Encrypt)

### 2. Environment Configuration
```bash
# Backend
cp backend/.env.example backend/.env
# Edit with production values

# AI Service  
cp ai/example.env ai/.env
# Add API keys
```

### 3. Deploy with Docker Compose
```bash
docker-compose -f docker-compose.prod.yml up -d
```

### 4. Database Migration
```bash
docker-compose exec backend python manage.py migrate
docker-compose exec backend python manage.py createsuperuser
```

### 5. Collect Static Files
```bash
docker-compose exec backend python manage.py collectstatic --noinput
```

## Monitoring
- Check logs: `docker-compose logs -f`
- Health check: `curl http://localhost:8001/api/health/`
