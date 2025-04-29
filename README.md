# Sophia Reynolds Portfolio Site*

*Note: this profile is AI-Generated for demo purposes only.

A modern, responsive portfolio/resume website built with Next.js and styled-components featuring a UX Designer's professional information.

![Portfolio Preview](/resume-2023-new/public/sophia_profile.jpg)

## 🚀 Project Overview

This portfolio site showcases Sophia Reynolds' professional experience, skills, and education in a visually appealing, responsive layout. The site includes:

- Hero section with profile image and introduction
- Experience timeline
- Skills showcase
- Education history
- Contact form with validation
- Social media links

## 📂 Project Structure

```
resume-2023-new/
├── public/               # Static assets
│   ├── sophia_profile.jpg  # Profile image
│   └── [other images]
├── src/
│   ├── app/              # Next.js App Router
│   │   ├── page.tsx      # Main portfolio page
│   │   └── layout.tsx    # Layout component
│   ├── styles/           # Styled components
│   │   ├── HomeStyles.ts # Main page styles
│   │   ├── SectionStyles.ts # Section component styles
│   │   ├── theme.ts      # Theme configuration
│   │   └── types.ts      # TypeScript type definitions
│   └── components/       # Reusable components (empty in current version)
├── package.json          # Dependencies and scripts
└── tsconfig.json         # TypeScript configuration
```

## 🧩 Key Components

### Main Page (`src/app/page.tsx`)
The main portfolio page contains the following sections:
- **Hero Section**: Introduction with profile image and background text animation
- **Experience Section**: Professional experience cards in a responsive grid
- **Skills Section**: Categorized skills displayed in cards
- **Education Section**: Academic background in a chronological list
- **Contact Section**: Contact form with validation and social links

### Styling System
- **Theme Configuration** (`src/styles/theme.ts`): Contains color palette, breakpoints
- **HomeStyles** (`src/styles/HomeStyles.ts`): Styled components for main layout elements
- **SectionStyles** (`src/styles/SectionStyles.ts`): Styled components for section-specific elements

## 🛠️ Technologies Used

- **Next.js 15**: React framework with App Router
- **React 19**: UI library
- **TypeScript**: Type-safe JavaScript
- **Styled Components**: CSS-in-JS styling
- **React Icons**: Icon library for social media icons
- **Framer Motion**: Animation library (configured but not implemented in current version)

## 🎨 Design System

The site features a clean, professional design with:

- **Color Palette**:
  - Primary: #DD4803 (Burnt orange)
  - Secondary: #54785F (Hooker's green)
  - Accent: #D4AF37 (Gold)
  - Background: #FEF9F4 (Light cream)
  - Text: #333333 (Dark gray)

- **Responsive Design**: Fully responsive across mobile, tablet, and desktop viewports

## 📝 Form Functionality

The contact form includes:
- Input validation
- State management with React hooks
- Success message confirmation
- Form reset after submission

## 🚀 Getting Started

### Prerequisites
- Node.js 18+ 
- npm or yarn

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/portfolio-site.git
cd portfolio-site
```

2. Install dependencies
```bash
npm install
# or
yarn install
```

3. Run the development server
```bash
npm run dev
# or
yarn dev
```

4. Open [http://localhost:3000](http://localhost:3000) in your browser

## 🏗️ Build and Deployment

```bash
npm run build
npm run start
```

## 📄 License

This project is open-source and available under the MIT License.

## 🙏 Acknowledgements

Created by Nelson Foster, Co-Founder and CEO, ProKofa Solutions. 