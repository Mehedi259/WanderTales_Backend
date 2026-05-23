# 🚀 Quick Start Guide

Get WonderTales Hub up and running in 5 minutes!

---

## ⚡ Prerequisites

Before you begin, ensure you have:

- ✅ **Docker** & **Docker Compose** installed
- ✅ **Git** installed
- ✅ **OpenAI API Key** ([Get one here](https://platform.openai.com/api-keys))
- ✅ **ElevenLabs API Key** ([Get one here](https://elevenlabs.io/))

---

## 📥 Step 1: Clone the Repository

```bash
git clone https://github.com/Mehedi259/WonderTales.git
cd WonderTales
```

---

## 🔧 Step 2: Configure Environment Variables

### Backend Configuration

```bash
cp backend/.env.example backend/.env
```

Edit `backend/.env`:
```env
SECRET_KEY=your-secret-key-change-this
DEBUG=True
DATABASE_URL=postgresql://postgres:postgres@db:5432/wondertales
ALLOWED_HOSTS=localhost,127.0.0.1
CORS_ALLOWED_ORIGINS=http://localhost:5173
AI_SERVICE_URL=http://ai:8000
```

### AI Service Configuration

```bash
cp ai/example.env ai/.env
```

Edit `ai/.env`:
```env
OPENAI_API_KEY=sk-your-openai-key-here
ELEVENLABS_API_KEY=your-elevenlabs-key-here
OPENAI_MODEL=gpt-4o
```

### Frontend Configuration

```bash
cp landingpage/.env.example landingpage/.env
```

Edit `landingpage/.env`:
```env
VITE_API_URL=http://localhost:8001
VITE_AI_SERVICE_URL=http://localhost:8000
```

---

## 🐳 Step 3: Start with Docker Compose

### Option A: Development Mode (Recommended for first-time setup)

```bash
docker-compose -f docker-compose.dev.yml up -d
```

### Option B: Production Mode

```bash
docker-compose -f docker-compose.prod.yml up -d
```

---

## ⏳ Step 4: Wait for Services to Start

Check if all services are running:

```bash
docker-compose -f docker-compose.dev.yml ps
```

You should see:
- ✅ wondertales-backend-dev (running)
- ✅ wondertales-ai-dev (running)
- ✅ wondertales-frontend-dev (running)
- ✅ wondertales-db-dev (running)

---

## 🗄️ Step 5: Initialize Database

Run migrations:

```bash
docker-compose -f docker-compose.dev.yml exec backend python manage.py migrate
```

Create a superuser:

```bash
docker-compose -f docker-compose.dev.yml exec backend python manage.py createsuperuser
```

Follow the prompts to create your admin account.

---

## 🎉 Step 6: Access the Application

Open your browser and visit:

- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:8001
- **AI Service**: http://localhost:8000
- **Admin Panel**: http://localhost:8001/admin
- **API Docs**: http://localhost:8001/swagger/

---

## 🧪 Step 7: Test the Setup

### Test Backend API

```bash
curl http://localhost:8001/api/health/
```

Expected response:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

### Test AI Service

```bash
curl http://localhost:8000/health
```

Expected response:
```json
{
  "status": "healthy",
  "openai": "connected",
  "elevenlabs": "connected"
}
```

---

## 📖 Step 8: Generate Your First Story

### Via API

```bash
curl -X POST http://localhost:8000/stories/generate \
  -H "Content-Type: application/json" \
  -d '{
    "child_profile": {
      "name": "Emma",
      "age": 6,
      "interests": ["dinosaurs", "space"]
    },
    "language": "en",
    "narrator_voice": "primary_female",
    "theme": "bedtime"
  }'
```

### Via Frontend

1. Register a new account at http://localhost:5173/register
2. Log in with your credentials
3. Create a child profile
4. Click "Generate Story"
5. Fill in the details and submit
6. Listen to your personalized story!

---

## 🛑 Stopping the Application

```bash
docker-compose -f docker-compose.dev.yml down
```

To remove all data (⚠️ Warning: This deletes the database):

```bash
docker-compose -f docker-compose.dev.yml down -v
```

---

## 🔄 Restarting Services

Restart all services:

```bash
docker-compose -f docker-compose.dev.yml restart
```

Restart a specific service:

```bash
docker-compose -f docker-compose.dev.yml restart backend
```

---

## 📊 Viewing Logs

View all logs:

```bash
docker-compose -f docker-compose.dev.yml logs -f
```

View specific service logs:

```bash
docker-compose -f docker-compose.dev.yml logs -f backend
docker-compose -f docker-compose.dev.yml logs -f ai
docker-compose -f docker-compose.dev.yml logs -f landingpage
```

---

## 🐛 Troubleshooting

### Port Already in Use

If you get a "port already in use" error:

```bash
# Find the process using the port
lsof -i :8001  # or :8000, :5173

# Kill the process
kill -9 <PID>
```

### Database Connection Error

```bash
# Restart the database
docker-compose -f docker-compose.dev.yml restart db

# Check database logs
docker-compose -f docker-compose.dev.yml logs db
```

### API Keys Not Working

1. Verify your API keys are correct
2. Check if you have sufficient credits
3. Ensure no extra spaces in `.env` files

### Frontend Not Loading

```bash
# Rebuild frontend
docker-compose -f docker-compose.dev.yml up -d --build landingpage

# Check frontend logs
docker-compose -f docker-compose.dev.yml logs landingpage
```

---

## 🎯 Next Steps

Now that you're up and running:

1. 📚 Read the [API Documentation](./API.md)
2. 🏗️ Explore the [Architecture](./ARCHITECTURE.md)
3. 🤝 Check [Contributing Guidelines](./CONTRIBUTING.md)
4. 🔐 Review [Security Policy](./SECURITY.md)

---

## 💡 Using Makefile (Alternative)

If you prefer using Make commands:

```bash
# Install dependencies
make install

# Start development environment
make dev

# View logs
make logs

# Run migrations
make migrate

# Create superuser
make superuser

# Stop services
make down

# Clean up
make clean
```

---

## 🆘 Getting Help

- 📖 [Full Documentation](./README.md)
- 🐛 [Report Issues](https://github.com/Mehedi259/WonderTales/issues)
- 💬 [Discussions](https://github.com/Mehedi259/WonderTales/discussions)
- 📧 Email: mehedi259@gmail.com

---

## ✅ Checklist

- [ ] Docker and Docker Compose installed
- [ ] Repository cloned
- [ ] Environment variables configured
- [ ] Services started with Docker Compose
- [ ] Database migrations run
- [ ] Superuser created
- [ ] All services accessible
- [ ] First story generated successfully

---

**Congratulations! 🎉 You're now ready to create amazing stories with WonderTales Hub!**
