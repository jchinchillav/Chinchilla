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

## 👤 Accounts & progress

The game ships in **local mode**: accounts (email + password, hashed) and
progress are stored in the browser's `localStorage`. You can move progress
between computers with **Export / Import progress** (Help screen).

### ☁️ Switching to cloud mode (Supabase) — already wired

1. Create (or pick) a Supabase project.
2. Run [`supabase/schema.sql`](supabase/schema.sql) in its SQL editor.
3. In `index.html`, fill in the two values at the top of the script:

```js
const CONFIG = {
  SUPABASE_URL: "https://YOURPROJECT.supabase.co",
  SUPABASE_ANON_KEY: "YOUR-ANON-KEY",
  ...
```

That's it. Accounts become real Supabase Auth users (email + password),
progress syncs across devices, and the leaderboard becomes global.

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
