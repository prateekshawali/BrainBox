create database brainbox_db;
use  brainbox_db;
-- Insert users
INSERT INTO user (id, username, password) VALUES
(1, 'john', '$2a$12$mROm9wj30LfqU8mAi6jxjOFnE5C3XqK52.SP/JKAyqlWEfY39Ut0i'),   -- Admin (all roles)
(2, 'alice', '$2a$12$siA9UKeZ9JessbKfMIn.h.P5XKEhk9FD9o6pE3YHxEsIyDkjXYVHa'),  -- Contributor
(3, 'bob', '$2a$12$36N3VrVvfsB5PJfzzgRCiuLFH9rWhlrpkKkAHOpGBv.DeZUJ28.Um'),    -- Editor
(4, 'seema', '$2a$12$VL3ymLwP.Zuw63xS4DImBOpjzSKJo72oT/on5YNCKskbVqCtsti/W'),  -- Reviewer
(5, 'manu', '$2a$12$2Vu.qyN1wmH4BfuAKWBlZu1v2yhl4TGR0kAfM3Q61HFIQLTas0dDy');   -- Viewer

-- Insert user anita (id = 6)
INSERT INTO user (id, username, password) VALUES
(6, 'anita', '$2a$12$bf64c/3RINv6ZfqHFQTDtenHxfHQxoCRrJQOUKnt4J0MQAS56yvCy');


-- john = Admin (all roles)
INSERT INTO user_roles (user_id, role_id) VALUES
  (1, 1), -- ADMIN
  (1, 2), -- EDITOR
  (1, 3), -- CONTRIBUTOR
  (1, 4), -- REVIEWER
  (1, 5); -- VIEWER

-- alice = Contributor
INSERT INTO user_roles (user_id, role_id) VALUES
  (2, 3); -- CONTRIBUTOR

-- bob = Editor (and Contributor optionally)
INSERT INTO user_roles (user_id, role_id) VALUES
  (3, 2); -- EDITOR

-- seema = Reviewer
INSERT INTO user_roles (user_id, role_id) VALUES
  (4, 4); -- REVIEWER

-- manu = Viewer
INSERT INTO user_roles (user_id, role_id) VALUES
  (5, 5); -- VIEWER
  
  INSERT INTO user_roles (user_id, role_id) VALUES (6, 2);
  
  SELECT * FROM user;
SELECT * FROM role;
SELECT * FROM user_roles;