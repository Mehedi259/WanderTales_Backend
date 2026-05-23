# 🌟 WonderTales Hub

**AI-Powered Personalized Storytelling Platform for Children**

WonderTales Hub is a full-stack application that generates personalized bedtime stories with AI narration, tailored to each child's interests, age, and preferences.

---

## 🎯 Features

- 🤖 **AI Story Generation** - GPT-4o powered personalized stories
- 🎙️ **Voice Narration** - ElevenLabs TTS with multiple voice options
- 👨‍👩‍👧 **Voice Cloning** - Clone family voices for personalized narration
- 📱 **Responsive Design** - Beautiful UI across all devices
- 🔐 **User Authentication** - Secure user accounts and profiles
- 📊 **Admin Dashboard** - Comprehensive content management
- 🌍 **Multi-language Support** - Stories in multiple languages
- ⏱️ **Word-level Timestamps** - Synchronized audio highlighting

---

## 🏗️ Architecture

```
┌─────────────────┐
│  Landing Page   │  (React + TypeScript + Vite)
│   (Frontend)    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   Backend API   │  (Django + DRF)
│  (REST API)     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│   AI Service    │  (FastAPI)
│  (Story + TTS)  │
└─────────────────┘
```

---

## 📁 Project Structure

```
WonderTales/
├── backend/          # Django REST API
├── ai/              # FastAPI AI service
├── landingpage/     # React frontend
├── infra/           # Infrastructure & deployment
│   ├── ansible/     # Ansible playbooks
│   └── nginx/       # Nginx configurations
└── docker-compose.prod.yml
```

---

## 🚀 Quick Start

### Prerequisites

- Docker & Docker Compose
- Python 3.11+
- Node.js 18+
- OpenAI API Key
- ElevenLabs API Key

### Local Development

1. **Clone the repository**
```bash
git clone https://github.com/Mehedi259/WonderTales.git
cd WonderTales
```

2. **Set up environment variables**
```bash
# Backend
cp backend/.env.example backend/.env

# AI Service
cp ai/example.env ai/.env

# Landing Page
cp landingpage/.env.example landingpage/.env
```

3. **Run with Docker Compose**
```bash
docker-compose up -d
```

4. **Access the application**
- Frontend: http://localhost:5173
- Backend API: http://localhost:8001
- AI Service: http://localhost:8000
- Admin Panel: http://localhost:8001/admin

---

## 🔧 Technology Stack

### Backend
- **Framework**: Django 5.0 + Django REST Framework
- **Database**: PostgreSQL
- **Authentication**: JWT (djangorestframework-simplejwt)
- **Storage**: AWS S3 / Local
- **API Documentation**: drf-yasg (Swagger)

### AI Service
- **Framework**: FastAPI
- **AI Models**: OpenAI GPT-4o
- **Text-to-Speech**: ElevenLabs API
- **Voice Cloning**: ElevenLabs Instant Voice Cloning

### Frontend
- **Framework**: React 18 + TypeScript
- **Build Tool**: Vite
- **Styling**: Tailwind CSS
- **State Management**: React Context
- **HTTP Client**: Axios

### DevOps
- **Containerization**: Docker
- **Orchestration**: Docker Compose
- **CI/CD**: GitHub Actions
- **Deployment**: AWS EC2
- **Web Server**: Nginx
- **SSL**: Let's Encrypt (Certbot)
- **Configuration Management**: Ansible

---

## 📚 Documentation

- [🚀 Quick Start Guide](./QUICKSTART.md) - Get started in 5 minutes
- [📖 API Documentation](./API.md) - Complete API reference
- [🏗️ Architecture](./ARCHITECTURE.md) - System design and architecture
- [🔐 Security Policy](./SECURITY.md) - Security guidelines
- [🤝 Contributing](./CONTRIBUTING.md) - How to contribute
- [📝 Changelog](./CHANGELOG.md) - Version history
- [🚀 Deployment Guide](./DEPLOYMENT.md) - Production deployment
- [🧪 Testing Guide](./TESTING.md) - Testing instructions
- [🐳 Docker Guide](./DOCKER_GUIDE.md) - Docker usage
- [⚙️ Environment Setup](./ENV_SETUP.md) - Configuration guide
- [⚡ Performance](./PERFORMANCE.md) - Optimization tips
- [🔧 Troubleshooting](./TROUBLESHOOTING.md) - Common issues
- [✨ Features](./FEATURES.md) - Feature documentation
- [❓ FAQ](./FAQ.md) - Frequently asked questions
- [🗺️ Roadmap](./ROADMAP.md) - Future plans
- [🎨 Screenshots](./SCREENSHOTS.md) - UI screenshots
- [🙏 Credits](./CREDITS.md) - Acknowledgments

---

## 🔐 Environment Variables

### Backend (.env)
```env
SECRET_KEY=your-secret-key
DEBUG=False
DATABASE_URL=postgresql://user:pass@db:5432/wondertales
AWS_ACCESS_KEY_ID=your-aws-key
AWS_SECRET_ACCESS_KEY=your-aws-secret
```

### AI Service (.env)
```env
OPENAI_API_KEY=your-openai-key
ELEVENLABS_API_KEY=your-elevenlabs-key
OPENAI_MODEL=gpt-4o
```

---

## 🚢 Deployment

### Production Deployment

1. **Configure secrets in GitHub**
   - `DOCKERHUB_USERNAME`
   - `DOCKERHUB_TOKEN`
   - `EC2_HOST`
   - `EC2_USER`
   - `EC2_SSH_PRIVATE_KEY`

2. **Push to main branch**
```bash
git push origin main
```

3. **GitHub Actions will automatically**:
   - Build Docker images
   - Push to Docker Hub
   - Deploy to EC2
   - Restart services

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

**Mehedi Hasan**
- GitHub: [@Mehedi259](https://github.com/Mehedi259)

---

## 🙏 Acknowledgments

- OpenAI for GPT-4o API
- ElevenLabs for TTS and Voice Cloning
- Django & FastAPI communities
- React & Vite teams

---

**Made with ❤️ for children's bedtime stories**
