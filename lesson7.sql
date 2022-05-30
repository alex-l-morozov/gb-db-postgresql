-- 1. Удалить пользователей, которые не имеют ни одной дружеской связи с подтвержденным статусом.
-- Нужно удалить все данные, связанные с такими пользователями. Для решения используйте транзакцию.

-- Представление пользователей с подтверждёнными дружескими отношениями
DROP VIEW users_with_confirmed_friendship;
CREATE VIEW users_with_confirmed_friendship AS
    SELECT DISTINCT users.id
    FROM users
        LEFT JOIN friendship
            ON users.id = friendship.requested_by_user_id
                   OR users.id = friendship.requested_to_user_id
        LEFT JOIN friendship_statuses
            ON friendship.status_id = friendship_statuses.id
    WHERE friendship_statuses.name = ('confirmed');

-- Представление пользователей без подтверждённых дружеских отношений
DROP VIEW users_without_confirmed_friendship;
CREATE VIEW users_without_confirmed_friendship AS
    SELECT id FROM users WHERE id NOT IN (SELECT id FROM users_with_confirmed_friendship);

-- Транзакция удаления пользователей
BEGIN;
DELETE FROM photo
       USING users_without_confirmed_friendship
       WHERE photo.owner_id = users_without_confirmed_friendship.id;

DELETE FROM video
       USING users_without_confirmed_friendship
       WHERE video.owner_id = users_without_confirmed_friendship.id;

DELETE FROM messages
       USING users_without_confirmed_friendship
       WHERE messages.from_user_id = users_without_confirmed_friendship.id
          OR  messages.to_user_id = users_without_confirmed_friendship.id;

DELETE FROM communities_users
       USING users_without_confirmed_friendship
       WHERE communities_users.user_id = users_without_confirmed_friendship.id;

DELETE FROM friendship
       USING users_without_confirmed_friendship
       WHERE friendship.requested_by_user_id = users_without_confirmed_friendship.id
          OR friendship.requested_to_user_id = users_without_confirmed_friendship.id;

DELETE FROM profiles
       USING users_without_confirmed_friendship
       WHERE profiles.user_id = users_without_confirmed_friendship.id;

DELETE FROM users
       USING users_without_confirmed_friendship
       WHERE users.id = users_without_confirmed_friendship.id;

ROLLBACK;


-- 2. Создать запрос, который для всех пользователей покажет количество загруженных фотографий
-- и видеофайлов (отдельными столбцами), а также ранг каждого пользователя по этим значениям
-- (также отдельно для фотографий и видеофайлов). Большие значения соответствуют более высокому рангу.
-- Решить задание необходимо одним запросом с использованием оконных функций.
WITH users_photo_and_video_rating AS (
SELECT DISTINCT
    users.first_name,
    users.last_name,
    COUNT(DISTINCT photo.id) AS photo_count,
    COUNT(DISTINCT video.id) AS video_count
FROM users
    LEFT JOIN photo
        ON users.id = photo.owner_id
    LEFT JOIN video
        ON users.id = video.owner_id
GROUP BY users.id)
SELECT
    first_name,
    last_name,
    photo_count,
    video_count,
    DENSE_RANK() OVER (ORDER BY photo_count DESC) AS photo_rank,
    DENSE_RANK() OVER (ORDER BY video_count DESC) AS video_rank
FROM users_photo_and_video_rating
ORDER BY photo_rank, video_rank;


-- 3. Для каждой группы (сообщества) найти средний размер видеофайлов, загруженных участниками группы,
-- а также вывести идентификатор, имя и фамилию пользователя, который загрузил самый большой по размеру видеофайл.
-- Решить задание необходимо одним запросом с использованием оконных функций.
WITH selected_videos AS (
SELECT
    communities.name AS community_name,
    communities_users.user_id,
    video.size AS video_size
FROM video
    INNER JOIN communities_users
        ON video.owner_id = communities_users.user_id
    RIGHT JOIN communities
        ON communities.id = communities_users.community_id
)
SELECT DISTINCT
    community_name,
    ROUND(AVG(video_size) OVER (PARTITION BY community_name)) AS average_video_size,
    FIRST_VALUE(first_name || ' ' || last_name) OVER (PARTITION BY community_name
        ORDER BY video_size DESC NULLS LAST) AS user_with_biggest_video
FROM selected_videos
    LEFT JOIN users
        ON selected_videos.user_id = users.id;