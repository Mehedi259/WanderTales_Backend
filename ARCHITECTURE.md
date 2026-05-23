# WonderTales Hub - System Architecture

Detailed technical architecture and design decisions for WonderTales Hub.

---

## 🏗️ High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                         Internet                             │
└────────────────────────┬────────────────────────────────────┘
                         │
                         ▼
              ┌──────────────────────┐
              │   Nginx (Port 80/443)│
              │   Reverse Proxy      │
              │   SSL Termination    │
              └──────────┬───────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
        ▼                ▼                ▼
┌──────────────┐  ┌──────────────┐  ┌──────────────┐
│  Frontend    │  │   Backend    │  │  AI Service  │
│  React+Vite  │  │  Django+DRF  │  │   FastAPI    │
│  Port 5173   │  │  Port 8001   │  │  Port 8000   │
└──────────────┘  └──────┬───────┘  └──────┬───────┘
                         │                 │
                         ▼                 ▼
                  ┌──────────────┐  ┌──────────────┐
                  │  PostgreSQL  │  │  OpenAI API  │
                  │  Port 5432   │  │ ElevenLabs   │
                  └──────────────┘  └──────────────┘
```

---

## 🎯 Service Breakdown

### 1. Frontend (Landing Page)
**Technology**: React 18 + TypeScript + Vite

**Responsibilities**:
- User interface and experience
- Client-side routing
- State management
- API communication
- Audio playback with word highlighting

**Key Components**:
- Authentication flow
- Story player
- Profile management
- Dashboard
- Admin panel

**Communication**:
- REST API calls to Backend
- Direct calls to AI Service for real-time features

---

### 2. Backend API
**Technology**: Django 5.0 + Django REST Framework

**Responsibilities**:
- User authentication and authorization
- Data persistence
- Business logic
- File storage management
- Admin operations

**Key Features**:
- JWT token authentication
- User and children profile management
- Story CRUD operations
- Blog management
- Reporting system
- Notification system

**Database Schema**:
```
Users
├── CustomUserModel
│   ├── email (unique)
│   ├── username
│   ├── password (hashed)
│   ├── bio
│   ├── avatar
│   └── followers/following

Children Profiles
├── ChildrenProfileModel
│   ├── name
│   ├── age
│   ├── gender
│   ├── interests (JSON)
│   └── parent (FK to User)

Stories
├── StoryModel
│   ├── title
│   ├── content (text)
│   ├── language
│   ├── theme
│   ├── audio_url
│   ├── word_timestamps (JSON)
│   ├── cloned_voice_id
│   ├── child_profile (FK)
│   └── created_by (FK to User)

Reports
├── ReportModel
│   ├── content_type
│   ├── content_id
│   ├── reason
│   ├── status
│   └── reported_by (FK to User)
```

---

### 3. AI Service
**Technology**: FastAPI + OpenAI + ElevenLabs

**Responsibilities**:
- Story generation using GPT-4o
- Text-to-speech conversion
- Voice cloning
- Audio file management
- Word-level timestamp generation

**Key Endpoints**:
- `/stories/generate` - Generate new story
- `/stories/continue` - Continue existing story
- `/voices` - List available voices
- `/voices/clone` - Clone custom voice

**AI Pipeline**:
```
User Request
    │
    ▼
Story Generation (GPT-4o)
    │
    ├─→ Generate story text
    ├─→ Adapt to child's age/interests
    └─→ Apply theme
    │
    ▼
Text-to-Speech (ElevenLabs)
    │
    ├─→ Select voice
    ├─→ Generate audio
    └─→ Extract word timestamps
    │
    ▼
Response with Story + Audio
```

---

## 🔄 Data Flow

### Story Generation Flow

```
1. User submits story request (Frontend)
   ↓
2. Frontend calls Backend API
   ↓
3. Backend validates user and child profile
   ↓
4. Backend calls AI Service
   ↓
5. AI Service generates story (OpenAI)
   ↓
6. AI Service generates audio (ElevenLabs)
   ↓
7. AI Service returns story + audio URL
   ↓
8. Backend saves story to database
   ↓
9. Backend returns story to Frontend
   ↓
10. Frontend displays story and plays audio
```

### Authentication Flow

```
1. User enters credentials (Frontend)
   ↓
2. Frontend sends to /api/auth/login/
   ↓
3. Backend validates credentials
   ↓
4. Backend generates JWT tokens
   ↓
5. Frontend stores tokens
   ↓
6. Frontend includes token in subsequent requests
   ↓
7. Backend validates token on each request
```

---

## 🗄️ Database Design

### PostgreSQL Schema

**Users Table**:
- Primary authentication and profile data
- Relationships: One-to-Many with Children, Stories

**Children Profiles Table**:
- Child information and preferences
- Relationships: Many-to-One with Users, One-to-Many with Stories

**Stories Table**:
- Story content and metadata
- Relationships: Many-to-One with Users and Children

**Reports Table**:
- Content moderation
- Relationships: Many-to-One with Users

---

## 🔐 Security Architecture

### Authentication Layer
```
Request → JWT Validation → Permission Check → Endpoint
```

### Data Protection
- Passwords: PBKDF2 hashing
- API Keys: Environment variables
- Database: SSL connections
- Transport: HTTPS/TLS

### CORS Configuration
```python
CORS_ALLOWED_ORIGINS = [
    "http://localhost:5173",
    "https://wondertaleshub.com"
]
```

---

## 📦 Deployment Architecture

### Docker Containers

```
┌─────────────────────────────────────────┐
│         Docker Host (EC2)               │
│                                         │
│  ┌──────────┐  ┌──────────┐           │
│  │ Backend  │  │    AI    │           │
│  │Container │  │Container │           │
│  └────┬─────┘  └────┬─────┘           │
│       │             │                  │
│  ┌────┴─────────────┴─────┐           │
│  │   PostgreSQL Container │           │
│  └────────────────────────┘           │
│                                         │
│  ┌──────────────────────────┐         │
│  │  Frontend Container      │         │
│  └──────────────────────────┘         │
└─────────────────────────────────────────┘
```

### CI/CD Pipeline

```
GitHub Push
    │
    ▼
GitHub Actions
    │
    ├─→ Build Docker Images
    ├─→ Run Tests
    ├─→ Push to Docker Hub
    │
    ▼
SSH to EC2
    │
    ├─→ Pull Latest Images
    ├─→ Stop Old Containers
    ├─→ Start New Containers
    └─→ Health Check
```

---

## 🚀 Performance Optimization

### Backend
- Database query optimization
- Connection pooling
- Static file CDN (S3)
- Response caching (Redis - optional)

### Frontend
- Code splitting
- Lazy loading
- Asset optimization
- Service worker (PWA - optional)

### AI Service
- Story context caching
- Async processing
- Request queuing

---

## 📊 Monitoring & Logging

### Application Logs
- Django logs → `/var/log/django/`
- FastAPI logs → `/var/log/fastapi/`
- Nginx logs → `/var/log/nginx/`

### Metrics
- Request rate
- Response time
- Error rate
- Database connections
- API usage

---

## 🔄 Scalability Considerations

### Horizontal Scaling
- Load balancer (AWS ALB)
- Multiple backend instances
- Shared database (RDS)
- Shared file storage (S3)

### Vertical Scaling
- Increase EC2 instance size
- Database optimization
- Caching layer

### Future Enhancements
- Microservices architecture
- Message queue (RabbitMQ/Redis)
- Kubernetes orchestration
- CDN for static assets

---

## 🛠️ Technology Decisions

### Why Django?
- Mature ORM
- Built-in admin panel
- Strong security features
- Large ecosystem

### Why FastAPI?
- High performance
- Async support
- Auto-generated docs
- Type safety

### Why React?
- Component reusability
- Large ecosystem
- Strong TypeScript support
- Virtual DOM performance

### Why PostgreSQL?
- ACID compliance
- JSON support
- Scalability
- Reliability

---

## 📚 Design Patterns

### Backend
- Repository pattern for data access
- Service layer for business logic
- Serializers for data transformation
- Middleware for cross-cutting concerns

### Frontend
- Component composition
- Custom hooks for logic reuse
- Context API for state management
- Higher-order components

### AI Service
- Factory pattern for voice selection
- Strategy pattern for story generation
- Singleton for API clients

---

**Last Updated**: January 23, 2025
