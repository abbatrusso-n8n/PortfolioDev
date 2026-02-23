# DESIGN.md — Система дизайна портфолио

## Section 1: Overview
Современное тёмное портфолио Full-Stack разработчика. Минималистичный, профессиональный стиль.

## Section 2: Color Palette
- **Background**: `#0a0a0f` (основной фон)
- **Card Background**: `#12121a` (фон карточек)
- **Footer Background**: `#07070a`
- **Primary Accent**: `#6C63FF` (фиолетово-синий)
- **Text Primary**: `slate-100` (белый)
- **Text Secondary**: `slate-400` (серый)
- **Borders**: `white/5` (тонкие полупрозрачные)

## Section 3: Typography
- **Font Family**: Inter (Google Fonts), sans-serif
- **Weights**: 400, 500, 600, 700, 800, 900
- **Icons**: Material Symbols Outlined

## Section 4: Components
- **Buttons Primary**: `bg-primary text-white px-10 py-4 rounded-xl font-bold` + `shadow-xl shadow-primary/20`
- **Buttons Outline**: `border-2 border-primary/30 hover:border-primary text-white px-10 py-4 rounded-xl`
- **Cards**: `bg-card-dark border border-white/5 rounded-3xl hover:border-primary/30 transition-all duration-500`
- **Skill Tags**: `px-5 py-2.5 rounded-full bg-[#161622] border border-white/5 hover:border-primary/50`
- **Navigation**: `fixed top-0 z-50 border-b border-white/5 bg-[#0a0a0f]/80 backdrop-blur-md`
- **Section accent line**: `h-1.5 w-20 bg-primary rounded-full`

## Section 5: Layout
- **Container**: `max-w-7xl mx-auto px-6`
- **Nav height**: `h-20`
- **Grid**: `grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8`
- **Roundness**: `ROUND_EIGHT` (rounded-xl, rounded-3xl)

## Section 6: Design System Notes for Stitch Generation
```
DESIGN SYSTEM:
- Dark theme: background #0a0a0f, cards #12121a, footer #07070a
- Primary accent color: #6C63FF (violet-blue)
- Font: Inter (Google Fonts), weights 400-900
- Icons: Material Symbols Outlined
- Navigation: fixed, frosted glass (backdrop-blur), border-white/5
- Buttons: primary filled #6C63FF with shadow, outline with primary border
- Cards: dark bg #12121a, white/5 borders, hover:border-primary/30, rounded-3xl
- Text: slate-100 primary, slate-400 secondary
- Borders: subtle white/5 throughout
- Tailwind CSS via CDN with darkMode: "class"
- All labels and content in Russian language
- Container max-w-7xl mx-auto px-6
```
