# Troubleshooting Guide

## Common Issues

### Database Connection Error

**Problem**: Cannot connect to PostgreSQL

**Solution**:
```bash
# Check if PostgreSQL is running
docker-compose ps

# Restart database
docker-compose restart db

# Check logs
docker-compose logs db
```

### Port Already in Use

**Problem**: Port 8001, 8000, or 5173 already in use

**Solution**:
```bash
# Find process using port
lsof -i :8001

# Kill process
kill -9 <PID>

# Or change port in .env file
```

### Docker Build Fails

**Problem**: Docker image build fails

**Solution**:
```bash
# Clean Docker cache
docker system prune -af

# Rebuild without cache
docker-compose build --no-cache
```

### API Keys Not Working

**Problem**: OpenAI or ElevenLabs API returns 401

**Solution**:
- Verify API keys in `.env` file
- Check for extra spaces or quotes
- Ensure sufficient API credits
- Regenerate API keys if needed

### Frontend Not Loading

**Problem**: React app shows blank page

**Solution**:
```bash
# Check console for errors
# Rebuild frontend
cd landingpage
npm install
npm run build

# Or restart container
docker-compose restart landingpage
```

### Migration Errors

**Problem**: Django migrations fail

**Solution**:
```bash
# Reset migrations (development only!)
docker-compose exec backend python manage.py migrate app_name zero
docker-compose exec backend python manage.py migrate

# Or delete database and start fresh
docker-compose down -v
docker-compose up -d
```

## Getting Help

- Check logs: `docker-compose logs -f service_name`
- GitHub Issues: Report bugs
- Email: mehedi259@gmail.com
