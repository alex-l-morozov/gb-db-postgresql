-- 1. Создать функцию, которая по идентификатору пользователя ищет того,
-- кто написал пользователю наибольшее количество сообщений.
-- В результат нужно вывести идентификатор искомого пользователя.
DROP FUNCTION IF EXISTS messages_sent_to_user_id;
CREATE FUNCTION messages_sent_to_user_id(user_id INTEGER)
RETURNS INTEGER AS
    $$
    SELECT from_user_id FROM messages
            WHERE to_user_id = user_id
            GROUP BY from_user_id
            ORDER BY count(*) DESC
            LIMIT 1;
    $$
LANGUAGE sql;

SELECT messages_sent_to_user_id(73);



-- 2. Создать процедуру, которая проверяет владельца фотографий,
-- которые указаны в качестве основных фотографий пользователей в таблице профилей.
-- Если пользователь в профилях не является владельцем своей основной фотографии,
-- тогда для него нужно записать NULL в столбце main_photo_id.
CREATE OR REPLACE PROCEDURE check_owner_main_photo()
LANGUAGE plpgsql AS
    $$
        DECLARE real_owner RECORD;
        BEGIN
            FOR real_owner IN
                SELECT profiles.user_id
                    FROM profiles
                        JOIN photo
                            ON profiles.main_photo_id = photo.id
                    WHERE photo.owner_id != profiles.user_id
            LOOP
                UPDATE profiles SET main_photo_id = NULL WHERE user_id = real_owner.user_id;
            END LOOP;
        END;
    $$;

-- Убираем NOT NULL у main_photo_id
ALTER TABLE profiles ALTER COLUMN main_photo_id DROP NOT NULL;

CALL check_owner_main_photo();



-- 3. Создать триггер на обновление для таблицы профилей,
-- который не разрешает внести в столбец main_photo_id идентификатор фотографии,
-- если данный пользователь не является ее владельцем.
-- Проверить работу триггера вставкой записей с корректными и некорректными значениями.
CREATE OR REPLACE FUNCTION update_profile_main_photo_trigger()
RETURNS TRIGGER AS
    $$
    DECLARE real_owner_id INTEGER;
        BEGIN
            real_owner_id := (SELECT owner_id FROM photo WHERE id = NEW.main_photo_id);
                IF real_owner_id IS NOT NULL AND NEW.user_id != real_owner_id THEN
                    RAISE EXCEPTION 'User with Id: % has no photo Id: %', NEW.user_id, NEW.main_photo_id;
                END IF;
            RETURN NEW;
        END;
    $$
LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_profiles_on_update ON profiles;
CREATE TRIGGER check_profiles_on_update BEFORE UPDATE ON profiles
    FOR EACH ROW
EXECUTE FUNCTION update_profile_main_photo_trigger();

SELECT id FROM photo WHERE owner_id = 3;

-- Ошибка
UPDATE profiles SET main_photo_id = 7 WHERE user_id = 3;
-- Ок
UPDATE profiles SET main_photo_id = 29 WHERE user_id = 3;



-- 4. Создать два представления для таблицы видео. Одно представление должно быть неизменяемым,
-- другое - изменяемым. Проверить изменяемость второго представления.
CREATE OR REPLACE VIEW mutable_photo_view AS
    SELECT * FROM photo;

CREATE OR REPLACE VIEW not_mutable_photo_view AS
    SELECT * FROM photo
    GROUP BY id
    ORDER BY id;

UPDATE mutable_photo_view SET description = 'Test view' WHERE id = 3;
UPDATE not_mutable_photo_view SET description = 'Test view' WHERE id = 3;