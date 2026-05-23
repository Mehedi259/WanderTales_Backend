# 🎯 WonderTales Backend API

Django REST Framework backend service for WonderTales Hub - managing users, stories, profiles, and content.

---

## 🚀 Features

- 🔐 **JWT Authentication** - Secure token-based auth
- 👤 **User Management** - Registration, login, profiles
- 📖 **Story Management** - CRUD operations for stories
- 👶 **Children Profiles** - Multiple child profiles per user
- 📊 **Admin Dashboard** - Comprehensive admin interface
- 🎨 **Custom Themes** - Story theme management
- 📝 **Blog System** - Content management for blogs
- 🔔 **Notifications** - User notification system
- 📱 **App Settings** - Configurable app settings
- 🚫 **User Blocking** - Block/unblock functionality
- 📈 **Reporting System** - Content reporting and moderation

---

## 📁 Project Structure

```
backend/
├── apps/
│   ├── admins/          # Admin dashboard & reports
│   ├── app_settings/    # Application settings
│   ├── blogs/           # Blog management
│   ├── story/           # Story CRUD operations
│   └── users/           # User authentication & profiles
├── config/              # Django settings
├── staticfiles/         # Static files (CSS, JS, images)
├── media/              # User uploaded files
├── manage.py
├── requirements.txt
└── Dockerfile
```

---

## 🛠️ Technology Stack

- **Framework**: Django 5.0.6
- **API**: Django REST Framework 3.15.1
- **Database**: PostgreSQL (production) / SQLite (dev)
- **Authentication**: djangorestframework-simplejwt
- **Storage**: django-storages (AWS S3)
- **CORS**: django-cors-headers
- **API Docs**: drf-yasg (Swagger/OpenAPI)
- **Image Processing**: Pillow
- **Environment**: python-decouple

---

## 🔧 Installation

### Prerequisites
- Python 3.11+
- PostgreSQL (for production)
- pip or uv

### Setup

1. **Create virtual environment**
```bash
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
```

2. **Install dependencies**
```bash
pip install -r requirements.txt
```

3. **Configure environment**
```bash
cp .env.example .env
# Edit .env with your configuration
```

4. **Run migrations**
```bash
python manage.py migrate
```

5. **Create superuser**
```bash
python manage.py createsuperuser
```

6. **Collect static files**
```bash
python manage.py collectstatic --noinput
```

7. **Run development server**
```bash
python manage.py runserver 0.0.0.0:8001
```

---

## 🌐 API Endpoints

### Authentication
- `POST /api/auth/register/` - User registration
- `POST /api/auth/login/` - User login
- `POST /api/auth/token/refresh/` - Refresh JWT token
- `POST /api/auth/logout/` - User logout

### Users
- `GET /api/users/profile/` - Get user profile
- `PUT /api/users/profile/` - Update user profile
- `GET /api/users/children/` - List children profiles
- `POST /api/users/children/` - Create child profile

### Stories
- `GET /api/stories/` - List stories
- `POST /api/stories/` - Create story
- `GET /api/stories/{id}/` - Get story details
- `PUT /api/stories/{id}/` - Update story
- `DELETE /api/stories/{id}/` - Delete story

### Admin
- `GET /api/admin/reports/` - List reports
- `POST /api/admin/reports/` - Create report
- `GET /api/admin/users/` - List all users
- `POST /api/admin/users/{id}/block/` - Block user

### Documentation
- `/swagger/` - Swagger UI
- `/redoc/` - ReDoc UI
- `/swagger.json` - OpenAPI schema

---

## 🔐 Environment Variables

```env
# Django
SECRET_KEY=your-secret-key-here
DEBUG=False
ALLOWED_HOSTS=localhost,127.0.0.1,yourdomain.com

# Database
DATABASE_URL=postgresql://user:password@localhost:5432/wondertales

# CORS
CORS_ALLOWED_ORIGINS=http://localhost:5173,https://yourdomain.com

# AWS S3 (Optional)
AWS_ACCESS_KEY_ID=your-aws-access-key
AWS_SECRET_ACCESS_KEY=your-aws-secret-key
AWS_STORAGE_BUCKET_NAME=your-bucket-name
AWS_S3_REGION_NAME=us-east-1

# AI Service
AI_SERVICE_URL=http://localhost:8000

# Email (Optional)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_HOST_USER=your-email@gmail.com
EMAIL_HOST_PASSWORD=your-app-password
EMAIL_USE_TLS=True
```

---

## 🐳 Docker Deployment

### Build Image
```bash
docker build -t wondertales-backend .
```

### Run Container
```bash
docker run -d \
  -p 8001:8001 \
  --env-file .env \
  --name wondertales-backend \
  wondertales-backend
```

### With Docker Compose
```bash
docker-compose up -d backend
```

---

## 📊 Database Models

### User Model
- Custom user model with email authentication
- Profile fields: bio, avatar, date of birth
- Social features: followers, following
- Blocking functionality

### Story Model
- Title, content, language
- Child profile association
- Voice settings (narrator, cloned voice)
- Word-level timestamps
- Custom themes
- Audio file reference

### Children Profile Model
- Name, age, gender
- Interests and preferences
- Parent/guardian association

### Report Model
- Content reporting
- Moderation status
- Admin actions

---

## 🧪 Testing

```bash
# Run all tests
python manage.py test

# Run specific app tests
python manage.py test apps.users

# Run with coverage
coverage run --source='.' manage.py test
coverage report
```

---

## 📝 Admin Interface

Access the Django admin at `/admin/`

Features:
- User management
- Story moderation
- Content reports
- App settings configuration
- Blog post management

---

## 🔒 Security Features

- JWT token authentication
- CORS protection
- CSRF protection
- SQL injection prevention (Django ORM)
- XSS protection
- Password hashing (PBKDF2)
- Rate limiting (optional)

---

## 📈 Performance

- Database query optimization
- Static file compression
- CDN integration (AWS S3)
- Caching (Redis - optional)
- Database indexing

---

## 🐛 Troubleshooting

### Database Connection Error
```bash
# Check PostgreSQL is running
sudo systemctl status postgresql

# Verify DATABASE_URL in .env
```

### Static Files Not Loading
```bash
# Collect static files
python manage.py collectstatic --noinput

# Check STATIC_ROOT and STATIC_URL settings
```

### Migration Issues
```bash
# Reset migrations (development only)
python manage.py migrate --fake app_name zero
python manage.py migrate app_name
```

---

## 📚 API Documentation

Full API documentation available at:
- Swagger UI: http://localhost:8001/swagger/
- ReDoc: http://localhost:8001/redoc/

---

## 🤝 Contributing

1. Follow Django coding standards
2. Write tests for new features
3. Update API documentation
4. Run tests before committing

---

**Part of WonderTales Hub - AI-Powered Storytelling Platform**
