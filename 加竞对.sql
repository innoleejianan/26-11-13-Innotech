-- ============================================================
-- 加竞对专用。只跑这一段,永远不要重跑 schema.sql 的整段。
-- 账号名:纯账号名,不要 @,不要链接。重复跑不会报错。
-- ============================================================
insert into competitors (username, tracker, active) values
  ('新竞对1', 'IG', true),
  ('新竞对2', 'IG', true),
  ('新竞对3', 'IG', true)
on conflict do nothing;

-- ------------------------------------------------------------
-- 加 Facebook 专页竞对:tracker 填 'FB'。
-- 账号名填专页网址 facebook.com/ 后面那一段,例:facebook.com/innotechcctv → 'innotechcctv'
-- 直接贴专页链接也可以。只能抓「专页」(Page),抓不到个人账号。
-- 每个专页每周默认抓最近 20 条(Variables 里的 FB_RESULTS_LIMIT 可改,改大会加 Apify 费用)
-- ------------------------------------------------------------
insert into competitors (username, tracker, active) values
  ('FB专页1', 'FB', true),
  ('FB专页2', 'FB', true),
  ('FB专页3', 'FB', true)
on conflict do nothing;

-- 想停掉某个竞对(保留数据,只是不再抓):
-- update competitors set active = false where lower(username) = lower('要停的账号名');

-- 看现在在追踪哪些:
-- select username, tracker, active, notes from competitors order by active desc, username;
