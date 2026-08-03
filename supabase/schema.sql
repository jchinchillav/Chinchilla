-- ============================================================
-- THE ROOKIE — MID-WILSHIRE QUIZ ACADEMY
-- Supabase schema (cloud mode).
--
-- ALREADY APPLIED to the project configured in index.html.
-- Kept here so the setup is reproducible on any other project:
-- run this in the SQL editor, then paste that project's URL and
-- publishable key into CONFIG at the top of index.html.
--
-- Everything is prefixed rookie_quiz_ so it can live safely
-- inside a project that already hosts other apps.
-- ============================================================

create table if not exists public.rookie_quiz_progress (
  user_id      uuid primary key references auth.users (id) on delete cascade,
  display_name text not null default 'Officer',
  data         jsonb not null default '{}'::jsonb,
  xp           integer not null default 0,
  rank_title   text not null default 'Boot',
  updated_at   timestamptz not null default now()
);

alter table public.rookie_quiz_progress enable row level security;

-- Each player can only read and write their OWN row.
drop policy if exists "rookie_quiz own row select" on public.rookie_quiz_progress;
drop policy if exists "rookie_quiz own row insert" on public.rookie_quiz_progress;
drop policy if exists "rookie_quiz own row update" on public.rookie_quiz_progress;

create policy "rookie_quiz own row select"
  on public.rookie_quiz_progress for select
  to authenticated
  using (auth.uid() = user_id);

create policy "rookie_quiz own row insert"
  on public.rookie_quiz_progress for insert
  to authenticated
  with check (auth.uid() = user_id);

create policy "rookie_quiz own row update"
  on public.rookie_quiz_progress for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Global leaderboard. A function (not a view) so it can read across
-- players while exposing ONLY name, rank and XP — never emails and
-- never anything belonging to other apps in the same project.
drop function if exists public.rookie_quiz_leaderboard();

create function public.rookie_quiz_leaderboard()
returns table (user_id uuid, display_name text, xp integer, rank_title text)
language sql
stable
security definer
set search_path = ''
as $$
  select p.user_id, p.display_name, p.xp, p.rank_title
  from public.rookie_quiz_progress p
  order by p.xp desc, p.updated_at asc
  limit 50
$$;

revoke all on function public.rookie_quiz_leaderboard() from public, anon;
grant execute on function public.rookie_quiz_leaderboard() to authenticated;
