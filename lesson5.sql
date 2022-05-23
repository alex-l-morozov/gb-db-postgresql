-- 1. Создать роли для пользователей Федор Серов и Роман Белов. Создать роли для групп аналитиков и тестировщиков.
-- Поместить пользователя Федор Серов в группу аналитиков а пользователя Роман Белов в группу тестировщиков.
-- Дать группе аналитиков право только на чтение данных в БД vk. Дать группе тестировщиков все права в БД vk.
-- Подключиться к БД vk под обоими пользователями и проверить права выполнив простые операции SQL.
--
-- postgres=# CREATE ROLE testers;
-- CREATE ROLE
-- postgres=# CREATE ROLE analysts;
-- CREATE ROLE
-- postgres=# CREATE USER serovf;
-- CREATE ROLE
-- postgres=# CREATE USER belovr;
-- CREATE ROLE
-- postgres=# GRANT analysts TO serovf;
-- GRANT ROLE
-- postgres=# GRANT testers TO belovr;
-- GRANT ROLE
-- postgres=# ALTER ROLE belovr WITH PASSWORD 'belovr';
-- ALTER ROLE
-- postgres=# ALTER ROLE serovf WITH PASSWORD 'serovf';
-- ALTER ROLE
-- postgres@alex:~$ psql -d vk
-- vk=# GRANT ALL ON ALL TABLES IN SCHEMA public TO testers;
-- GRANT
-- vk=# GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO testers;
-- GRANT
-- vk=# GRANT SELECT ON ALL TABLES IN SCHEMA public TO analysts;
-- GRANT
-- vk=# \q
-- postgres@alex:~$ psql -U belovr -d vk -h 127.0.0.1 -W
-- vk=> update users set first_name = 'Test', last_name = 'Test' WHERE id = 1;
-- UPDATE 1
-- vk=> \q
-- postgres@alex:~$ psql -U serovf -d vk -h 127.0.0.1 -W
-- vk=> update users set first_name = 'Test', last_name = 'Test' WHERE id = 2;
-- ОШИБКА:  нет доступа к таблице users
-- vk=> \q


-- 2. Установить любое расширение PostgreSQL на ваш выбор.
-- postgres@alex:~$ psql
-- postgres=# CREATE EXTENSION "isn";
-- CREATE EXTENSION
-- postgres=# SELECT * FROM pg_extension WHERE extname = 'isn';
--   oid  | extname | extowner | extnamespace | extrelocatable | extversion | extconfig | extcondition
-- -------+---------+----------+--------------+----------------+------------+-----------+--------------
--  16709 | isn     |       10 |         2200 | t              | 1.2        |           |
-- (1 строка)


-- 3. Выполнить вертикальное разделение таблицы пользователей на таблицу пользователей (users)
-- и таблицу профилей (profiles). В таблице пользователей оставить только столбцы идентификатора, имени, фамилии,
-- электронной почты и телефона. Все остальные столбцы вместе с данными необходимо перенести в таблицу профилей.
CREATE TABLE profiles (
  user_id INT NOT NULL,
  main_photo_id INT NOT NULL,
  user_contacts contacts,
  created_at TIMESTAMP,
  PRIMARY KEY (user_id)
);

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id)
    REFERENCES users (id);

ALTER TABLE profiles
  ADD CONSTRAINT profiles_main_photo_id_fk
    FOREIGN KEY (main_photo_id)
    REFERENCES photo (id);

INSERT INTO profiles (user_id, main_photo_id, user_contacts, created_at)
SELECT id, main_photo_id, user_contacts, created_at from users;

ALTER TABLE users
  DROP COLUMN main_photo_id,
  DROP COLUMN user_contacts,
  DROP COLUMN created_at;