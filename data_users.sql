-- DROP TABLE IF EXISTS "users";
--
-- CREATE TABLE "users" (
--   id SERIAL PRIMARY KEY,
--   id integer NULL,
--   first_name varchar(255) default NULL,
--   last_name varchar(255) default NULL,
--   email varchar(255) default NULL,
--   phone varchar(100) default NULL,
--   main_photo_id integer NULL,
--   created_at varchar(255)
-- );

INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (1,'Orli','Suarez','sed@google.net','1-951-906-7588',88,'2022-02-02 15:39:59'),
  (2,'Cecilia','Miller','ornare.lectus@yahoo.edu','1-232-179-9667',24,'2021-06-09 04:37:20'),
  (3,'Reuben','Yang','tempus.lorem.fringilla@protonmail.edu','(131) 946-3699',81,'2021-06-07 10:24:42'),
  (4,'Tanner','Blankenship','erat@icloud.edu','(627) 488-7188',97,'2023-01-06 06:27:50'),
  (5,'Howard','Pitts','consectetuer@protonmail.ca','1-752-757-3163',38,'2022-02-04 15:25:43'),
  (6,'Coby','Bush','eu@yahoo.edu','1-281-385-6643',83,'2023-03-13 02:42:43'),
  (7,'Jakeem','Bishop','fringilla.porttitor.vulputate@outlook.couk','1-894-399-3173',27,'2022-12-03 22:26:18'),
  (8,'Ishmael','Sloan','mauris.sagittis@protonmail.ca','1-883-585-9722',82,'2021-12-09 06:53:18'),
  (9,'Kaseem','Villarreal','vulputate.nisi@icloud.net','(565) 428-3668',41,'2022-03-16 23:29:08'),
  (10,'Demetrius','Rosales','non.leo.vivamus@google.couk','1-719-644-4621',10,'2021-10-13 06:52:07');
INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (11,'Kylee','Gray','tincidunt.donec@aol.ca','(236) 313-5833',81,'2022-06-06 03:51:17'),
  (12,'Juliet','Armstrong','aliquam@outlook.couk','(707) 855-2512',28,'2021-10-26 11:47:35'),
  (13,'Yael','Valdez','magnis.dis@google.ca','1-356-427-9642',45,'2021-04-23 01:32:05'),
  (14,'Ori','Medina','ridiculus.mus.donec@hotmail.edu','1-831-345-7454',87,'2023-04-17 19:44:06'),
  (15,'Kenneth','Sharp','dui@protonmail.couk','1-297-542-6077',4,'2022-09-17 04:06:15'),
  (16,'Elijah','Lane','mollis.duis@yahoo.net','1-736-326-5295',80,'2022-07-18 21:34:01'),
  (17,'Scarlet','Woodward','quis.diam.luctus@aol.couk','(279) 474-2362',56,'2023-04-25 19:27:20'),
  (18,'Vincent','Lawson','congue.turpis.in@protonmail.couk','1-338-586-5772',4,'2023-04-26 06:57:43'),
  (19,'Venus','Mercer','nibh@outlook.couk','(271) 384-3314',85,'2022-10-14 11:27:03'),
  (20,'Shafira','Ochoa','ornare.in@google.com','1-424-447-3043',79,'2021-09-12 02:50:29');
INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (21,'Colorado','Jarvis','ornare.libero.at@protonmail.com','1-858-877-7096',30,'2022-05-01 23:19:21'),
  (22,'Hanna','Owen','vel.quam.dignissim@google.edu','1-845-821-8148',83,'2021-12-31 05:39:50'),
  (23,'Ahmed','Lynch','cubilia@google.couk','1-772-477-8406',62,'2021-06-20 21:54:04'),
  (24,'Len','Sanders','mauris.nulla@google.org','1-835-877-9653',44,'2021-09-04 16:58:05'),
  (25,'Ulysses','Salas','tempus.lorem.fringilla@yahoo.org','(614) 540-2440',7,'2023-04-23 10:35:15'),
  (26,'Charity','Golden','augue@hotmail.com','(755) 710-4541',92,'2022-12-26 23:09:24'),
  (27,'Kaitlin','Matthews','penatibus.et.magnis@icloud.net','1-959-133-5396',61,'2022-05-11 03:06:22'),
  (28,'Derek','Burris','est.nunc@hotmail.edu','(352) 435-3704',44,'2023-04-13 09:30:00'),
  (29,'Aidan','Blackwell','integer.eu@hotmail.org','(343) 329-0780',97,'2021-05-11 09:49:16'),
  (30,'Ahmed','Jarvis','rhoncus.nullam@protonmail.edu','1-856-669-4542',50,'2021-08-19 10:57:41');
INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (31,'Jennifer','Witt','diam.dictum.sapien@outlook.com','(625) 232-8187',35,'2021-09-14 18:52:58'),
  (32,'Porter','Pace','mollis.dui@google.com','(751) 418-4947',97,'2022-07-22 18:28:08'),
  (33,'Connor','Barnes','adipiscing.fringilla@protonmail.net','1-786-436-1037',78,'2021-05-17 01:57:55'),
  (34,'Talon','Johnson','lorem.semper@outlook.edu','1-511-455-4757',11,'2022-09-29 10:44:20'),
  (35,'Colin','Bernard','purus@protonmail.com','1-465-179-4326',1,'2021-04-08 06:43:28'),
  (36,'Hanae','Rivera','donec@hotmail.org','(232) 362-2260',29,'2022-03-27 07:32:44'),
  (37,'Lucian','Noble','lectus.nullam@aol.org','(864) 360-2437',43,'2022-03-21 20:04:51'),
  (38,'Reese','Brooks','vel.faucibus.id@protonmail.edu','1-214-421-4632',62,'2022-02-09 08:55:49'),
  (39,'Christine','Mcmahon','ornare.sagittis@hotmail.org','(926) 263-6997',69,'2021-08-27 03:35:17'),
  (40,'Xavier','Hampton','elit.elit@aol.com','1-376-365-2271',87,'2021-12-24 00:27:22');
INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (41,'Yen','Huff','nulla@hotmail.net','1-204-336-5345',28,'2022-09-08 15:32:37'),
  (42,'Aidan','Boone','orci.quis@icloud.com','1-659-445-5932',24,'2022-11-16 13:24:48'),
  (43,'Kylan','Watts','facilisis.magna@outlook.ca','1-556-367-1244',28,'2023-03-08 21:04:58'),
  (44,'Rachel','Griffin','ipsum.primis@outlook.edu','1-471-651-5036',92,'2021-04-02 08:15:26'),
  (45,'Slade','Knapp','fringilla.mi.lacinia@google.com','1-338-284-3978',15,'2022-12-11 08:25:19'),
  (46,'Joseph','Harrell','ornare.egestas.ligula@icloud.couk','1-594-945-3663',5,'2022-01-23 23:26:51'),
  (47,'Lionel','Nixon','ac.mattis@protonmail.org','1-746-445-1574',35,'2023-02-28 12:04:42'),
  (48,'Maxwell','Hayden','tincidunt.congue@icloud.net','1-936-318-7349',5,'2023-01-22 21:22:00'),
  (49,'Tana','Merrill','nec.tempus@google.org','(487) 639-6114',93,'2023-02-19 10:12:49'),
  (50,'Stone','Foreman','nulla.tincidunt@yahoo.net','(217) 673-7536',64,'2022-02-20 00:43:47');
INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (51,'Hayley','Harper','vulputate.posuere@aol.couk','1-407-150-2434',55,'2021-05-03 12:12:43'),
  (52,'Nayda','Davenport','nibh.aliquam.ornare@protonmail.edu','1-737-178-2182',33,'2022-06-26 08:33:46'),
  (53,'Hamilton','Ford','sed.sapien.nunc@google.ca','1-212-624-7172',51,'2022-11-21 20:31:46'),
  (54,'Uma','Rosario','donec.est.nunc@icloud.com','(860) 622-9988',20,'2022-04-22 07:14:05'),
  (55,'Kelly','Langley','aliquam.eros@aol.org','1-106-684-2676',22,'2022-10-24 16:33:07'),
  (56,'Basia','Moreno','mollis.duis@hotmail.ca','(540) 258-2854',69,'2022-03-01 17:32:13'),
  (57,'Kermit','Schultz','sociis.natoque.penatibus@google.org','1-362-688-1740',2,'2021-10-22 19:14:44'),
  (58,'Clark','Valenzuela','sapien.cursus@yahoo.couk','1-106-101-7847',40,'2021-10-08 21:38:39'),
  (59,'Aristotle','Rasmussen','augue.eu@icloud.org','1-250-483-8466',72,'2023-03-04 13:14:50'),
  (60,'Zorita','Le','at.fringilla.purus@google.couk','1-240-569-2546',4,'2022-01-18 16:49:23');
INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (61,'Sacha','Humphrey','semper.dui@protonmail.net','(381) 724-0684',87,'2023-04-03 19:43:59'),
  (62,'Phelan','Roman','eget.metus@hotmail.couk','(724) 988-7867',66,'2022-06-11 04:07:48'),
  (63,'Cooper','Stark','eu.tellus@google.edu','(983) 288-2266',59,'2022-05-13 03:54:40'),
  (64,'Teegan','Riddle','mauris.suspendisse@aol.ca','1-669-396-9449',57,'2022-05-26 18:15:15'),
  (65,'Akeem','Osborne','dolor.egestas@yahoo.edu','1-673-252-3433',97,'2021-11-14 21:59:41'),
  (66,'Beverly','Green','vel.turpis@protonmail.couk','(722) 876-4936',80,'2021-12-04 23:47:17'),
  (67,'Cally','Molina','magna.tellus@aol.edu','1-692-948-2915',35,'2022-07-08 17:19:07'),
  (68,'Fletcher','Huffman','diam@aol.edu','(454) 585-2091',95,'2022-06-14 00:45:30'),
  (69,'Orlando','Quinn','nunc.id@outlook.edu','(954) 562-9145',74,'2023-03-30 16:06:03'),
  (70,'Arden','Drake','eu@yahoo.com','1-590-725-2741',61,'2022-11-26 18:47:42');
INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (71,'Phelan','Hoffman','eu.erat.semper@aol.org','1-578-986-7324',79,'2022-08-21 23:34:39'),
  (72,'Lance','Craig','cras@hotmail.net','1-255-814-1351',78,'2021-06-08 08:19:21'),
  (73,'Liberty','Tanner','aenean.massa.integer@aol.org','1-814-892-9177',95,'2022-10-19 21:47:23'),
  (74,'Tatyana','Gilmore','dictum@icloud.couk','(582) 997-5283',32,'2021-09-01 02:47:49'),
  (75,'Eric','Flynn','duis.risus@hotmail.net','(147) 220-2481',11,'2021-12-02 10:00:08'),
  (76,'Zachary','Pace','tincidunt@hotmail.org','1-643-946-4327',42,'2023-01-16 11:09:00'),
  (77,'Kay','Newton','elit@hotmail.net','(584) 418-0512',54,'2022-10-15 12:28:45'),
  (78,'Russell','Meyers','nunc.risus.varius@outlook.couk','1-561-531-1234',51,'2021-07-14 01:19:44'),
  (79,'Jaime','Collier','ullamcorper.magna@yahoo.net','(412) 772-3786',18,'2022-04-22 09:21:18'),
  (80,'Griffith','Irwin','fringilla.donec@protonmail.org','(524) 846-2249',26,'2023-04-16 19:45:36');
INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (81,'Vincent','Simpson','justo.nec.ante@outlook.ca','(722) 288-0436',50,'2022-02-06 20:35:24'),
  (82,'Grace','Ramos','nunc.risus@google.couk','1-646-949-4315',40,'2022-02-02 14:35:48'),
  (83,'Cameran','Huff','sed.sapien@outlook.net','1-557-456-8684',37,'2021-07-14 03:56:14'),
  (84,'Clinton','Walls','augue@outlook.org','(705) 356-7463',42,'2022-06-08 13:04:40'),
  (85,'Kelsie','Ford','volutpat.ornare.facilisis@aol.net','1-313-863-3328',11,'2021-11-11 07:28:40'),
  (86,'Hashim','Pate','pede.et@icloud.org','1-473-282-8742',81,'2022-01-26 10:22:36'),
  (87,'Eugenia','Harris','lectus@outlook.edu','1-678-212-0302',82,'2023-02-12 08:25:30'),
  (88,'Palmer','Green','ut@icloud.org','(618) 521-3738',11,'2021-11-29 15:38:44'),
  (89,'Stuart','Monroe','vel.lectus.cum@aol.couk','(286) 283-5669',27,'2021-05-02 20:13:18'),
  (90,'Orli','O''connor','primis.in.faucibus@icloud.net','(283) 244-5156',31,'2021-12-10 12:26:39');
INSERT INTO users (id,first_name,last_name,email,phone,main_photo_id,created_at)
VALUES
  (91,'Wynter','Booker','vitae.dolor@protonmail.couk','1-742-106-0546',29,'2021-12-01 23:34:54'),
  (92,'Tobias','Wilkinson','amet@aol.ca','(245) 516-1837',50,'2021-05-08 12:42:36'),
  (93,'Jaquelyn','Wood','mauris.ut.mi@yahoo.org','(593) 425-2636',47,'2023-03-03 05:57:13'),
  (94,'Fulton','Sawyer','blandit.viverra@google.com','1-525-379-7317',52,'2021-06-05 22:02:20'),
  (95,'Alika','Parks','magnis@aol.couk','(609) 364-5584',84,'2021-10-03 15:15:21'),
  (96,'Sean','Bond','tellus.non@yahoo.net','(472) 488-7282',69,'2022-10-27 10:16:33'),
  (97,'Ariel','Gaines','aenean@aol.ca','1-773-661-9549',30,'2022-12-24 23:31:36'),
  (98,'Camilla','Turner','at.auctor@yahoo.net','1-675-274-7675',33,'2022-07-17 06:05:33'),
  (99,'Sarah','Velez','sed.dolor@google.com','(968) 845-5053',32,'2022-08-17 13:53:11'),
  (100,'Sierra','Pollard','odio.etiam@protonmail.couk','1-457-609-5774',74,'2022-07-13 10:36:41');
