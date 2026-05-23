# Testing Guide

## Backend Tests

### Run All Tests
```bash
cd backend
python manage.py test
```

### Run Specific App Tests
```bash
python manage.py test apps.users
python manage.py test apps.story
```

### With Coverage
```bash
coverage run --source='.' manage.py test
coverage report
coverage html
```

## AI Service Tests

### Run Tests
```bash
cd ai
pytest
pytest -v  # verbose
pytest tests/test_story_service.py  # specific test
```

### With Coverage
```bash
pytest --cov=. --cov-report=html
```

## Frontend Tests

### Run Tests
```bash
cd landingpage
npm run test
npm run test:coverage
```

## Integration Tests

### API Testing
```bash
# Use Postman or curl
curl -X POST http://localhost:8001/api/auth/login/ \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"test123"}'
```

## Test Coverage Goals
- Backend: > 80%
- AI Service: > 75%
- Frontend: > 70%
