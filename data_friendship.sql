-- DROP TABLE IF EXISTS "friendship";
--
-- CREATE TABLE "friendship" (
--   id SERIAL PRIMARY KEY,
--   id integer NULL,
--   requested_by_user_id integer NULL,
--   requested_to_user_id integer NULL,
--   status_id integer NULL,
--   requested_at varchar(255),
--   confirmed_at varchar(255),
--   is_subscriber varchar(255) default NULL
-- );

INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (1,67,46,4,'2022-05-27 14:57:09','2022-05-07 04:29:04','true'),
  (2,65,72,1,'2021-10-23 18:44:24','2022-09-13 20:26:41','false'),
  (3,59,16,4,'2021-12-12 15:50:51','2022-03-12 22:04:43','true'),
  (4,72,2,2,'2022-09-20 09:35:16','2022-12-05 22:06:21','false'),
  (5,56,36,1,'2021-12-22 19:20:20','2021-11-04 12:44:00','false'),
  (6,43,66,4,'2022-01-07 09:36:10','2023-03-29 13:27:19','false'),
  (7,17,6,4,'2022-11-08 11:58:11','2021-10-25 07:35:26','true'),
  (8,10,29,1,'2021-12-11 16:13:19','2022-07-02 21:58:35','true'),
  (9,18,57,4,'2021-08-21 07:01:06','2022-07-06 09:30:45','true'),
  (10,51,90,3,'2022-06-23 21:27:09','2021-05-29 19:34:16','false');
INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (11,47,6,5,'2021-11-29 14:58:30','2022-04-23 01:44:57','false'),
  (12,70,55,5,'2022-05-11 22:19:25','2022-06-29 07:05:30','true'),
  (13,16,13,4,'2022-03-26 12:58:49','2021-05-08 17:21:26','false'),
  (14,89,9,1,'2022-03-22 08:37:56','2022-05-21 04:38:16','true'),
  (15,85,37,1,'2021-12-04 05:28:29','2021-04-29 11:58:23','false'),
  (16,65,40,4,'2021-09-03 13:34:35','2022-10-17 05:07:14','false'),
  (17,5,61,1,'2021-08-15 12:18:08','2023-01-18 08:01:11','false'),
  (18,16,16,5,'2022-11-17 11:08:40','2022-05-02 10:35:49','false'),
  (19,23,8,2,'2021-09-29 19:15:48','2022-08-15 23:20:43','false'),
  (20,3,6,2,'2022-05-11 19:35:42','2021-12-11 22:58:44','false');
INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (21,74,46,4,'2023-01-24 13:11:48','2022-01-01 19:55:26','true'),
  (22,61,54,1,'2022-04-28 07:35:31','2021-06-23 12:12:29','true'),
  (23,91,90,1,'2022-05-23 11:23:17','2021-07-01 16:29:59','false'),
  (24,37,90,4,'2022-07-29 08:45:59','2022-01-05 05:08:59','false'),
  (25,73,22,4,'2021-05-06 17:26:10','2021-12-02 03:19:01','false'),
  (26,46,30,3,'2022-07-14 19:18:09','2021-10-03 08:59:47','false'),
  (27,74,99,1,'2022-12-05 11:54:33','2021-12-30 19:04:43','true'),
  (28,12,26,2,'2021-06-16 22:09:45','2022-10-22 18:17:14','true'),
  (29,98,71,2,'2023-04-17 19:54:49','2021-05-03 09:33:05','false'),
  (30,40,17,3,'2022-08-11 23:25:50','2021-11-20 12:39:30','true');
INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (31,14,75,3,'2022-06-18 19:20:40','2022-03-14 01:48:45','false'),
  (32,1,2,1,'2023-03-14 07:54:17','2022-11-25 22:45:02','true'),
  (33,56,48,2,'2022-10-08 13:05:58','2021-11-20 08:23:26','true'),
  (34,42,6,1,'2021-11-07 21:20:08','2022-02-13 16:05:29','true'),
  (35,93,55,5,'2023-02-14 11:17:19','2021-08-06 19:10:25','true'),
  (36,77,9,4,'2022-04-01 20:48:30','2022-05-03 12:37:52','false'),
  (37,79,38,4,'2021-08-12 20:22:06','2021-07-13 23:57:45','false'),
  (38,72,98,3,'2021-10-01 07:08:28','2021-05-05 23:09:03','false'),
  (39,26,39,2,'2021-12-07 15:09:19','2022-10-22 12:28:37','false'),
  (40,50,40,4,'2021-05-03 15:34:57','2021-08-02 08:27:11','false');
INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (41,10,76,3,'2021-07-17 03:22:28','2022-08-18 08:57:02','false'),
  (42,39,68,1,'2022-05-25 05:42:29','2022-07-06 21:39:30','true'),
  (43,62,29,1,'2021-09-13 04:39:34','2022-01-07 16:51:26','false'),
  (44,92,78,4,'2022-04-01 01:46:54','2021-11-02 11:35:57','true'),
  (45,8,56,1,'2023-03-28 22:30:18','2021-09-06 09:46:57','false'),
  (46,62,2,3,'2022-12-06 07:36:31','2021-06-02 04:27:22','true'),
  (47,85,69,1,'2021-09-16 16:57:42','2021-10-06 16:56:55','false'),
  (48,37,45,1,'2023-03-14 00:27:42','2022-09-25 08:07:51','true'),
  (49,50,49,1,'2022-12-25 14:29:19','2023-02-09 13:53:55','false'),
  (50,65,31,2,'2021-11-15 20:03:14','2021-06-16 11:31:51','true');
INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (51,34,53,5,'2023-01-01 03:33:16','2022-10-02 13:43:21','false'),
  (52,15,36,2,'2022-11-21 08:42:04','2022-08-23 23:00:15','true'),
  (53,43,79,2,'2022-02-01 08:46:58','2022-08-16 13:11:12','true'),
  (54,96,67,2,'2022-03-01 00:45:28','2021-10-02 19:57:50','true'),
  (55,99,69,3,'2021-12-02 12:03:27','2023-03-21 13:15:52','false'),
  (56,82,44,1,'2023-02-16 09:38:29','2021-05-14 22:42:57','false'),
  (57,56,17,4,'2021-12-19 05:29:36','2022-01-01 17:12:18','false'),
  (58,11,3,4,'2021-04-08 03:04:04','2023-01-11 18:31:23','false'),
  (59,84,51,3,'2021-06-15 03:57:43','2022-08-05 01:33:10','true'),
  (60,3,21,1,'2023-01-12 18:10:37','2022-04-08 08:19:53','true');
INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (61,10,16,1,'2021-04-06 21:55:17','2022-12-19 06:47:58','false'),
  (62,79,47,2,'2023-03-12 06:53:10','2021-09-18 01:22:08','true'),
  (63,23,86,5,'2022-07-31 21:17:32','2022-04-11 22:20:38','true'),
  (64,30,31,3,'2022-07-04 01:13:50','2021-08-13 06:19:48','true'),
  (65,32,58,1,'2023-01-04 22:24:21','2022-06-11 21:49:40','false'),
  (66,10,74,4,'2022-02-26 15:57:53','2022-10-16 11:31:57','false'),
  (67,72,68,3,'2022-02-25 17:09:50','2022-06-27 05:13:08','false'),
  (68,8,86,1,'2022-08-27 08:47:34','2022-08-14 07:56:22','false'),
  (69,82,92,4,'2022-03-07 03:31:24','2021-12-08 01:05:11','true'),
  (70,7,4,2,'2022-04-25 06:43:41','2021-07-29 01:42:28','false');
INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (71,20,33,1,'2022-12-06 12:33:06','2021-12-15 06:59:21','true'),
  (72,10,54,1,'2022-04-05 21:04:21','2021-06-22 14:05:22','true'),
  (73,89,26,2,'2021-04-21 08:12:24','2022-01-26 17:37:16','true'),
  (74,65,20,2,'2022-06-07 07:00:48','2022-01-14 17:21:15','false'),
  (75,41,97,1,'2021-06-13 23:12:14','2021-12-08 19:27:22','false'),
  (76,33,34,2,'2022-03-26 16:39:48','2022-07-15 12:53:10','true'),
  (77,29,39,1,'2021-12-28 15:47:57','2023-01-15 19:26:50','false'),
  (78,40,28,3,'2022-10-24 04:21:32','2022-10-27 11:10:38','true'),
  (79,15,93,2,'2021-10-31 08:17:33','2022-10-14 03:41:34','true'),
  (80,31,28,5,'2021-04-07 16:19:43','2022-06-03 23:53:32','false');
INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (81,81,42,3,'2022-11-29 23:21:05','2022-08-02 03:56:18','false'),
  (82,18,47,4,'2021-07-03 14:25:12','2023-03-19 01:41:39','false'),
  (83,72,60,4,'2022-02-20 16:59:43','2021-09-15 23:13:19','true'),
  (84,92,62,2,'2022-06-19 16:40:03','2022-10-17 09:21:27','true'),
  (85,65,89,1,'2021-09-15 11:57:25','2023-02-17 08:52:55','true'),
  (86,74,52,2,'2022-12-10 09:55:53','2022-10-11 16:12:12','true'),
  (87,98,30,1,'2022-09-14 21:12:37','2022-11-27 00:43:22','true'),
  (88,86,25,3,'2021-09-13 21:31:20','2021-11-11 08:49:56','false'),
  (89,42,62,2,'2023-03-27 21:48:13','2022-12-11 21:20:28','true'),
  (90,68,39,1,'2022-06-06 08:30:11','2022-08-10 20:39:49','false');
INSERT INTO friendship (id,requested_by_user_id,requested_to_user_id,status_id,requested_at,confirmed_at,is_subscriber)
VALUES
  (91,60,66,1,'2021-08-12 21:27:56','2021-09-02 01:55:31','true'),
  (92,1,18,4,'2023-03-11 03:48:21','2022-05-15 12:39:12','true'),
  (93,7,70,1,'2022-01-13 11:40:50','2021-11-13 19:13:47','true'),
  (94,52,44,1,'2021-06-20 08:12:39','2021-08-07 14:10:15','true'),
  (95,17,77,1,'2022-08-01 06:48:27','2023-02-08 17:52:47','false'),
  (96,90,30,1,'2021-04-15 15:39:06','2022-03-20 11:17:43','true'),
  (97,7,9,5,'2022-06-23 12:23:31','2021-09-09 22:00:08','false'),
  (98,62,40,4,'2023-03-25 11:12:57','2021-07-20 21:32:26','false'),
  (99,77,62,4,'2023-03-16 02:26:51','2023-04-13 13:51:11','false'),
  (100,10,10,3,'2021-10-20 08:37:50','2022-11-18 20:57:53','false');
