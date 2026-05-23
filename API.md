# WonderTales Hub API Documentation

Complete API reference for WonderTales Hub backend and AI services.

---

## 🔗 Base URLs

- **Backend API**: `http://localhost:8001/api/`
- **AI Service**: `http://localhost:8000/`
- **Production Backend**: `https://api.wondertaleshub.com/api/`
- **Production AI**: `https://ai.wondertaleshub.com/`

---

## 🔐 Authentication

### JWT Token Authentication

All authenticated endpoints require a Bearer token in the Authorization header:

```http
Authorization: Bearer <your_jwt_token>
```

### Obtain Token

**Endpoint**: `POST /api/auth/login/`

**Request**:
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

**Response**:
```json
{
  "access": "eyJ0eXAiOiJKV1QiLCJhbGc...",
  "refresh": "eyJ0eXAiOiJKV1QiLCJhbGc...",
  "user": {
    "id": 1,
    "email": "user@example.com",
    "username": "user123"
  }
}
```

### Refresh Token

**Endpoint**: `POST /api/auth/token/refresh/`

**Request**:
```json
{
  "refresh": "eyJ0eXAiOiJKV1QiLCJhbGc..."
}
```

---

## 👤 User Endpoints

### Register User

**Endpoint**: `POST /api/auth/register/`

**Request**:
```json
{
  "email": "newuser@example.com",
  "username": "newuser",
  "password": "securepassword123",
  "password_confirm": "securepassword123"
}
```

### Get User Profile

**Endpoint**: `GET /api/users/profile/`

**Headers**: `Authorization: Bearer <token>`

**Response**:
```json
{
  "id": 1,
  "email": "user@example.com",
  "username": "user123",
  "bio": "Parent of two wonderful kids",
  "avatar": "https://example.com/avatar.jpg",
  "date_joined": "2025-01-01T00:00:00Z"
}
```

### Update Profile

**Endpoint**: `PUT /api/users/profile/`

**Headers**: `Authorization: Bearer <token>`

**Request**:
```json
{
  "bio": "Updated bio",
  "avatar": "<file_upload>"
}
```

---

## 👶 Children Profile Endpoints

### List Children

**Endpoint**: `GET /api/users/children/`

**Headers**: `Authorization: Bearer <token>`

**Response**:
```json
[
  {
    "id": 1,
    "name": "Emma",
    "age": 6,
    "gender": "female",
    "interests": ["dinosaurs", "space", "animals"],
    "created_at": "2025-01-01T00:00:00Z"
  }
]
```

### Create Child Profile

**Endpoint**: `POST /api/users/children/`

**Request**:
```json
{
  "name": "Emma",
  "age": 6,
  "gender": "female",
  "interests": ["dinosaurs", "space"]
}
```

---

## 📖 Story Endpoints

### List Stories

**Endpoint**: `GET /api/stories/`

**Query Parameters**:
- `page`: Page number (default: 1)
- `page_size`: Items per page (default: 10)
- `language`: Filter by language (e.g., "en", "bn")
- `theme`: Filter by theme

**Response**:
```json
{
  "count": 50,
  "next": "http://localhost:8001/api/stories/?page=2",
  "previous": null,
  "results": [
    {
      "id": "abc123",
      "title": "Emma's Space Adventure",
      "content": "Once upon a time...",
      "language": "en",
      "theme": "bedtime",
      "audio_url": "http://localhost:8000/audio/abc123.mp3",
      "word_timestamps": [...],
      "created_at": "2025-01-20T10:00:00Z"
    }
  ]
}
```

### Get Story Details

**Endpoint**: `GET /api/stories/{id}/`

### Create Story (via AI Service)

**Endpoint**: `POST /stories/generate` (AI Service)

**Request**:
```json
{
  "child_profile": {
    "name": "Emma",
    "age": 6,
    "interests": ["dinosaurs", "space"]
  },
  "language": "en",
  "narrator_voice": "primary_female",
  "theme": "bedtime"
}
```

**Response**:
```json
{
  "story_id": "abc123",
  "story_text": "Once upon a time...",
  "audio_url": "http://localhost:8000/audio/abc123.mp3",
  "word_timestamps": [
    {"word": "Once", "start": 0.0, "end": 0.5},
    {"word": "upon", "start": 0.5, "end": 0.8}
  ],
  "language": "en",
  "voice_used": "primary_female"
}
```

### Continue Story

**Endpoint**: `POST /stories/continue` (AI Service)

**Request**:
```json
{
  "story_id": "abc123",
  "child_profile": {
    "name": "Emma",
    "age": 6
  },
  "language": "en",
  "narrator_voice": "primary_female"
}
```

### Delete Story

**Endpoint**: `DELETE /api/stories/{id}/`

---

## 🎙️ Voice Endpoints

### List Available Voices

**Endpoint**: `GET /voices` (AI Service)

**Response**:
```json
{
  "voices": [
    {
      "id": "primary_female",
      "name": "Primary Female Narrator",
      "description": "Soothing female voice for main narration"
    },
    {
      "id": "primary_male",
      "name": "Primary Male Narrator",
      "description": "Warm male voice for storytelling"
    }
  ]
}
```

### Clone Voice

**Endpoint**: `POST /voices/clone` (AI Service)

**Request** (multipart/form-data):
```
voice_name: "Mom's Voice"
description: "Family narrator"
audio_file: <file_upload>
```

**Response**:
```json
{
  "voice_id": "cloned_abc123",
  "voice_name": "Mom's Voice",
  "message": "Voice cloned successfully"
}
```

---

## 📊 Admin Endpoints

### List Reports

**Endpoint**: `GET /api/admin/reports/`

**Headers**: `Authorization: Bearer <admin_token>`

### Create Report

**Endpoint**: `POST /api/admin/reports/`

**Request**:
```json
{
  "content_type": "story",
  "content_id": "abc123",
  "reason": "inappropriate_content",
  "description": "Contains inappropriate language"
}
```

### Block User

**Endpoint**: `POST /api/admin/users/{id}/block/`

---

## 📝 Blog Endpoints

### List Blog Posts

**Endpoint**: `GET /api/blogs/`

### Get Blog Post

**Endpoint**: `GET /api/blogs/{id}/`

---

## ⚙️ App Settings

### Get Settings

**Endpoint**: `GET /api/settings/`

### Update Settings

**Endpoint**: `PUT /api/settings/`

---

## 🏥 Health Check

### Backend Health

**Endpoint**: `GET /api/health/`

**Response**:
```json
{
  "status": "healthy",
  "database": "connected",
  "timestamp": "2025-01-23T10:00:00Z"
}
```

### AI Service Health

**Endpoint**: `GET /health` (AI Service)

**Response**:
```json
{
  "status": "healthy",
  "openai": "connected",
  "elevenlabs": "connected"
}
```

---

## 📊 Response Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 201 | Created |
| 204 | No Content |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 429 | Too Many Requests |
| 500 | Internal Server Error |

---

## 🔄 Rate Limiting

- **Default**: 100 requests per minute per IP
- **Authenticated**: 1000 requests per minute per user
- **Story Generation**: 10 requests per minute per user

---

## 📚 Additional Resources

- [Swagger UI](http://localhost:8001/swagger/)
- [ReDoc](http://localhost:8001/redoc/)
- [Postman Collection](./postman_collection.json)

---

**Last Updated**: January 23, 2025
