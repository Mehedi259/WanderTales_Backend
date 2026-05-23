# Environment Setup Guide

## Backend Environment Variables

### Required Variables
```env
# Django Core
SECRET_KEY=your-secret-key-here
DEBUG=False
ALLOWED_HOSTS=localhost,127.0.0.1,yourdomain.com

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/wondertales

# CORS
CORS_ALLOWED_ORIGINS=http://localhost:5173,https://yourdomain.com
```

### Optional Variables
```env
# AWS S3 Storage
AWS_ACCESS_KEY_ID=your-aws-key
AWS_SECRET_ACCESS_KEY=your-aws-secret
AWS_STORAGE_BUCKET_NAME=your-bucket
AWS_S3_REGION_NAME=us-east-1
USE_S3=True

# Email
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_HOST_USER=your-email@gmail.com
EMAIL_HOST_PASSWORD=your-app-password
EMAIL_USE_TLS=True

# JWT
JWT_ACCESS_TOKEN_LIFETIME=60
JWT_REFRESH_TOKEN_LIFETIME=1440
```

## AI Service Environment Variables

### Required Variables
```env
# OpenAI
OPENAI_API_KEY=sk-your-key-here
OPENAI_MODEL=gpt-4o

# ElevenLabs
ELEVENLABS_API_KEY=your-elevenlabs-key

# Voice IDs
ELEVENLABS_VOICE_PRIMARY_FEMALE=voice-id-here
ELEVENLABS_VOICE_PRIMARY_MALE=voice-id-here
```

### Optional Variables
```env
# Server Configuration
APP_HOST=0.0.0.0
APP_PORT=8000

# Storage
AUDIO_STORAGE_DIR=./audio_files

# CORS
ALLOWED_ORIGINS=http://localhost:5173,https://yourdomain.com
```

## Frontend Environment Variables

```env
# API Endpoints
VITE_API_URL=http://localhost:8001
VITE_AI_SERVICE_URL=http://localhost:8000

# Feature Flags
VITE_ENABLE_ANALYTICS=false
VITE_ENABLE_VOICE_CLONING=true

# External Services
VITE_GOOGLE_ANALYTICS_ID=UA-XXXXXXXXX-X
```

## Getting API Keys

### OpenAI
1. Visit https://platform.openai.com/api-keys
2. Create new secret key
3. Copy and save securely

### ElevenLabs
1. Visit https://elevenlabs.io/
2. Go to Profile → API Keys
3. Generate new API key

### AWS S3 (Optional)
1. AWS Console → IAM
2. Create new user with S3 permissions
3. Generate access key

## Security Best Practices

### Never Commit Secrets
```bash
# Add to .gitignore
.env
.env.local
.env.*.local
```

### Use Strong Secret Keys
```python
# Generate Django secret key
python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'
```

### Rotate Keys Regularly
- Change API keys every 90 days
- Update database passwords quarterly
- Regenerate JWT secrets annually

## Environment-Specific Configs

### Development
```env
DEBUG=True
ALLOWED_HOSTS=*
USE_S3=False
```

### Staging
```env
DEBUG=False
ALLOWED_HOSTS=staging.yourdomain.com
USE_S3=True
```

### Production
```env
DEBUG=False
ALLOWED_HOSTS=yourdomain.com
USE_S3=True
SECURE_SSL_REDIRECT=True
SESSION_COOKIE_SECURE=True
CSRF_COOKIE_SECURE=True
```
