A modern React application built with Vite, TypeScript, and Tailwind CSS. This is a starter template for building fast, responsive web applications.
## 📋 Project Overview
This project is a **React + Vite + TypeScript + Tailwind CSS** starter template designed for rapid development and deployment. It includes all the essential tools and configurations needed to build modern web applications with a focus on performance and developer experience.
## 🏗️ Project Structure
```
.
├── src/
│   ├── App.tsx              # Main application component (entry point)
│   ├── main.tsx             # React DOM render entry
│   ├── index.css            # Global styles (Tailwind CSS)
│   └── utils/
│       └── cn.ts            # Utility function for className merging
├── index.html               # HTML template
├── package.json             # Project dependencies and scripts
├── tsconfig.json            # TypeScript configuration
├── vite.config.ts           # Vite configuration
└── README.md               # This file
```
## 🚀 Getting Started
### Prerequisites
- **Node.js** 18+ or higher
- **npm** or **yarn** package manager
### Installation
1. **Install dependencies:**
   ```bash
   npm install
   ```
2. **Start development server:**
   ```bash
   npm run dev
   ```
   The app will be available at `http://localhost:5173` (default Vite port)
3. **Build for production:**
   ```bash
   npm run build
   ```
   This creates an optimized build in the `dist/` directory
4. **Preview production build:**
   ```bash
   npm run preview
   ```
## 📦 Dependencies
### Production Dependencies
- **react** (19.2.6) - UI library for building user interfaces
- **react-dom** (19.2.6) - React rendering engine for web
- **tailwindcss** (4.1.17) - Utility-first CSS framework
- **clsx** (2.1.1) - Utility for conditionally joining classNames
- **tailwind-merge** (3.4.0) - Merge Tailwind CSS classes intelligently
### Dev Dependencies
- **@vitejs/plugin-react** (5.1.1) - Vite plugin for React with HMR
- **@tailwindcss/vite** (4.1.17) - Tailwind CSS Vite plugin
- **typescript** (5.9.3) - JavaScript with static typing
- **vite** (7.3.2) - Modern build tool and dev server
- **vite-plugin-singlefile** (2.3.0) - Bundle Vite projects into a single file
- **@types/react** & **@types/react-dom** - TypeScript type definitions
- **@types/node** (22.19.17) - Node.js type definitions
## 🛠️ Key Features
### ⚡ Vite
- Lightning-fast development server with Hot Module Replacement (HMR)
- Optimized production builds with code splitting
- Native ES modules support
### 🎨 Tailwind CSS
- Utility-first CSS framework for rapid UI development
- Pre-configured with Tailwind CSS v4
- Integrated via `@tailwindcss/vite` for optimal performance
### 📘 TypeScript
- Full TypeScript support for type-safe development
- Strict type checking enabled
### 🎯 Development Experience
- Hot Module Replacement (HMR) for instant updates during development
- ESLint-ready configuration (ready to add)
## 📝 Available Scripts
| Command | Description |
|---------|-------------|
| `npm run dev` | Start local development server with HMR |
| `npm run build` | Build optimized production bundle |
| `npm run preview` | Preview production build locally |
## 🎨 Styling
This project uses **Tailwind CSS** for styling. The main styles are configured in:
- `src/index.css` - Global styles (imports Tailwind directives)
- `vite.config.ts` - Tailwind configuration via `@tailwindcss/vite` plugin
### Utility Function
The `src/utils/cn.ts` file provides a utility function for safely merging Tailwind CSS classes:
```typescript
import { cn } from './utils/cn'
// Example usage:
className={cn('px-4 py-2', isActive && 'bg-blue-500')}
```
## 🔧 Configuration Files
### `vite.config.ts`
- Configures Vite build tool and dev server
- Includes React plugin for JSX support
- Tailwind CSS Vite plugin integration
### `tsconfig.json`
- TypeScript compiler options
- Path resolution and module configuration
- React JSX support
### `index.html`
- Main HTML template
- References the React mount point (`<div id="root">`)
- Loads the application via `/src/main.tsx`
## 🎯 Quick Start: Building Your App
To create your custom application:
1. **Modify `src/App.tsx`** - This is your main application component
2. **Add components** - Create new components in `src/components/`
3. **Style with Tailwind** - Use Tailwind CSS utility classes
4. **Run `npm run dev`** - See changes instantly with HMR
5. **Build when ready** - Run `npm run build` for production
### Example: Custom App Component
Replace the contents of `src/App.tsx` with your own React components:
```typescript
export default function App() {
  return (
    <div className="min-h-screen bg-gray-50 p-8">
      <h1 className="text-4xl font-bold text-slate-900">
        My Custom App
      </h1>
      {/* Add your components here */}
    </div>
  )
}
```
## 🚀 Deployment
### Building for Production
```bash
npm run build
```
This generates:
- Optimized JavaScript bundles
- Minified CSS
- Asset optimization
- Output directory: `dist/`
### Serving the Build
The production build can be served as a static site on any web server:
- Netlify
- Vercel
- GitHub Pages
- AWS S3
- Traditional web hosting
### Running Preview Locally
```bash
npm run preview
```
This serves the production build locally for testing before deployment.
## 🔗 Browser Support
- Modern browsers (Chrome, Firefox, Safari, Edge)
- ES2020+ JavaScript support required
- Mobile-friendly responsive design
## 📚 Additional Resources
- [React Documentation](https://react.dev)
- [Vite Documentation](https://vitejs.dev)
- [Tailwind CSS Documentation](https://tailwindcss.com)
- [TypeScript Documentation](https://www.typescriptlang.org)
## ⚙️ Customization
### Adding New Dependencies
Use npm to install packages:
```bash
npm install package-name
```
For dev dependencies:
```bash
npm install --save-dev package-name
```
### Modifying Tailwind Configuration
Edit `vite.config.ts` to customize Tailwind behavior if needed.
## 🐛 Troubleshooting
### Port Already in Use
If port 5173 is already in use, Vite will automatically try the next available port or you can specify:
```bash
npm run dev -- --port 3000
```
### Build Errors
1. Clear node_modules and reinstall:
   ```bash
   rm -rf node_modules package-lock.json
   npm install
   ```
2. Clear Vite cache:
   ```bash
   rm -rf .vite
   ```
### HMR Not Working
Ensure your firewall allows connections to the Vite dev server. If behind a proxy, check Vite documentation for HMR configuration.
## 📄 License
This project starter is open for use and modification.
## 🤝 Getting Help
When seeking help with this project, provide:
1. **Description** - What you're trying to build or fix
2. **Current State** - What's currently in `src/App.tsx`
3. **Desired State** - What you want to achieve
4. **Error Messages** - Any console or build errors
5. **Environment** - Node.js version, OS, browser
This information helps others provide accurate and efficient assistance!
---
**Happy coding! 🎉**