# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A static portfolio website built with vanilla HTML + Tailwind CSS (CDN). No build step, no bundler, no package manager. Pages are served directly from `site/public/`.

## Deployment

- **Vercel** auto-deploys on push to `main`
- Output directory: `site/public/` (configured in `vercel.json`)
- Clean URLs enabled (`/about` not `/about.html`)
- Local preview: open files directly in browser, or `npx serve site/public`

## File Structure

- `site/public/` — production HTML pages (`index.html`, `about.html`, `projects.html`, `contact.html`) + `logo.png`
- `queue/` — Stitch MCP staging area (generated pages land here before integration)
- `DESIGN.md` — canonical design system (colors, typography, component patterns)
- `SITE.md` — project vision, Stitch Project ID, sitemap, roadmap
- `REDESIGN.md` — step-by-step notes on the emerald redesign
- `next-prompt.md` — baton file for the stitch-loop autonomous build skill

## Design System

**Palette (Emerald / BAMBUK brand)**:
- Background: `#060e08`, Cards: `#0d1c10`, Footer: `#040908`
- Primary: `#1a7a3c` (buttons), Accent: `#4ade80` (text highlights, icons)
- Text: `white` / `slate-100`, Secondary: `slate-400`

**Typography**: Inter (Google Fonts), weights 300–900
**Icons**: Material Symbols Outlined (Google CDN)
**Tailwind**: CDN only (`cdn.tailwindcss.com`) — no config file, no npm

**Page anatomy** (same across all pages):
- Fixed nav with frosted glass (`backdrop-blur`) + logo image (`logo.png`) + hamburger for mobile
- Page-specific content sections
- Footer with logo, copyright, social links (GitHub, LinkedIn, Telegram)

## Stitch MCP Workflow

New pages or redesigns are generated via Stitch MCP, then integrated manually:

1. Use `stitch-loop` skill (see `.claude/stitch-loop/SKILL.md`) or call Stitch directly
2. Generated HTML lands in `queue/` → copy to `site/public/`
3. Wire navigation links across all pages
4. Commit and push → Vercel deploys automatically

Stitch Project ID: `10511742379837625783` (see `stitch.json` for per-page screen IDs)

## Key Conventions

- All navigation and content is in **Russian** (user-facing text), commits in Russian
- No JavaScript frameworks — interactivity via vanilla JS only (e.g., mobile menu toggle)
- `max-w-7xl mx-auto px-6` is the standard container
- Hover effects use Tailwind `hover:` utilities + CSS `transition` classes
- Logo has no `alt` text (decorative, `alt=""`)
