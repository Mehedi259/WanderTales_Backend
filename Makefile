.PHONY: help install dev build up down logs clean test migrate

help:
	@echo "WonderTales Hub - Development Commands"
	@echo ""
	@echo "Available commands:"
	@echo "  make install    - Install all dependencies"
	@echo "  make dev        - Start development environment"
	@echo "  make build      - Build Docker images"
	@echo "  make up         - Start all services"
	@echo "  make down       - Stop all services"
	@echo "  make logs       - View logs"
	@echo "  make clean      - Clean up containers and volumes"
	@echo "  make test       - Run all tests"
	@echo "  make migrate    - Run database migrations"
	@echo "  make shell      - Open Django shell"
	@echo "  make superuser  - Create Django superuser"

install:
	@echo "Installing backend dependencies..."
	cd backend && pip install -r requirements.txt
	@echo "Installing AI service dependencies..."
	cd ai && pip install -r requirements.txt
	@echo "Installing frontend dependencies..."
	cd landingpage && npm install
	@echo "✓ All dependencies installed"

dev:
	@echo "Starting development environment..."
	docker-compose -f docker-compose.dev.yml up -d
	@echo "✓ Development environment started"
	@echo "Backend: http://localhost:8001"
	@echo "AI Service: http://localhost:8000"
	@echo "Frontend: http://localhost:5173"

build:
	@echo "Building Docker images..."
	docker-compose -f docker-compose.dev.yml build
	@echo "✓ Images built successfully"

up:
	@echo "Starting all services..."
	docker-compose -f docker-compose.dev.yml up -d
	@echo "✓ Services started"

down:
	@echo "Stopping all services..."
	docker-compose -f docker-compose.dev.yml down
	@echo "✓ Services stopped"

logs:
	docker-compose -f docker-compose.dev.yml logs -f

clean:
	@echo "Cleaning up..."
	docker-compose -f docker-compose.dev.yml down -v
	docker system prune -f
	@echo "✓ Cleanup complete"

test:
	@echo "Running backend tests..."
	cd backend && python manage.py test
	@echo "Running AI service tests..."
	cd ai && pytest
	@echo "✓ All tests completed"

migrate:
	@echo "Running database migrations..."
	docker-compose -f docker-compose.dev.yml exec backend python manage.py migrate
	@echo "✓ Migrations completed"

shell:
	docker-compose -f docker-compose.dev.yml exec backend python manage.py shell

superuser:
	docker-compose -f docker-compose.dev.yml exec backend python manage.py createsuperuser

format:
	@echo "Formatting Python code..."
	cd backend && black .
	cd ai && black .
	@echo "Formatting TypeScript code..."
	cd landingpage && npm run format
	@echo "✓ Code formatted"

lint:
	@echo "Linting backend..."
	cd backend && flake8 .
	@echo "Linting AI service..."
	cd ai && flake8 .
	@echo "Linting frontend..."
	cd landingpage && npm run lint
	@echo "✓ Linting completed"
