# Contributing to WonderTales Hub

Thank you for your interest in contributing to WonderTales Hub! 🎉

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Coding Standards](#coding-standards)
- [Commit Guidelines](#commit-guidelines)
- [Pull Request Process](#pull-request-process)
- [Testing](#testing)
- [Documentation](#documentation)

---

## 📜 Code of Conduct

- Be respectful and inclusive
- Welcome newcomers and help them learn
- Focus on constructive feedback
- Respect differing viewpoints and experiences

---

## 🚀 Getting Started

### 1. Fork the Repository

Click the "Fork" button at the top right of the repository page.

### 2. Clone Your Fork

```bash
git clone https://github.com/YOUR_USERNAME/WonderTales.git
cd WonderTales
```

### 3. Add Upstream Remote

```bash
git remote add upstream https://github.com/Mehedi259/WonderTales.git
```

### 4. Create a Branch

```bash
git checkout -b feature/your-feature-name
```

---

## 🔄 Development Workflow

### Keep Your Fork Updated

```bash
git fetch upstream
git checkout main
git merge upstream/main
```

### Make Your Changes

1. Write clean, readable code
2. Follow existing code style
3. Add tests for new features
4. Update documentation

### Test Your Changes

```bash
# Backend tests
cd backend
python manage.py test

# AI service tests
cd ai
pytest

# Frontend tests
cd landingpage
npm run test
```

---

## 💻 Coding Standards

### Python (Backend & AI)

- Follow PEP 8 style guide
- Use type hints where appropriate
- Maximum line length: 100 characters
- Use meaningful variable names

```python
# Good
def generate_story(child_profile: dict, theme: str) -> dict:
    """Generate a personalized story."""
    pass

# Bad
def gen(cp, t):
    pass
```

### TypeScript/React (Frontend)

- Use functional components with hooks
- Follow React best practices
- Use TypeScript for type safety
- Use meaningful component names

```typescript
// Good
interface StoryCardProps {
  story: Story;
  onPlay: () => void;
}

export const StoryCard: React.FC<StoryCardProps> = ({ story, onPlay }) => {
  return <div>{story.title}</div>;
};

// Bad
export const Card = (props: any) => {
  return <div>{props.s.t}</div>;
};
```

### General Guidelines

- Write self-documenting code
- Add comments for complex logic
- Keep functions small and focused
- Avoid code duplication (DRY principle)
- Handle errors gracefully

---

## 📝 Commit Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/) specification.

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks
- `perf`: Performance improvements
- `ci`: CI/CD changes

### Examples

```bash
feat(story): add voice cloning support

Implement ElevenLabs voice cloning API integration
for personalized family narration.

Closes #123

---

fix(auth): resolve token refresh issue

Fix JWT token refresh failing after 24 hours.
Added proper error handling and retry logic.

---

docs(readme): update installation instructions

Add Docker setup steps and environment variable
configuration examples.
```

### Commit Message Rules

- Use present tense ("add feature" not "added feature")
- Use imperative mood ("move cursor to..." not "moves cursor to...")
- First line should be 50 characters or less
- Reference issues and pull requests when relevant

---

## 🔀 Pull Request Process

### 1. Update Your Branch

```bash
git fetch upstream
git rebase upstream/main
```

### 2. Push Your Changes

```bash
git push origin feature/your-feature-name
```

### 3. Create Pull Request

- Go to the original repository
- Click "New Pull Request"
- Select your fork and branch
- Fill in the PR template

### PR Title Format

Follow the same format as commit messages:

```
feat(story): add voice cloning support
```

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Tests pass locally
- [ ] Added new tests
- [ ] Manual testing completed

## Screenshots (if applicable)
Add screenshots here

## Related Issues
Closes #123
```

### PR Review Process

1. Automated checks must pass (CI/CD)
2. At least one maintainer approval required
3. Address review comments
4. Keep PR focused and small
5. Squash commits if requested

---

## 🧪 Testing

### Backend Tests

```bash
cd backend
python manage.py test
python manage.py test apps.story  # Specific app
```

### AI Service Tests

```bash
cd ai
pytest
pytest tests/test_story_service.py  # Specific test
```

### Frontend Tests

```bash
cd landingpage
npm run test
npm run test:coverage
```

### Writing Tests

- Write tests for new features
- Maintain test coverage above 80%
- Test edge cases and error scenarios
- Use descriptive test names

```python
# Good test name
def test_story_generation_with_invalid_age_returns_error():
    pass

# Bad test name
def test_story():
    pass
```

---

## 📚 Documentation

### When to Update Documentation

- Adding new features
- Changing API endpoints
- Modifying configuration
- Updating dependencies

### Documentation Locations

- `README.md` - Project overview
- `backend/README.md` - Backend API docs
- `ai/README.md` - AI service docs
- `landingpage/README.md` - Frontend docs
- `infra/README.md` - Deployment docs
- Code comments - Complex logic

### Documentation Style

- Use clear, concise language
- Include code examples
- Add screenshots for UI changes
- Keep it up to date

---

## 🐛 Reporting Bugs

### Before Submitting

- Check existing issues
- Test on latest version
- Gather relevant information

### Bug Report Template

```markdown
**Description**
Clear description of the bug

**Steps to Reproduce**
1. Go to '...'
2. Click on '...'
3. See error

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Environment**
- OS: [e.g., Ubuntu 22.04]
- Browser: [e.g., Chrome 120]
- Version: [e.g., 1.0.0]

**Screenshots**
If applicable

**Additional Context**
Any other relevant information
```

---

## 💡 Feature Requests

### Feature Request Template

```markdown
**Problem Statement**
What problem does this solve?

**Proposed Solution**
How should it work?

**Alternatives Considered**
Other approaches you've thought about

**Additional Context**
Mockups, examples, etc.
```

---

## 🏆 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

---

## 📞 Getting Help

- **GitHub Issues**: For bugs and features
- **Discussions**: For questions and ideas
- **Email**: mehedi259@gmail.com

---

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to WonderTales Hub! 🌟**
