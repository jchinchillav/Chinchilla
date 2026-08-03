-- ============================================================
-- THE ROOKIE — MID-WILSHIRE QUIZ ACADEMY
-- Supabase schema (cloud mode). Run this ONCE in the SQL editor
-- of the Supabase project you want to use, then paste the
-- project's URL + anon/publishable key into CONFIG at the top
-- of index.html. That's the whole switch.
-- Tables are prefixed rookie_quiz_ so they can live safely
-- inside an existing project.
-- ============================================================

create table if not exists public.rookie_quiz_progress (
  user_id      uuid primary key references auth.users (id) on delete cascade,
  display_name text not null default 'Officer',
  data         jsonb not null default '{}'::jsonb,
  xp           integer not null default 0,
  updated_at   timestamptz not null default now()
);

alter table public.rookie_quiz_progress enable row level security;

drop policy if exists "rookie_quiz own row select" on public.rookie_quiz_progress;
drop policy if exists "rookie_quiz own row insert" on public.rookie_quiz_progress;
drop policy if exists "rookie_quiz own row update" on public.rookie_quiz_progress;

create policy "rookie_quiz own row select"
  on public.rookie_quiz_progress for select
  using (auth.uid() = user_id);

create policy "rookie_quiz own row insert"
  on public.rookie_quiz_progress for insert
  with check (auth.uid() = user_id);

create policy "rookie_quiz own row update"
  on public.rookie_quiz_progress for update
  using (auth.uid() = user_id);

-- Leaderboard: every signed-in player can see names + XP (nothing else).
create or replace view public.rookie_quiz_leaderboard as
  select user_id, display_name, xp
  from public.rookie_quiz_progress
  order by xp desc;

revoke all   on public.rookie_quiz_leaderboard from anon;
grant  select on public.rookie_quiz_leaderboard to authenticated;
