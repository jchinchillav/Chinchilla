# 🚔 The Rookie — Mid-Wilshire Quiz Academy

An unofficial, fan-made trivia game for the ABC series **The Rookie**.
Register with an email + password, then climb the LAPD career ladder — from
**Boot** all the way to **Director of The Rookie** — through 9 levels of
increasing difficulty, 4 bonus rounds, quote battles, name-decoding evidence
cards and 100+ behind-the-scenes fun facts (verified through Season 8).

Everything lives in **one file**: `index.html`. No build step, no server
required.

## ▶️ Play it

- **Online (live):** https://jchinchillav.github.io/Chinchilla/ — deployed
  automatically by GitHub Actions (`.github/workflows/pages.yml`) on every push
  to the default branch.
- **Any computer, offline:** just open `index.html` in a browser
  (double-click works). Netlify Drop or any static host works too.

## 🎮 How the game works

| # | Rank / Level | Focus |
|---|---|---|
| 1 | Rookie (Boot) | Show basics |
| 2 | Officer II | Characters & relationships |
| 3 | Field Training Officer | “Who said it?” quotes |
| 4 | Detective | Storylines across all seasons |
| 5 | Sergeant | Quote combat: duos & complete-the-line |
| 6 | Lieutenant | Deep cuts & undercover ops |
| 7 | Captain | True-fan territory |
| 8 | Chief of Police | Expert, episode-level details |
| 9 | Director of The Rookie | Behind-the-scenes & production trivia |

- Score **70%+** on a level to get promoted; ⭐⭐⭐ for a perfect run.
- **Bonus rounds** (optional, double XP, some timed) unlock along the way:
  *Code 3 Rapid Fire*, *Undercover Round*, *Evidence Locker* (type-the-answer
  name ciphers) and the brutal *Showrunner's Cut*.
- Every answer reveals a 📁 **case-file fun fact**.
- 🏆 **Precinct roster** ranks all registered players by XP.

## 👤 Accounts & progress — ☁️ cloud mode is ON

Accounts are real Supabase Auth users (email + password). Progress syncs
across every device, and the 🏆 **Precinct Roster** is a global leaderboard
shared by all players.

How it stays safe:

- Players can read and write **only their own** progress row (row-level
  security).
- The leaderboard is a `SECURITY DEFINER` function that returns **only**
  display name, rank and XP — never emails, never anything else in the
  database.
- The key in `CONFIG` is a *publishable* key. It is meant to be public; all
  real access is decided by the policies above.

If the backend is unreachable (offline, blocked network), the game does **not**
break: it falls back to offline mode, says so on the sign-in screen, and keeps
progress in that browser.

### Pointing it at a different Supabase project

1. Run [`supabase/schema.sql`](supabase/schema.sql) in the new project's SQL editor.
2. Replace the two values at the top of the script in `index.html`:

```js
const CONFIG = {
  SUPABASE_URL: "https://YOURPROJECT.supabase.co",
  SUPABASE_ANON_KEY: "YOUR-PUBLISHABLE-KEY",
  ...
```

Leave both empty to run the game fully offline (accounts stored per browser).

## 🖼️ Add your own screenshots

Copyright means the game can't ship with real frames from the show, but it's
ready for yours: put image files next to `index.html` (e.g. an `images/`
folder) and register them in the `USER_IMAGES` array at the top of the script:

```js
const USER_IMAGES = [
  { kind:"scene", src:"images/barrel.jpg", season:2, episode:"2x11 'Day of Death'",
    note:"Tim digs Lucy out with his bare hands." },
  { kind:"who", src:"images/tim.jpg", answer:"Tim Bradford",
    decoys:["John Nolan","Wesley Evers","Aaron Thorsen"] },
];
```

- `kind:"scene"` → asks **which season** the screenshot is from.
- `kind:"who"` → asks **who is pictured** (multiple choice with your decoys).

They appear automatically in the **Evidence Locker** bonus round.

## ✍️ Add more quotes / questions

- Quick quotes: add entries to `EXTRA_QUOTES` (they rotate into level replays).
- Full questions: add objects to any level in `LEVELS` or `BONUS`
  (`t:"mc" | "quote" | "free"` — see the comments in the file).

## ⚖️ Disclaimer

Unofficial fan project for personal use. *The Rookie* and all related
characters and quotes are property of their respective owners (ABC /
Lionsgate / eOne / Alexi Hawley). No affiliation, no copyright infringement
intended.

---

## 🐭 Chinchilla Launch Room (`portal/`)

Portal de seguimiento del lanzamiento de la marca Chinchilla: plan de 10 semanas
(7 sep – 15 nov 2026), proveedores de muestras (blanks premium, OEM, telas,
transfers de silicona 3D, decoradores en Vancouver), proceso del logo con relieve,
roster de testers, presupuesto de la fase de muestras, economía del piloto y
pipeline de inversionistas.

- `portal/index.html`: un solo archivo, sin build. Abierto como Artifact en
  claude.ai guarda el estado en la base de datos del artifact (sincronizado entre
  dispositivos); abierto desde GitHub Pages o en local guarda en el navegador.
- `portal/research/logo-3d-silicona.md`: investigación del proceso de logo 3D
  (métodos, proveedores, planchas, parámetros, fuentes).
- `portal/research/proveedores.md`: investigación de proveedores de blanks, OEM y
  telas con MOQ bajo y envío a Canadá.
