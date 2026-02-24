# Редизайн под цвета логотипа БАМБУК

## Контекст
Замена фиолетовой схемы (#6C63FF) на изумрудную палитру "БАМБУК Агентство Роста".
Логотип: `site/public/logo.png`. Требование: текст контрастен к фону.

---

## Цветовая палитра (доработанная)

| Роль | Значение | Контраст | Обоснование |
|---|---|---|---|
| **`primary`** (фон кнопок) | `#1a7a3c` | белый текст: **5.4:1** ✓ | Глубокий изумруд — vivid, не плоский |
| **`primary-light`** (текст/иконки) | `#4ade80` | на bg: **10.8:1** ✓ | Tailwind green-400 — чистый, современный |
| **`background-dark`** | `#060e08` | — | Зелёный оттенок: фон «живой», не нейтральный |
| **`card-dark`** (все страницы) | `#0d1c10` | — | Единый, чётко отличим от фона (+2× разрыв) |
| Skill tag BG | `#0d1c10` | — | Совпадает с карточками — система единая |
| Footer BG | `#040908` | — | Чуть темнее фона |
| Текст body/заголовки | `text-white` / `text-slate-100` | ~21:1 ✓ | без изменений |
| Вторичный текст | `text-slate-400` | ~4.5:1 ✓ | без изменений |

> **Почему два изумруда**: `#1a7a3c` — глубокий, хорош как фон кнопки с белым текстом.
> `#4ade80` — яркий, современный, для текстовых акцентов и иконок на тёмном фоне.
> **Оба принадлежат одной семье** (hue ~145°, изумруд). Старый план смешивал лесной зелёный (#2d7a1f, hue 110°) с лаймом (#5cb830, hue 95°) — разные характеры.

> **Фон стал зелёным**: `#060e08` вместо нейтрального `#0a0a0f`. Разница неуловима сознательно, но сайт перестаёт быть «чёрным с зелёными точками» — он становится «изумрудным миром».

> **Карточки единые**: убираем два разных значения card-dark (#111a11 / #131e13) — одно значение `#0d1c10` для всех страниц. Разрыв с фоном стал вдвое заметнее.

---

## Изменения по файлам

### 1. `site/public/index.html`

**Tailwind config:**
```js
"primary":          "#1a7a3c",
"primary-light":    "#4ade80",
"background-dark":  "#060e08",
"card-dark":        "#0d1c10"
```

**CSS `<style>`:**
- `body`: `bg-[#0a0a0f]` → `bg-[#060e08]`
- `.hero-glow` gradient: `rgba(108, 99, 255, 0.08)` → `rgba(74, 222, 128, 0.07)`
- `.skill-tag`: `bg-[#161622]` → `bg-[#0d1c10]`

**HTML — элемент за элементом:**

| Элемент | Что меняем |
|---|---|
| Логотип в nav | `<div bg-primary><span>code</span></div> + "Имя Фамилия"` → `<img src="/logo.png" alt="БАМБУК" class="h-10 w-auto">` |
| Логотип в footer | аналогично nav |
| Footer BG | `bg-[#07070a]` → `bg-[#040908]` |
| Статус-бейдж текст | `text-primary` → `text-primary-light` |
| Статус-бейдж фон/рамка | `bg-primary/10 border-primary/20` — auto-update |
| Статус-бейдж точка | `bg-primary` — остаётся |
| Кнопка «Мои проекты» | `shadow-primary/20` → `shadow-[0_4px_20px_rgba(74,222,128,0.2)]` + auto-update цвет |
| Кнопка «Связаться» | `border-primary/30 hover:border-primary text-white` — auto-update |
| Заголовок h1: `[Имя]` | `text-primary italic` → `text-primary-light italic` |
| Иконки skill-tag | `text-primary` → `text-primary-light` |
| Hover рамка skill-tag | `hover:border-primary/50` — auto-update |
| Тех-метки карточек | `text-primary text-[10px]` → `text-primary-light text-[10px]` |
| Заголовок проекта (hover) | `text-primary` → `text-primary-light` |
| Иконка стрелки «просмотр» | `text-primary` → `text-primary-light` |
| CTA «email» кнопка | `shadow-primary/20` → `shadow-[0_4px_20px_rgba(74,222,128,0.2)]` + auto-update цвет |
| Hover рамки карточек | `hover:border-primary/30` — auto-update |
| Соцсети в footer | `hover:text-primary` → `hover:text-primary-light` |

---

### 2. `site/public/about.html`

**CSS `<style>` / `:root`:**
```css
--accent-color: #4ade80;   /* было #6C63FF */
```
```css
selection:bg-[#6C63FF]/30  →  selection:bg-[#1a7a3c]/30
```

**HTML — элемент за элементом:**

| Элемент | Что меняем |
|---|---|
| Логотип в nav | `<img src="/logo.png" alt="БАМБУК" class="h-10 w-auto">` |
| Логотип в footer | аналогично |
| `bg-[#0a0a0f]` / `bg-[#07070a]` (body/footer) | → `bg-[#060e08]` / `bg-[#040908]` |
| Card BG (если указан явно) | → `bg-[#0d1c10]` |
| Аватар glow | `bg-accent` — auto-update через CSS var |
| Активная ссылка nav | `text-accent` — auto-update |
| Цифры статистики | `text-accent text-3xl font-bold` — auto-update |
| Иконки секций навыков | `text-accent text-xl` — auto-update |
| Точки таймлайна (активные) | `bg-accent` — auto-update |
| Линия таймлайна | `linear-gradient(accent, transparent)` — auto-update |
| Компания в таймлайне | `text-accent font-medium` — auto-update |
| Иконка edu при ховере | `group-hover:text-accent` — auto-update |
| Рамка edu card при ховере | `hover:border-accent/30` — auto-update |
| Соцсети footer | `hover:text-accent` — auto-update |

---

### 3. `site/public/projects.html`

**Tailwind config:**
```js
"primary":        "#1a7a3c",
"primary-light":  "#4ade80",
"card-dark":      "#0d1c10",   // было #16161e → унифицировано
```

**CSS `<style>`:**
- `body` bg: → `bg-[#060e08]`
- `.active-link::after`: `background-color: #6961ff` → `background-color: #1a7a3c`

**HTML — элемент за элементом:**

| Элемент | Что меняем |
|---|---|
| Логотип в nav | `<img src="/logo.png" alt="БАМБУК" class="h-10 w-auto">` |
| Logo box | `bg-primary shadow-primary/20` — auto-update |
| Заголовок страницы «проекты» | `text-primary` → `text-primary-light` |
| Активный filter кнопка | `bg-primary text-white` — auto-update |
| Неактивные фильтры hover текст | `hover:text-primary` → `hover:text-primary-light` |
| Hover заголовок карточки | `group-hover:text-primary` → `group-hover:text-primary-light` |
| Кнопка «Demo» | `bg-primary text-white hover:brightness-110` + `shadow-[0_4px_20px_rgba(74,222,128,0.2)]` |
| Hover рамка карточки | `hover:border-primary/50` — auto-update |
| `selection:bg-primary/30` | → `selection:bg-[#1a7a3c]/30` |
| Nav link active | `text-primary` → `text-primary-light` |
| CTA кнопка nav «Связаться» | `bg-primary text-white` + `shadow-[0_4px_20px_rgba(74,222,128,0.2)]` |
| Соцсети footer hover | `hover:bg-primary hover:border-primary hover:text-white` — auto-update |
| Footer BG (если явный) | → `bg-[#040908]` |

---

### 4. `site/public/contact.html`

**Tailwind config:**
```js
primary:          "#1a7a3c",
"primary-light":  "#4ade80",
```

**CSS `<style>` / `:root`:**
```css
--accent: #4ade80;   /* было #6C63FF */
```
```css
.glass-nav { border-bottom: 1px solid rgba(74, 222, 128, 0.08); }  /* было rgba(108, 99, 255, 0.1) */
```

**HTML — элемент за элементом:**

| Элемент | Что меняем |
|---|---|
| Логотип в nav | `<img src="/logo.png" alt="БАМБУК" class="h-10 w-auto">` |
| `bg-[#0a0a0f]` body / footer | → `bg-[#060e08]` / `bg-[#040908]` |
| `selection:bg-primary/30` | → `selection:bg-[#1a7a3c]/30` |
| Активный nav link | `text-primary` → `text-primary-light` |
| Подчёркивание nav | `after:bg-primary` → `after:bg-primary-light` |
| Mobile active link | `text-primary` → `text-primary-light` |
| Mobile menu border | `border-primary/10` — auto-update |
| Заголовок h1: «мной» | `text-primary` → `text-primary-light` |
| Кнопка «Отправить» | `bg-primary text-white` + `shadow-[0_4px_20px_rgba(74,222,128,0.2)]` |
| Статус-бейдж контейнер | `bg-primary/10 border-primary/20` — auto-update |
| Пульс-точка | `bg-green-500` — уже зелёная, без изменений ✓ |
| Иконки контакт-карточек | `text-primary` → `text-primary-light` |
| Ховер иконок (фон) | `group-hover:bg-primary group-hover:text-white` — auto-update |
| Стрелка в карточке | `group-hover:text-primary` → `group-hover:text-primary-light` |
| Input focus рамка/ring | `focus:border-primary focus:ring-primary` — auto-update |
| Соцсети hover | `hover:text-primary hover:border-primary` → `hover:text-primary-light hover:border-primary-light` |
| Год в footer | `text-primary` → `text-primary-light` |

---

## Что НЕ меняется
- Шрифты Inter, структура страниц, сетки
- `text-white`, `text-slate-100/400/500` — уже контрастны ✓
- `bg-green-500` в contact.html pulse-dot — уже зелёный ✓
- Анимации, адаптивность, glassmorphism-эффекты
- Все transition и hover-анимации

---

## Контраст — итоговая сводка

| Пара текст / фон | Контраст | Статус |
|---|---|---|
| `text-white` на `#060e08` | 21:1 | ✅ Отлично |
| `text-slate-400` на `#060e08` | ~4.5:1 | ✅ WCAG AA |
| `#4ade80` (primary-light) на `#060e08` | **10.8:1** | ✅ WCAG AAA |
| `text-white` на `#1a7a3c` (кнопка) | **5.4:1** | ✅ WCAG AA |
| `text-white` на `#0d1c10` (карточки) | ~20:1 | ✅ Отлично |

---

## Сравнение: старая vs доработанная палитра

| Элемент | Старый план | Доработанный план | Улучшение |
|---|---|---|---|
| Фон | `#0a0a0f` нейтральный | `#060e08` изумрудный | Бренд-иммерсия |
| Карточки | `#111a11` / `#131e13` (два значения) | `#0d1c10` единый | Консистентность + 2× разрыв |
| primary | `#2d7a1f` лесной (hue 110°) | `#1a7a3c` изумруд (hue 145°) | Семья с primary-light |
| primary-light | `#5cb830` лайм (hue 95°) | `#4ade80` зелёный (hue 145°) | Когерентная пара |
| Кнопки shadow | `shadow-primary/20` слабый | `rgba(74,222,128,0.2)` явный | Свечение кнопок |
| Glow hero | `rgba(45,122,31,0.08)` | `rgba(74,222,128,0.07)` | Яркость glow-цвета |

---

## Проверка результата
1. Открыть `site/public/index.html` — кнопки светятся изумрудным glow, иконки и бейдж зелёные
2. Фон сайта — не нейтрально-чёрный, а чуть зеленоватый (сравнить с листом бумаги)
3. Карточки чётко отличаются от фона — нет ощущения «плавающих объектов»
4. Nav на всех 4 страницах — логотип `/logo.png` корректно отображается
5. `about.html` — тайм-лайн, точки, статистика изумрудные
6. `projects.html` — фильтр, hover заголовков, кнопки Demo светятся
7. `contact.html` — форма, иконки, кнопка «Отправить» с glow
8. Весь текст читаем — нет слияния с фоном
