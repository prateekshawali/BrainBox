-- Roles and users are created by DataInitializer
-- Commented out as we're using DataInitializer to create users programmatically
/*
-- Insert users (all with password: 'password' encoded using BCrypt)
-- You can use https://bcrypt-generator.com/ to encode your own
INSERT INTO users (id, username, password) VALUES
(1, 'admin', '$2a$10$7zQ7zJ/0e0WJ0sovRZLQfOXAMGgU2KFeBB9M0hA.fB4D9lfMeo2iy'),
(2, 'john_user', '$2a$10$7zQ7zJ/0e0WJ0sovRZLQfOXAMGgU2KFeBB9M0hA.fB4D9lfMeo2iy'),
(3, 'contributor_1', '$2a$10$7zQ7zJ/0e0WJ0sovRZLQfOXAMGgU2KFeBB9M0hA.fB4D9lfMeo2iy'),
(4, 'reviewer_1', '$2a$10$7zQ7zJ/0e0WJ0sovRZLQfOXAMGgU2KFeBB9M0hA.fB4D9lfMeo2iy'),
-- Added john with password123 encoded with BCrypt
(5, 'john', '$2a$12$r.oPRZ2RJ4wNPFEJ5H2Z9e4L08GnTcnRpZpK86XQwWrCbb15mgplm');

-- Assign roles to users
INSERT INTO user_roles (user_id, role_id) VALUES
(1, 1), -- admin has ADMIN role
(2, 2), -- john_user has USER role
(3, 3), -- contributor_1 has CONTRIBUTOR role
(4, 4), -- reviewer_1 has REVIEWER role
(5, 1); -- john has ADMIN role
*/

-- Sample articles for various users - commented out as we're creating them in DataInitializer
/*
INSERT INTO article (id, title, content, approved, user_id) VALUES
(1, 'Admin Article', 'This article was added by Admin', true, 1),
(2, 'User Article', 'User can only view articles', true, 2),
(3, 'Pending Contributor Article', 'Needs review before publish', false, 3),
(4, 'Reviewed Article', 'This was approved by a reviewer', true, 3);
*/
