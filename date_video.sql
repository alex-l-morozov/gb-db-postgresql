-- DROP TABLE IF EXISTS "video";
--
-- CREATE TABLE "video" (
--   id SERIAL PRIMARY KEY,
--   id integer NULL,
--   url varchar(255),
--   owner_id integer NULL,
--   description TEXT default NULL,
--   uploaded_at varchar(255),
--   size integer NULL
-- );

INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (1,'http://facebook.com/one?q=test',38,'consectetuer rhoncus. Nullam velit dui, semper et, lacinia','2021-12-01 12:35:41',30),
  (2,'https://youtube.com/group/9?p=8',70,'pede. Nunc sed orci lobortis augue scelerisque','2022-08-06 09:17:00',67),
  (3,'http://nytimes.com/en-us?search=1',61,'posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse','2022-04-22 23:37:56',16),
  (4,'http://walmart.com/en-us?q=4',36,'et, rutrum non, hendrerit id, ante.','2022-11-04 10:59:24',86),
  (5,'https://walmart.com/fr?p=8',62,'malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in','2023-04-18 00:36:04',17),
  (6,'http://cnn.com/settings?client=g',34,'ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt','2022-03-18 21:42:19',13),
  (7,'http://zoom.us/user/110?gi=100',67,'lectus sit amet luctus vulputate, nisi sem','2021-06-28 03:15:44',36),
  (8,'https://ebay.com/en-us?q=0',4,'consequat, lectus sit amet luctus vulputate, nisi sem semper','2022-11-09 04:14:10',64),
  (9,'http://guardian.co.uk/settings?q=test',85,'vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam','2022-09-12 20:06:54',57),
  (10,'http://facebook.com/fr?q=0',53,'odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.','2021-07-12 10:25:59',97);
INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (11,'https://youtube.com/sub?q=11',93,'Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.','2021-11-09 16:49:50',59),
  (12,'https://facebook.com/settings?q=0',71,'Sed pharetra,','2021-11-17 07:38:52',26),
  (13,'http://guardian.co.uk/settings?search=1&q=de',49,'Integer vulputate, risus','2021-06-19 01:59:45',85),
  (14,'http://baidu.com/one?q=0',86,'tincidunt orci quis lectus. Nullam suscipit, est','2022-11-19 13:20:21',64),
  (15,'https://google.com/en-us?q=11',94,'ac mattis','2021-10-28 22:44:26',29),
  (16,'http://youtube.com/settings?q=4',70,'eleifend,','2021-11-30 08:09:30',77),
  (17,'https://twitter.com/settings?k=0',30,'molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper,','2022-05-25 09:14:01',52),
  (18,'http://wikipedia.org/settings?g=1',32,'egestas a, scelerisque sed, sapien. Nunc pulvinar arcu','2023-03-21 07:43:37',90),
  (19,'http://whatsapp.com/fr?search=1&q=de',99,'mollis. Integer tincidunt aliquam arcu.','2023-03-09 12:04:33',76),
  (20,'http://netflix.com/en-us?q=4',5,'Proin','2022-05-25 04:15:02',29);
INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (21,'http://cnn.com/sub/cars?g=1',62,'aliquet molestie tellus. Aenean egestas hendrerit','2021-12-11 17:49:33',75),
  (22,'http://naver.com/one?ad=115',87,'fringilla. Donec feugiat metus sit','2021-07-10 16:37:45',91),
  (23,'http://ebay.com/user/110?q=0',21,'Sed id risus quis diam luctus lobortis. Class aptent taciti','2022-10-20 22:05:22',25),
  (24,'http://whatsapp.com/sub/cars?q=11',42,'parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse','2022-11-04 03:07:22',80),
  (25,'http://pinterest.com/site?ad=115',51,'netus et malesuada fames ac turpis egestas. Fusce aliquet','2021-09-06 04:19:05',53),
  (26,'https://netflix.com/settings?search=1',15,'id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut','2021-06-25 01:10:48',92),
  (27,'https://naver.com/settings?q=11',79,'sagittis. Duis gravida. Praesent eu nulla','2022-09-25 01:51:55',18),
  (28,'http://twitter.com/settings?page=1&offset=1',86,'fames ac','2022-10-20 20:09:36',87),
  (29,'https://guardian.co.uk/en-us?client=g',10,'ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit','2021-08-31 23:25:07',99),
  (30,'http://twitter.com/sub?q=0',81,'semper rutrum. Fusce dolor quam, elementum','2022-04-11 06:52:11',99);
INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (31,'https://bbc.co.uk/user/110?p=8',82,'libero et','2022-12-02 13:01:24',91),
  (32,'https://walmart.com/en-us?k=0',95,'justo eu arcu. Morbi sit amet','2021-05-16 17:59:15',82),
  (33,'http://google.com/sub/cars?g=1',63,'quis urna. Nunc quis arcu vel quam','2022-01-18 12:25:30',11),
  (34,'http://guardian.co.uk/sub?k=0',84,'lacus. Cras interdum. Nunc sollicitudin','2021-08-05 21:59:51',42),
  (35,'https://guardian.co.uk/one?q=test',90,'Vestibulum ante','2021-12-23 23:12:37',95),
  (36,'https://zoom.us/fr?gi=100',1,'euismod urna. Nullam lobortis','2021-08-31 03:53:58',15),
  (37,'http://google.com/fr?q=4',24,'in, cursus et, eros. Proin ultrices.','2021-09-04 09:40:27',74),
  (38,'https://facebook.com/en-ca?page=1&offset=1',9,'justo sit amet nulla. Donec non justo.','2022-08-09 12:28:57',95),
  (39,'http://reddit.com/one?page=1&offset=1',12,'vel est','2022-12-02 11:24:07',26),
  (40,'https://bbc.co.uk/group/9?gi=100',9,'tellus faucibus leo, in lobortis','2022-12-11 23:48:15',59);
INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (41,'https://bbc.co.uk/site?q=11',78,'arcu. Morbi sit amet massa. Quisque porttitor eros nec','2023-02-16 10:50:56',13),
  (42,'https://nytimes.com/settings?client=g',33,'diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget,','2023-03-08 23:53:38',45),
  (43,'http://facebook.com/site?client=g',65,'rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,','2022-08-17 11:20:10',94),
  (44,'http://baidu.com/en-us?ab=441&aad=2',5,'condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec','2023-01-09 17:10:37',53),
  (45,'http://yahoo.com/sub/cars?q=test',11,'egestas a, scelerisque','2022-12-18 07:53:24',15),
  (46,'https://guardian.co.uk/sub/cars?q=test',86,'Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus.','2022-12-19 21:03:30',69),
  (47,'http://nytimes.com/en-us?ad=115',76,'eu odio tristique pharetra.','2021-08-16 00:00:41',44),
  (48,'https://wikipedia.org/en-us?q=test',43,'nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec,','2022-12-28 17:15:19',70),
  (49,'https://baidu.com/en-us?str=se',31,'a, arcu. Sed et','2023-01-01 11:51:53',20),
  (50,'https://wikipedia.org/settings?ab=441&aad=2',19,'et, magna. Praesent interdum ligula eu enim.','2022-03-28 17:38:32',65);
INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (51,'https://pinterest.com/en-us?page=1&offset=1',54,'tempor arcu. Vestibulum ut eros non enim','2022-06-10 21:11:02',50),
  (52,'http://walmart.com/sub/cars?q=4',50,'ipsum dolor sit amet, consectetuer adipiscing elit.','2021-10-27 00:41:03',61),
  (53,'http://nytimes.com/user/110?q=11',98,'vitae aliquam eros turpis non enim. Mauris quis','2021-07-31 13:13:30',78),
  (54,'https://twitter.com/one?g=1',64,'mi. Duis risus odio, auctor vitae, aliquet nec,','2022-02-20 17:25:11',95),
  (55,'https://twitter.com/site?q=0',27,'Fusce aliquam,','2023-02-16 12:43:56',14),
  (56,'http://bbc.co.uk/site?client=g',60,'et, commodo at,','2021-06-08 05:24:54',64),
  (57,'http://yahoo.com/one?q=4',21,'Donec non justo. Proin non massa','2022-02-01 18:54:33',42),
  (58,'http://naver.com/site?q=0',45,'a ultricies adipiscing, enim mi tempor lorem, eget','2022-08-10 05:56:35',48),
  (59,'https://reddit.com/settings?q=11',23,'dis parturient montes, nascetur','2023-04-20 12:48:28',63),
  (60,'https://zoom.us/group/9?ab=441&aad=2',92,'quam. Pellentesque habitant morbi tristique senectus','2021-05-29 04:00:58',73);
INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (61,'http://bbc.co.uk/en-ca?search=1&q=de',62,'eget odio. Aliquam vulputate','2021-06-17 21:01:08',69),
  (62,'http://walmart.com/en-us?q=test',21,'Nullam enim. Sed nulla ante, iaculis nec, eleifend non,','2021-05-10 17:32:18',76),
  (63,'https://yahoo.com/en-ca?gi=100',23,'interdum. Curabitur dictum. Phasellus','2021-05-09 07:55:00',96),
  (64,'http://ebay.com/fr?str=se',50,'vehicula','2023-02-03 00:35:47',95),
  (65,'http://netflix.com/sub?gi=100',13,'Nunc lectus pede, ultrices','2023-01-20 08:12:36',58),
  (66,'http://twitter.com/fr?client=g',58,'fermentum','2022-02-20 22:27:44',69),
  (67,'http://whatsapp.com/fr?ab=441&aad=2',53,'nisi sem semper erat, in consectetuer ipsum nunc id','2022-10-17 01:21:44',18),
  (68,'http://google.com/one?ab=441&aad=2',31,'non, sollicitudin a, malesuada id,','2022-07-23 03:03:01',83),
  (69,'https://nytimes.com/settings?search=1',60,'sit amet,','2021-07-07 15:49:47',58),
  (70,'http://pinterest.com/sub?search=1&q=de',74,'torquent per conubia nostra, per inceptos hymenaeos.','2022-02-20 15:11:50',62);
INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (71,'http://yahoo.com/fr?g=1',63,'at arcu. Vestibulum','2022-11-05 11:16:44',84),
  (72,'http://ebay.com/en-ca?search=1',13,'Vestibulum','2022-03-01 04:50:59',53),
  (73,'https://walmart.com/group/9?ad=115',77,'aptent taciti sociosqu ad litora','2023-01-16 08:17:03',81),
  (74,'https://netflix.com/settings?client=g',60,'mauris ut mi. Duis risus','2022-08-08 05:30:30',12),
  (75,'http://instagram.com/fr?ab=441&aad=2',46,'Donec nibh.','2023-04-06 02:08:42',91),
  (76,'https://whatsapp.com/fr?k=0',62,'velit. Sed malesuada augue ut lacus.','2022-04-19 14:36:53',54),
  (77,'https://whatsapp.com/fr?q=4',42,'condimentum eget, volutpat ornare, facilisis eget,','2023-01-14 03:06:50',39),
  (78,'https://walmart.com/site?page=1&offset=1',65,'non, vestibulum nec, euismod in, dolor. Fusce feugiat.','2022-05-09 10:59:36',69),
  (79,'http://netflix.com/user/110?str=se',56,'et netus et malesuada fames','2021-11-27 08:49:14',20),
  (80,'http://naver.com/one?str=se',49,'ante. Vivamus non lorem vitae','2021-07-12 23:12:49',66);
INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (81,'https://whatsapp.com/one?gi=100',14,'dolor sit','2023-04-17 00:53:04',64),
  (82,'http://google.com/one?p=8',65,'velit. Cras lorem lorem, luctus ut, pellentesque','2023-04-08 03:47:58',53),
  (83,'http://naver.com/en-ca?q=test',85,'dolor. Nulla semper','2022-07-30 12:06:27',16),
  (84,'http://guardian.co.uk/user/110?q=11',74,'nunc risus varius','2021-08-12 08:48:18',99),
  (85,'https://google.com/group/9?page=1&offset=1',34,'ipsum dolor sit amet,','2022-12-15 16:52:33',75),
  (86,'http://bbc.co.uk/sub/cars?ab=441&aad=2',24,'Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede,','2023-01-14 07:21:34',41),
  (87,'https://nytimes.com/user/110?q=4',54,'pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper','2023-03-08 15:11:05',38),
  (88,'https://ebay.com/fr?ab=441&aad=2',60,'libero. Donec consectetuer mauris id sapien. Cras dolor','2022-08-21 22:35:51',40),
  (89,'https://facebook.com/en-ca?client=g',59,'fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus','2023-03-06 14:21:37',93),
  (90,'http://twitter.com/site?k=0',86,'Mauris molestie pharetra','2021-11-28 05:21:03',93);
INSERT INTO video (id,url,owner_id,description,uploaded_at,size)
VALUES
  (91,'https://walmart.com/settings?q=11',74,'dictum placerat, augue. Sed molestie. Sed id risus','2022-12-19 16:30:23',74),
  (92,'https://bbc.co.uk/group/9?ab=441&aad=2',47,'aliquet molestie','2022-08-22 07:54:57',21),
  (93,'https://guardian.co.uk/site?ad=115',68,'fermentum risus, at','2022-10-07 00:48:41',57),
  (94,'https://pinterest.com/sub/cars?q=11',64,'dis parturient montes,','2022-12-26 17:36:45',40),
  (95,'https://facebook.com/user/110?g=1',49,'luctus vulputate, nisi sem semper erat, in consectetuer','2022-04-28 21:12:04',68),
  (96,'https://naver.com/fr?p=8',81,'quis urna. Nunc quis arcu vel','2022-10-13 23:04:28',45),
  (97,'https://bbc.co.uk/sub/cars?search=1&q=de',33,'accumsan convallis, ante','2022-05-10 03:10:21',16),
  (98,'https://google.com/site?g=1',65,'Nulla dignissim. Maecenas ornare egestas ligula.','2021-10-13 23:02:59',71),
  (99,'https://naver.com/settings?g=1',56,'faucibus orci luctus et ultrices posuere cubilia Curae','2021-10-22 17:44:36',12),
  (100,'http://yahoo.com/fr?p=8',73,'odio,','2022-01-07 04:26:29',81);
