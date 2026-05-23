# 🚀 WonderTales Infrastructure & Deployment

Infrastructure as Code (IaC) and deployment configurations for WonderTales Hub.

---

## 📁 Structure

```
infra/
├── ansible/
│   ├── playbook.yml          # Main deployment playbook
│   ├── inventory.ini         # Server inventory
│   └── roles/                # Ansible roles
├── nginx/
│   ├── backend.conf          # Backend API nginx config
│   ├── ai.conf              # AI service nginx config
│   └── landingpage.conf     # Frontend nginx config
└── README.md
```

---

## 🏗️ Architecture

```
                    Internet
                       │
                       ▼
                 ┌──────────┐
                 │  Nginx   │ (Reverse Proxy + SSL)
                 └────┬─────┘
                      │
        ┌─────────────┼─────────────┐
        │             │             │
        ▼             ▼             ▼
   ┌────────┐   ┌─────────┐   ┌──────────┐
   │Frontend│   │ Backend │   │ AI Service│
   │  :5173 │   │  :8001  │   │   :8000   │
   └────────┘   └────┬────┘   └──────────┘
                     │
                     ▼
              ┌──────────────┐
              │  PostgreSQL  │
              │    :5432     │
              └──────────────┘
```

---

## 🛠️ Technologies

- **Configuration Management**: Ansible
- **Web Server**: Nginx
- **SSL/TLS**: Let's Encrypt (Certbot)
- **Containerization**: Docker & Docker Compose
- **CI/CD**: GitHub Actions
- **Cloud Provider**: AWS EC2
- **Container Registry**: Docker Hub

---

## 🚢 Deployment Methods

### 1. Automated Deployment (GitHub Actions)

**Trigger**: Push to `main` branch

**Process**:
1. Build Docker images for all services
2. Push images to Docker Hub
3. SSH to EC2 instance
4. Pull latest images
5. Restart services with docker-compose

**Required Secrets**:
```yaml
DOCKERHUB_USERNAME=Mehedi259
DOCKERHUB_TOKEN=your-token
EC2_HOST=your-ec2-ip
EC2_USER=ubuntu
EC2_SSH_PRIVATE_KEY=your-private-key
```

### 2. Manual Deployment with Ansible

**Prerequisites**:
```bash
# Install Ansible
pip install ansible

# Configure inventory
cp infra/ansible/inventory.ini.example infra/ansible/inventory.ini
# Edit with your server details
```

**Deploy**:
```bash
cd infra/ansible
ansible-playbook -i inventory.ini playbook.yml
```

**What Ansible Does**:
- ✅ Install Docker & Docker Compose
- ✅ Configure Nginx with SSL
- ✅ Set up Let's Encrypt certificates
- ✅ Deploy application containers
- ✅ Configure firewall rules
- ✅ Set up log rotation
- ✅ Configure automatic updates

### 3. Manual Docker Deployment

**On Server**:
```bash
# Clone repository
git clone https://github.com/Mehedi259/WonderTales.git
cd WonderTales

# Configure environment
cp backend/.env.example backend/.env
cp ai/.env.example ai/.env
# Edit .env files

# Deploy
docker-compose -f docker-compose.prod.yml up -d

# View logs
docker-compose -f docker-compose.prod.yml logs -f
```

---

## 🔧 Nginx Configuration

### Backend API (api.wondertaleshub.com)

```nginx
server {
    listen 80;
    server_name api.wondertaleshub.com;
    
    location / {
        proxy_pass http://localhost:8001;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### AI Service (ai.wondertaleshub.com)

```nginx
server {
    listen 80;
    server_name ai.wondertaleshub.com;
    
    location / {
        proxy_pass http://localhost:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

### Frontend (wondertaleshub.com)

```nginx
server {
    listen 80;
    server_name wondertaleshub.com www.wondertaleshub.com;
    
    location / {
        proxy_pass http://localhost:5173;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

---

## 🔐 SSL/TLS Setup

### Automatic (Ansible)
Ansible playbook automatically configures Let's Encrypt SSL certificates.

### Manual Setup
```bash
# Install Certbot
sudo apt install certbot python3-certbot-nginx

# Obtain certificates
sudo certbot --nginx -d wondertaleshub.com -d www.wondertaleshub.com
sudo certbot --nginx -d api.wondertaleshub.com
sudo certbot --nginx -d ai.wondertaleshub.com

# Auto-renewal (already configured)
sudo certbot renew --dry-run
```

---

## 📊 Monitoring & Logs

### View Container Logs
```bash
# All services
docker-compose -f docker-compose.prod.yml logs -f

# Specific service
docker-compose -f docker-compose.prod.yml logs -f backend
docker-compose -f docker-compose.prod.yml logs -f ai
docker-compose -f docker-compose.prod.yml logs -f landingpage
```

### Nginx Logs
```bash
# Access logs
sudo tail -f /var/log/nginx/access.log

# Error logs
sudo tail -f /var/log/nginx/error.log
```

### Container Stats
```bash
docker stats
```

---

## 🔄 CI/CD Pipeline

### GitHub Actions Workflow

**File**: `.github/workflows/pipeline.yml`

**Stages**:

1. **Build & Push**
   - Build Docker images
   - Tag with `latest`
   - Push to Docker Hub

2. **Deploy**
   - SSH to EC2
   - Pull latest images
   - Restart containers
   - Clean up old images

**Trigger**:
```bash
git push origin main
```

---

## 🐳 Docker Compose Services

### Production Configuration

```yaml
services:
  backend:
    image: Mehedi259/wondertales:backend-latest
    ports:
      - "8001:8001"
    environment:
      - DATABASE_URL=postgresql://...
    
  ai:
    image: Mehedi259/wondertales:ai-latest
    ports:
      - "8000:8000"
    environment:
      - OPENAI_API_KEY=...
    
  landingpage:
    image: Mehedi259/wondertales:landingpage-latest
    ports:
      - "5173:5173"
    
  db:
    image: postgres:15
    volumes:
      - postgres_data:/var/lib/postgresql/data
```

---

## 🔧 Server Requirements

### Minimum Specifications
- **CPU**: 2 vCPUs
- **RAM**: 4 GB
- **Storage**: 20 GB SSD
- **OS**: Ubuntu 22.04 LTS

### Recommended Specifications
- **CPU**: 4 vCPUs
- **RAM**: 8 GB
- **Storage**: 40 GB SSD
- **OS**: Ubuntu 22.04 LTS

### Required Ports
- `80` - HTTP
- `443` - HTTPS
- `22` - SSH
- `5432` - PostgreSQL (internal)

---

## 🛡️ Security Checklist

- ✅ SSL/TLS certificates configured
- ✅ Firewall rules (UFW) enabled
- ✅ SSH key-based authentication
- ✅ Disable root login
- ✅ Regular security updates
- ✅ Environment variables secured
- ✅ Database password protected
- ✅ CORS properly configured
- ✅ Rate limiting enabled
- ✅ Fail2ban configured (optional)

---

## 🔄 Backup Strategy

### Database Backup
```bash
# Backup
docker exec wondertales-db pg_dump -U postgres wondertales > backup.sql

# Restore
docker exec -i wondertales-db psql -U postgres wondertales < backup.sql
```

### Automated Backups
```bash
# Add to crontab
0 2 * * * /path/to/backup-script.sh
```

---

## 🐛 Troubleshooting

### Container Won't Start
```bash
# Check logs
docker-compose -f docker-compose.prod.yml logs service-name

# Restart service
docker-compose -f docker-compose.prod.yml restart service-name
```

### Nginx Configuration Error
```bash
# Test configuration
sudo nginx -t

# Reload nginx
sudo systemctl reload nginx
```

### SSL Certificate Issues
```bash
# Renew certificates
sudo certbot renew

# Check certificate status
sudo certbot certificates
```

### Disk Space Full
```bash
# Clean Docker
docker system prune -af

# Clean logs
sudo journalctl --vacuum-time=7d
```

---

## 📈 Scaling

### Horizontal Scaling
- Use load balancer (AWS ALB/ELB)
- Deploy multiple EC2 instances
- Shared PostgreSQL (RDS)
- Shared file storage (S3)

### Vertical Scaling
- Upgrade EC2 instance type
- Increase RAM and CPU
- Optimize database queries

---

## 🔗 Useful Commands

```bash
# Deploy latest changes
git pull && docker-compose -f docker-compose.prod.yml up -d --build

# View running containers
docker ps

# Stop all services
docker-compose -f docker-compose.prod.yml down

# Remove all data (DANGER!)
docker-compose -f docker-compose.prod.yml down -v

# Update single service
docker-compose -f docker-compose.prod.yml up -d --no-deps --build backend
```

---

## 📞 Support

For deployment issues:
1. Check logs first
2. Verify environment variables
3. Test network connectivity
4. Review Nginx configuration

---

**Part of WonderTales Hub - Infrastructure Documentation**
