# 🎨 WonderTales Landing Page

React + TypeScript + Vite frontend for WonderTales Hub - A beautiful, responsive interface for AI-powered storytelling.

---

## ✨ Features

- 🎯 **Modern UI/UX** - Clean and intuitive interface
- 📱 **Fully Responsive** - Works on all devices
- 🎨 **Tailwind CSS** - Utility-first styling
- ⚡ **Vite** - Lightning-fast HMR
- 🔒 **Authentication** - JWT-based auth flow
- 🎙️ **Story Player** - Audio playback with word highlighting
- 👶 **Profile Management** - Manage children profiles
- 🌙 **Theme Support** - Multiple story themes
- 🔍 **Search & Filter** - Find stories easily
- 📊 **Dashboard** - User analytics and history

---

## 🛠️ Technology Stack

- **Framework**: React 18
- **Language**: TypeScript
- **Build Tool**: Vite 6
- **Styling**: Tailwind CSS
- **HTTP Client**: Axios
- **Routing**: React Router v6
- **State Management**: React Context API
- **Icons**: Heroicons / Lucide React
- **Forms**: React Hook Form
- **Validation**: Zod

---

## 📁 Project Structure

```
landingpage/
├── public/              # Static assets
├── src/
│   ├── assets/         # Images, fonts, etc.
│   ├── components/     # Reusable components
│   │   ├── common/    # Buttons, inputs, etc.
│   │   ├── layout/    # Header, footer, sidebar
│   │   └── story/     # Story-related components
│   ├── pages/         # Page components
│   │   ├── Home.tsx
│   │   ├── Login.tsx
│   │   ├── Dashboard.tsx
│   │   └── StoryPlayer.tsx
│   ├── contexts/      # React contexts
│   ├── hooks/         # Custom hooks
│   ├── services/      # API services
│   ├── types/         # TypeScript types
│   ├── utils/         # Helper functions
│   ├── App.tsx
│   └── main.tsx
├── index.html
├── package.json
├── tsconfig.json
├── vite.config.ts
└── tailwind.config.js
```

---

## 🚀 Getting Started

### Prerequisites
- Node.js 18+
- npm or yarn

### Installation

1. **Install dependencies**
```bash
npm install
```

2. **Configure environment**
```bash
cp .env.example .env
```

Edit `.env`:
```env
VITE_API_URL=http://localhost:8001
VITE_AI_SERVICE_URL=http://localhost:8000
```

3. **Run development server**
```bash
npm run dev
```

4. **Open browser**
```
http://localhost:5173
```

---

## 📦 Available Scripts

```bash
# Development server with HMR
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview

# Lint code
npm run lint

# Type check
npm run type-check

# Format code
npm run format
```

---

## 🎨 Styling

### Tailwind CSS

This project uses Tailwind CSS for styling:

```tsx
// Example component
export const Button = ({ children }) => (
  <button className="px-4 py-2 bg-blue-500 text-white rounded-lg hover:bg-blue-600 transition">
    {children}
  </button>
);
```

### Custom Theme

Customize colors in `tailwind.config.js`:

```js
module.exports = {
  theme: {
    extend: {
      colors: {
        primary: '#3B82F6',
        secondary: '#8B5CF6',
      }
    }
  }
}
```

---

## 🔌 API Integration

### Axios Configuration

```typescript
// src/services/api.ts
import axios from 'axios';

const api = axios.create({
  baseURL: import.meta.env.VITE_API_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Add auth token to requests
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export default api;
```

### Example API Call

```typescript
// src/services/storyService.ts
import api from './api';

export const getStories = async () => {
  const response = await api.get('/api/stories/');
  return response.data;
};

export const createStory = async (data: StoryData) => {
  const response = await api.post('/api/stories/', data);
  return response.data;
};
```

---

## 🔐 Authentication Flow

1. User logs in → Receive JWT token
2. Store token in localStorage
3. Add token to all API requests
4. Redirect to dashboard
5. Auto-refresh token before expiry

```typescript
// src/contexts/AuthContext.tsx
export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  
  const login = async (email, password) => {
    const { token, user } = await authService.login(email, password);
    localStorage.setItem('token', token);
    setUser(user);
  };
  
  return (
    <AuthContext.Provider value={{ user, login }}>
      {children}
    </AuthContext.Provider>
  );
};
```

---

## 🎵 Story Player Component

```typescript
// Audio player with word-level highlighting
export const StoryPlayer = ({ story }) => {
  const [currentWord, setCurrentWord] = useState(0);
  
  const handleTimeUpdate = (time) => {
    // Find current word based on timestamp
    const wordIndex = story.timestamps.findIndex(
      (ts) => ts.start <= time && ts.end >= time
    );
    setCurrentWord(wordIndex);
  };
  
  return (
    <div>
      <audio onTimeUpdate={handleTimeUpdate} />
      <div>
        {story.words.map((word, i) => (
          <span className={i === currentWord ? 'highlight' : ''}>
            {word}
          </span>
        ))}
      </div>
    </div>
  );
};
```

---

## 🐳 Docker Deployment

### Build Image
```bash
docker build -t wondertales-frontend .
```

### Run Container
```bash
docker run -d -p 5173:5173 wondertales-frontend
```

---

## 🏗️ Build for Production

```bash
# Build optimized bundle
npm run build

# Output in dist/ folder
# Deploy dist/ to your hosting service
```

### Build Optimization

- Code splitting
- Tree shaking
- Minification
- Asset optimization
- Lazy loading

---

## 🧪 Testing

```bash
# Run tests (if configured)
npm run test

# Run tests with coverage
npm run test:coverage
```

---

## 📱 Responsive Design

Breakpoints:
- `sm`: 640px
- `md`: 768px
- `lg`: 1024px
- `xl`: 1280px
- `2xl`: 1536px

```tsx
<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
  {/* Responsive grid */}
</div>
```

---

## ♿ Accessibility

- Semantic HTML
- ARIA labels
- Keyboard navigation
- Screen reader support
- Color contrast compliance

---

## 🔧 Environment Variables

```env
# API Endpoints
VITE_API_URL=http://localhost:8001
VITE_AI_SERVICE_URL=http://localhost:8000

# Feature Flags
VITE_ENABLE_ANALYTICS=true
VITE_ENABLE_VOICE_CLONING=true

# External Services
VITE_GOOGLE_ANALYTICS_ID=UA-XXXXXXXXX-X
```

---

## 🐛 Troubleshooting

### Port Already in Use
```bash
# Change port in vite.config.ts
export default defineConfig({
  server: {
    port: 3000
  }
})
```

### Build Errors
```bash
# Clear cache and rebuild
rm -rf node_modules dist
npm install
npm run build
```

---

## 📚 Resources

- [React Documentation](https://react.dev)
- [Vite Documentation](https://vitejs.dev)
- [Tailwind CSS](https://tailwindcss.com)
- [TypeScript](https://www.typescriptlang.org)

---

**Part of WonderTales Hub - Frontend Application**
