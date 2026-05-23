# Security Policy

## 🔒 Supported Versions

We release patches for security vulnerabilities. Currently supported versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

---

## 🚨 Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability, please follow these steps:

### 1. **Do Not** Open a Public Issue

Please do not create a public GitHub issue for security vulnerabilities.

### 2. Report Privately

Send an email to: **mehedi259@gmail.com**

Include:
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if any)

### 3. Response Time

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Fix Timeline**: Depends on severity

---

## 🛡️ Security Measures

### Authentication & Authorization
- JWT token-based authentication
- Token expiration and refresh mechanism
- Password hashing with PBKDF2
- Role-based access control

### Data Protection
- Environment variables for sensitive data
- Encrypted database connections
- HTTPS/TLS encryption in production
- Secure cookie handling

### API Security
- CORS configuration
- CSRF protection
- Rate limiting (recommended)
- Input validation and sanitization
- SQL injection prevention (Django ORM)
- XSS protection

### Infrastructure
- Docker container isolation
- Nginx reverse proxy
- SSL/TLS certificates (Let's Encrypt)
- Firewall configuration
- Regular security updates

---

## 🔐 Best Practices for Users

### Environment Variables
Never commit `.env` files to version control:

```bash
# ❌ Bad
git add .env

# ✅ Good
# Add .env to .gitignore
echo ".env" >> .gitignore
```

### API Keys
- Rotate API keys regularly
- Use separate keys for development and production
- Never hardcode API keys in source code
- Use environment variables or secret management

### Database
- Use strong passwords
- Enable SSL connections
- Regular backups
- Limit database access

### Docker
- Use official base images
- Keep images updated
- Scan for vulnerabilities
- Don't run containers as root

---

## 🔍 Security Checklist

### Before Deployment

- [ ] All environment variables configured
- [ ] SSL/TLS certificates installed
- [ ] Firewall rules configured
- [ ] Database password changed from default
- [ ] Debug mode disabled in production
- [ ] CORS origins properly configured
- [ ] API rate limiting enabled
- [ ] Security headers configured
- [ ] Regular backups scheduled
- [ ] Monitoring and logging enabled

### Regular Maintenance

- [ ] Update dependencies monthly
- [ ] Review access logs weekly
- [ ] Rotate API keys quarterly
- [ ] Security audit annually
- [ ] Backup testing monthly

---

## 🚫 Known Security Considerations

### Third-Party Services

This project uses:
- **OpenAI API**: Ensure API key security
- **ElevenLabs API**: Protect voice cloning access
- **AWS S3**: Configure bucket policies properly

### User-Generated Content

- Story content is user-generated
- Implement content moderation
- Report system for inappropriate content
- Admin review process

---

## 📋 Security Updates

Security updates will be announced in:
- [CHANGELOG.md](./CHANGELOG.md)
- GitHub Security Advisories
- Release notes

---

## 🔗 Resources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Django Security](https://docs.djangoproject.com/en/stable/topics/security/)
- [FastAPI Security](https://fastapi.tiangolo.com/tutorial/security/)
- [React Security](https://react.dev/learn/security)

---

## 📞 Contact

For security concerns:
- **Email**: mehedi259@gmail.com
- **GitHub**: [@Mehedi259](https://github.com/Mehedi259)

---

## 🙏 Acknowledgments

We appreciate responsible disclosure and will acknowledge security researchers who help improve our security.

---

**Last Updated**: January 23, 2025
