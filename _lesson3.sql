-- Базы данных, уровень 2
-- Связность в структуре базы данных, использование сложных и пользовательских типов данных

-- Разбор ДЗ
-- Создать таблицу подписок

-- Вариант 1
-- Таблица подписок
CREATE TABLE subscriptions (
  id SERIAL PRIMARY KEY,
  from_user_id INT NOT NULL,
  to_user_id INT NOT NULL,
  to_community_id INT NOT NULL,
  status_subscription_id INT NOT NULL,
  created_at TIMESTAMP
)

-- Таблица статусов подписки
CREATE TABLE subscription_statuses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) UNIQUE
);

-- Вариант 2
-- Подписку сделал для сообществ, т.к. подписка на пользователей
-- реализована в сущности дружбы. Статус подписки - заявка, подписан, отписан.
CREATE TABLE subscriptions (
  PRIMARY KEY (community_id, user_id),
  community_id INT NOT NULL,
  user_id INT NOT NULL,
  requested_at VARCHAR(50),
  confirmed_at VARCHAR(50),
  status_id INT NOT NULL
);

CREATE TABLE subscriptions_statuses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE
);

INSERT INTO subscriptions_statuses (name)
VALUES
  ('request to subscription is sent'),
  ('subscription is accepted'),
  ('subscription is cancelled');

-- Вариант 3
CREATE TABLE subscribe_users (
  owner_id INT NOT NULL,
  user_id INT NOT NULL,
  subscribe_at TIMESTAMP NOT NULL,
  PRIMARY KEY (owner_id, user_id)
);

CREATE TABLE subscribe_communities (
  user_id INT NOT NULL,
  community_id INT NOT NULL,
  subscribe_at TIMESTAMP NOT NULL,
  PRIMARY KEY (user_id, community_id)
);

-- Вариант 4
CREATE TABLE subscription_user_or_communities (
  id SERIAL PRIMARY KEY,
  community_id INT,
  user_id INT NOT NULL,
  subscription_user_id INT,
  created_at TIMESTAMP
);

-- Вариант 5
-- Таблица подписок на пользователя
CREATE TABLE subscribtions_users (
  subscribed_by_user_id INT NOT NULL,
  subscribed_to_user_id INT NOT NULL,
  status_id INT NOT NULL,
  requested_at TIMESTAMP,
  confirmed_at TIMESTAMP,
  PRIMARY KEY (subscribed_by_user_id, subscribed_to_user_id)
);

-- Вариант 6
-- Таблица подписок на сообщества
CREATE TABLE subscribtions_communities (
  subscribed_by_user_id INT NOT NULL,
  subscribed_to_community_id INT NOT NULL,
  status_id INT NOT NULL,
  requested_at TIMESTAMP,
  confirmed_at TIMESTAMP,
  PRIMARY KEY (subscribed_by_user_id, subscribed_to_community_id)
);

-- Таблица статусов подписок
CREATE TABLE subscribe_statuses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) UNIQUE
);

-- Вариант 7
-- таблица подписок на пользователей
CREATE TABLE subscriptions_users (
  id SERIAL PRIMARY KEY,
  user_subscriber_id INT NOT NULL,
  subscription_user_id INT NOT NULL,
  created_at TIMESTAMP
);

-- таблица подписок на сообщества
CREATE TABLE subscriptions_communities (
  id SERIAL PRIMARY KEY,
  user_subscriber_id INT NOT NULL,
  subscription_communities_id INT NOT NULL,
  created_at TIMESTAMP
);

-- Вариант 8
CREATE TABLE subscriptions (
  id SERIAL PRIMARY KEY,
  subscribe_from_user_id INT NOT NULL,
  subscribe_to_user_id INT,
  subscribe_to_community_id INT,
  created_at TIMESTAMP
);

-- Вариант 9 (без дополнительных таблиц)
ALTER TABLE friendship ADD COLUMN is_subscriber BOOLEAN;
ALTER TABLE communities_users ADD COLUMN is_subscriber BOOLEAN;



-- Создание внешних ключей и обеспечение ссылочной целостности
-- Определение ограничений внешнего ключа

-- Создадим внешний ключ для столбца main_photo_id
ALTER TABLE users DROP CONSTRAINT users_main_photo_id_fk;
ALTER TABLE users
  ADD CONSTRAINT users_main_photo_id_fk
  FOREIGN KEY (main_photo_id)
  REFERENCES photo (id);

-- Если получаем ошибку, то исправляем данные.
ОШИБКА:  INSERT или UPDATE в таблице "users" нарушает ограничение внешнего ключа "users_main_photo_id_fk"
ПОДРОБНОСТИ:  Ключ (main_photo_id)=(9) отсутствует в таблице "photo".

-- Генерация случайных значений из диапазона
SELECT FLOOR(1 + RANDOM() * 100);


-- Далее проанализируем таблицу сообщений messages и создадим внешние ключи на столбцы from_user_id и to_user_id
ALTER TABLE messages DROP CONSTRAINT messages_from_user_id_fk;
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk
  FOREIGN KEY (from_user_id)
  REFERENCES users (id);

ALTER TABLE messages DROP CONSTRAINT messages_to_user_id_fk;
ALTER TABLE messages
  ADD CONSTRAINT messages_to_user_id_fk
  FOREIGN KEY (to_user_id)
  REFERENCES users (id);

-- Определять конкретное действие нужно исходя из логики связей между таблицами и бизнес логики приложения. Например, последнюю команду мы можем переписать следующим образом
ALTER TABLE messages
  ADD CONSTRAINT messages_to_user_id_fk
  FOREIGN KEY (to_user_id)
  REFERENCES users (id)
    ON DELETE CASCADE;

-- Контроль связей с помощью диаграммы отношений

-- Работа с типами данных
-- Приведение типов

-- В PostgreSQL реализовано два варианта синтаксиса записи приведения типов. Первый вариант - вызов функции CAST
SELECT created_at, CAST(created_at AS VARCHAR(4)) FROM users WHERE id = 1;

-- Второй вариант синтаксически выглядит как использование двойного двоеточия
SELECT created_at, created_at::VARCHAR(4) FROM users WHERE id = 1;

-- Следует помнить что не все варианты приведения возможны. Например, при попытке привести значение телефона пользователя к целочисленному значению мы получим ошибку
SELECT phone, phone::INTEGER FROM users WHERE id = 1;

-- Обзор и использование встроенных составных типов данных PostgreSQL

-- Типы JSON

-- https://postgrespro.ru/docs/postgresql/12/functions-json

-- Рассмотрим несколько примеров, начнём с целого числа
SELECT '48'::json;

-- Также мы можем привести массив к типу JSON
SELECT '[35, 9, "start", true]'::json;

-- мы можем использовать объекты, которые состоят из пар ключ-значение
SELECT '{"Samr": "Smith", "sam.s@yahoo.com": 34.67, "is_blocked": false}'::json;

-- мы можем создавать смешанные структуры различного уровня вложенности
SELECT '{"first": [null, "test"], "questions": {"1": 15, "2": 123}}'::json;

-- Создадим столбец metadata типа JSON в таблице video базы данных vk
ALTER TABLE video DROP COLUMN metadata;
ALTER TABLE video ADD COLUMN metadata JSON;

-- Создадим новые значения с помощью функции json_build_object, которая облегчает компоновку структуры, состоящей из пар ключ-значение
UPDATE video SET metadata = json_build_object(
  'id', id,
  'url', url,
  'owner_id', owner_id,
  'description', description,
  'uploaded_at', uploaded_at,
  'size', size
);

-- После выполнения обновления проверим результат для пользователя с id = 1
SELECT metadata FROM video WHERE id = 1;

-- Мы также можем получить объект в более читаемом виде, используя функцию json_each, которая выводит пары ключ-значение в отдельных строках
SELECT json_each(metadata) FROM video WHERE id = 1;

-- Для того чтобы найти значение по некоторому ключу, применяется специальный синтаксис ->>. В данном случае выводим значение ключа description значения metadata. Обратите внимание что поиск мы также выполняем по объекту метадата, выбирая пользователя с id = 1
SELECT metadata->>'description' FROM video WHERE (metadata->>'id')::INTEGER = 1;

-- Обновлять значения в объекте удобнее после приведения его к типу jsonb, так как для этого типа доступно больше вариантов операций чем для json
UPDATE video
  SET  metadata = metadata::jsonb - 'description' || '{"description":"New description"}'
  WHERE (metadata->>'id')::INTEGER = 1;

-- После выполнения обновления убедимся в том, что операция отработала корректно
SELECT metadata->>'description' FROM video WHERE (metadata->>'id')::INTEGER = 1;

-- Тип XML

-- https://postgrespro.ru/docs/postgresql/12/functions-xml

-- Рассмотрим пример приведения строки в значение типа XML с помощью функции xmlparse
SELECT XMLPARSE(DOCUMENT '<?xml version="1.0"?><video><title>Test video</title></video>');

-- Усложним задачу, и поместим в документ всю информацию о видео для записи с идентификатором равным единице
SELECT XMLPARSE(DOCUMENT '<?xml version="1.0"?>
  <video>
    <id>' || id || '</id>
    <url>' || url || '</url>
    <owner_id>' || owner_id || '</owner_id>
    <description>' || description || '</description>
    <uploaded_at>' || uploaded_at || '</uploaded_at>
    <size>' || size || '</size>
  </video>')
FROM video WHERE id = 1;

-- Для того чтобы поработать с данными такого типа в создадим в таблице video столбец metadata_xml
ALTER TABLE video DROP COLUMN metadata_xml;
ALTER TABLE video ADD COLUMN metadata_xml XML;

-- И запишем в него документ XML с данными по каждому видео
UPDATE video SET metadata_xml =  XMLPARSE (DOCUMENT '<?xml version="1.0"?>
  <video>
    <id>' || id || '</id>
    <url>' || url || '</url>
    <owner_id>' || owner_id || '</owner_id>
    <description>' || description || '</description>
    <uploaded_at>' || uploaded_at || '</uploaded_at>
    <size>' || size || '</size>
  </video>');

-- Мы можем проверить созданные документы на правильность с помощью выражения IS DOCUMENT
SELECT metadata_xml IS DOCUMENT FROM video WHERE id = 1;

-- Для работы с данными XML используются функции xpath и xpath_exists

-- Функция xpath позволяет получить нужное значение. Найдем значение url некоторого видео файла
SELECT xpath('/video/url/text()', metadata_xml) FROM video WHERE id = 1;

-- Функция xpath_existst позволяет проверить наличие некоторого элемента в документе
SELECT xpath_exists('/video/url', metadata_xml) FROM video WHERE id = 1;


-- Массивы

-- Например, добавим в таблицу видео столбец тегов типа массив
ALTER TABLE video DROP COLUMN tags;
ALTER TABLE video ADD COLUMN tags VARCHAR(30)[];

-- Вставим несколько тегов для первого видео
UPDATE video SET tags = '{"first", "second", "third"}' WHERE id = 1;
SELECT tags FROM video WHERE id = 1;

-- Обращаться к элементам массивов можно по их индексам
SELECT tags[2] FROM video WHERE id = 1;

-- Мы также можем получить часть массива (срез), при этом результат также будет массивом. Получим первые два тега записи
SELECT tags[1:2] FROM video WHERE id = 1;

-- Добавить элемент массива можно при помощи оператора конкатенации (объединения) ||
UPDATE video SET tags = tags || '{"next"}' WHERE id = 1;
SELECT tags FROM video WHERE id = 1;


-- Составные типы

-- https://postgrespro.ru/docs/postgresql/12/rowtypes

-- Например, создадим тип статистики лайков, куда включим количество лайков и количество дизлайков
DROP TYPE likes_stat_type;
CREATE TYPE likes_stat_type AS (likes INTEGER, dislikes INTEGER);

-- После определения типа мы можем его использовать аналогично встроенным типам. Добавим столбец нового типа likes_stat_type в таблицу video
ALTER TABLE video DROP COLUMN likes_stat;
ALTER TABLE video ADD COLUMN likes_stat likes_stat_type;

-- При вставке значения составного типа нужно поместить данные в одинарные кавычки и скобки
UPDATE video SET likes_stat = '(23, 6)' WHERE id = 1;
SELECT likes_stat FROM video WHERE id = 1;

-- Для того чтобы получить определённое поле составного значения необходимо после имени столбца в скобках указать имя поля через точку
SELECT (likes_stat).likes FROM video WHERE id = 1;
SELECT (likes_stat).dislikes FROM video WHERE id = 1;

-- Для того чтобы определить новое значение поля составного типа, используем аналогичный синтаксис, только при этом не берём имя столбца в скобки
UPDATE video SET likes_stat.likes = 38 WHERE id = 1;
SELECT (likes_stat).likes FROM video WHERE id = 1;

-- Для сборки значений составных типов удобно использовать синтаксис ROW(). В этом случае проще определять строковые значения в кавычках:
ROW('fuzzy dice', 42, 1.99)
ROW('', 42, NULL)


-- Примеры использования пользовательских типов данных

-- Базовый синтаксис для создания составного типа выглядит следующим образом:
CREATE TYPE имя AS (имя_атрибута тип_данных [, ... ] );

-- Создадим составной тип full_name (полное имя), который будет включать в себя имя и фамилию пользователя.
DROP TYPE full_name;
CREATE TYPE full_name AS (first_name varchar(80), last_name varchar(80));

-- Проверим как работает новый тип, приведем к типу full_name строковые значения имени и фамилии некоторого пользователя:
SELECT '("Selena", "Gomez")'::full_name;

-- Мы также можем создавать новые типы перечислений ENUM
DROP TYPE stars;
CREATE TYPE stars AS ENUM ('1', '2', '3', '4' ,'5');

-- Проверим работу нового типа
SELECT '5'::stars;

-- Команда создания типа для определения диапазона рейтинга rating_range будет выглядеть так:
DROP TYPE rating_range;
CREATE TYPE rating_range AS RANGE (SUBTYPE = INTEGER);

-- Проверим работу нового типа, приведем к нему диапазон от 1 до 5
SELECT '(1, 5)'::rating_range;





















