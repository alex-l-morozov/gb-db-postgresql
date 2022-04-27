-- Добавляем столбцы в существующие таблицы
ALTER TABLE friendship ADD COLUMN is_subscriber BOOLEAN;
ALTER TABLE communities_users ADD COLUMN is_subscriber BOOLEAN;

-- Получаем структуру (dump)
-- Таблица дружбы
CREATE TABLE friendship (
  id SERIAL PRIMARY KEY,
  requested_by_user_id INT NOT NULL,
  requested_to_user_id INT NOT NULL,
  status_id INT NOT NULL,
  requested_at TIMESTAMP,
  confirmed_at TIMESTAMP,
  is_subscriber BOOLEAN
);
-- Таблица связи сообщества - пользователи
CREATE TABLE communities_users (
  community_id INT NOT NULL,
  user_id INT NOT NULL,
  created_at TIMESTAMP,
  is_subscriber BOOLEAN,
  PRIMARY KEY (community_id, user_id)
);