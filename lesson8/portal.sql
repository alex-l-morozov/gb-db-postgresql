-- 1. Проанализировать бизнес-логику приложения и создать структуру базы данных, которая может использоваться
-- для хранения данных этого приложения. В базе данных должно быть минимум десять таблиц. Если таблиц получается
-- более двадцати то рекомендуется ограничиться частью функционала приложения и не превышать это количество.
-- В качестве отчета по этой части проекта необходимо приложить команды создания таблиц.

-- Таблица пользователей
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  login VARCHAR(50) NOT NULL,
  password VARCHAR(20) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  group_id INT,
  created_at TIMESTAMP
);

-- Таблица профелей пользователей
CREATE TABLE profiles (
    user_id INT NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    main_photo_id INT,
    created_at TIMESTAMP,
    PRIMARY KEY (user_id)
);

-- Таблица групп пользователей
CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  created_at TIMESTAMP
);

-- Таблица фотографии
CREATE TABLE photo (
  id SERIAL PRIMARY KEY,
  url VARCHAR(250) NOT NULL UNIQUE,
  owner_id INT NOT NULL,
  description VARCHAR(250) NOT NULL,
  uploaded_at TIMESTAMP NOT NULL,
  size INT NOT NULL
);

-- Таблица видео
CREATE TABLE video (
  id SERIAL PRIMARY KEY,
  url VARCHAR(250) NOT NULL UNIQUE,
  owner_id INT NOT NULL,
  description VARCHAR(250) NOT NULL,
  uploaded_at TIMESTAMP NOT NULL,
  size INT NOT NULL
);

-- Таблица категории
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  code VARCHAR(250) NOT NULL UNIQUE,
  name INT NOT NULL,
  description VARCHAR(250) NOT NULL,
  created_at TIMESTAMP NOT NULL
);

-- Таблица новостей
CREATE TABLE news (
  id SERIAL PRIMARY KEY,
  code VARCHAR(250) NOT NULL UNIQUE,
  name INT NOT NULL,
  owner_id INT NOT NULL,
  description VARCHAR(250) NOT NULL,
  body TEXT,
  created_at TIMESTAMP NOT NULL,
  category_id INT NOT NULL
);

-- Таблица комментарии
CREATE TABLE comments(
    id          SERIAL PRIMARY KEY,
    owner_id    INT          NOT NULL,
    description VARCHAR(250) NOT NULL,
    created_at  TIMESTAMP    NOT NULL,
    entity_type VARCHAR(25)  NOT NULL,
    entity_id   VARCHAR(25)  NOT NULL
);

-- Таблица сообщения
CREATE TABLE messages (
  id SERIAL PRIMARY KEY,
  from_user_id INT NOT NULL,
  to_user_id INT NOT NULL,
  body TEXT,
  is_important BOOLEAN,
  is_delivered BOOLEAN,
  created_at TIMESTAMP
);



-- 3. Создать внешние ключи, если они не были созданы на шаге 1 в командах создания таблиц. В качестве отчета приложить
-- команды создания внешних ключей.
ALTER TABLE users
  ADD CONSTRAINT users_group_id_fk
    FOREIGN KEY (group_id)
    REFERENCES groups (id);

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id)
    REFERENCES users (id);

ALTER TABLE profiles
  ADD CONSTRAINT profiles_main_photo_id_fk
    FOREIGN KEY (main_photo_id)
    REFERENCES photo (id);