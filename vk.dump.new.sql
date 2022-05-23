--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10 (Ubuntu 12.10-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.10 (Ubuntu 12.10-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- ALTER TABLE ONLY public.video DROP CONSTRAINT video_owner_id_fk;
-- ALTER TABLE ONLY public.users DROP CONSTRAINT users_main_photo_id_fk;
-- ALTER TABLE ONLY public.photo DROP CONSTRAINT photo_owner_id_fk;
-- ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_to_user_id_fk;
-- ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_from_user_id_fk;
-- ALTER TABLE ONLY public.friendship DROP CONSTRAINT friendship_status_id_fk;
-- ALTER TABLE ONLY public.friendship DROP CONSTRAINT friendship_requested_to_user_id_fk;
-- ALTER TABLE ONLY public.friendship DROP CONSTRAINT friendship_requested_by_user_id_fk;
-- ALTER TABLE ONLY public.communities_users DROP CONSTRAINT communities_users_user_id_fk;
-- ALTER TABLE ONLY public.communities_users DROP CONSTRAINT communities_users_community_id_fk;
-- ALTER TABLE ONLY public.communities DROP CONSTRAINT communities_creator_id_fk;
-- ALTER TABLE ONLY public.video DROP CONSTRAINT video_url_key;
-- ALTER TABLE ONLY public.video DROP CONSTRAINT video_pkey;
-- ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
-- ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
-- ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
-- ALTER TABLE ONLY public.photo DROP CONSTRAINT photo_url_key;
-- ALTER TABLE ONLY public.photo DROP CONSTRAINT photo_pkey;
-- ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
-- ALTER TABLE ONLY public.friendship_statuses DROP CONSTRAINT friendship_statuses_pkey;
-- ALTER TABLE ONLY public.friendship_statuses DROP CONSTRAINT friendship_statuses_name_key;
-- ALTER TABLE ONLY public.friendship DROP CONSTRAINT friendship_pkey;
-- ALTER TABLE ONLY public.communities_users DROP CONSTRAINT communities_users_pkey;
-- ALTER TABLE ONLY public.communities DROP CONSTRAINT communities_pkey;
-- ALTER TABLE ONLY public.communities DROP CONSTRAINT communities_name_key;
-- ALTER TABLE public.video ALTER COLUMN id DROP DEFAULT;
-- ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
-- ALTER TABLE public.photo ALTER COLUMN id DROP DEFAULT;
-- ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
-- ALTER TABLE public.friendship_statuses ALTER COLUMN id DROP DEFAULT;
-- ALTER TABLE public.friendship ALTER COLUMN id DROP DEFAULT;
-- ALTER TABLE public.communities ALTER COLUMN id DROP DEFAULT;
-- DROP SEQUENCE public.video_id_seq;
-- DROP TABLE public.video;
-- DROP SEQUENCE public.users_id_seq;
-- DROP TABLE public.users;
-- DROP SEQUENCE public.photo_id_seq;
-- DROP TABLE public.photo;
-- DROP SEQUENCE public.messages_id_seq;
-- DROP TABLE public.messages;
-- DROP SEQUENCE public.friendship_statuses_id_seq;
-- DROP TABLE public.friendship_statuses;
-- DROP SEQUENCE public.friendship_id_seq;
-- DROP TABLE public.friendship;
-- DROP TABLE public.communities_users;
-- DROP SEQUENCE public.communities_id_seq;
-- DROP TABLE public.communities;
-- DROP TYPE public.contacts;

--
-- Name: contacts; Type: TYPE; Schema: public; Owner: gb_user
--

-- CREATE TYPE public.contacts AS (
-- 	phone character varying(15),
-- 	email character varying(120)
-- );
--
--
-- ALTER TYPE public.contacts OWNER TO gb_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone,
    members integer[]
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    is_subscriber boolean
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone,
    is_subscriber boolean
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL,
    metadata json
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone,
    user_contacts public.contacts
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.communities VALUES (1, 'mus. Donec', 44, '2022-04-20 06:12:58', NULL);
INSERT INTO public.communities VALUES (2, 'dolor.', 26, '2021-08-30 04:57:41', NULL);
INSERT INTO public.communities VALUES (4, 'eu enim.', 11, '2022-01-10 23:08:29', NULL);
INSERT INTO public.communities VALUES (5, 'pharetra.', 83, '2022-04-30 06:36:13', NULL);
INSERT INTO public.communities VALUES (6, 'nisi dictum augue', 49, '2022-07-08 22:08:47', NULL);
INSERT INTO public.communities VALUES (7, 'metus sit amet', 3, '2021-07-11 04:48:33', NULL);
INSERT INTO public.communities VALUES (8, 'ante ipsum primis', 68, '2022-11-12 14:37:01', NULL);
INSERT INTO public.communities VALUES (9, 'mauris a nunc.', 51, '2021-07-26 19:48:33', NULL);
INSERT INTO public.communities VALUES (10, 'at, nisi.', 58, '2021-08-23 03:44:28', NULL);
INSERT INTO public.communities VALUES (11, 'fames', 89, '2021-07-24 21:58:24', NULL);
INSERT INTO public.communities VALUES (12, 'mauris sit', 27, '2021-06-25 08:48:56', NULL);
INSERT INTO public.communities VALUES (13, 'arcu vel', 13, '2022-05-03 07:17:00', NULL);
INSERT INTO public.communities VALUES (14, 'faucibus. Morbi', 53, '2022-01-29 22:14:03', NULL);
INSERT INTO public.communities VALUES (15, 'faucibus lectus,', 75, '2023-04-02 09:48:32', NULL);
INSERT INTO public.communities VALUES (16, 'mattis. Cras', 46, '2021-10-30 14:12:34', NULL);
INSERT INTO public.communities VALUES (17, 'massa non', 1, '2022-09-22 16:17:29', NULL);
INSERT INTO public.communities VALUES (18, 'auctor vitae, aliquet', 30, '2023-03-12 18:54:11', NULL);
INSERT INTO public.communities VALUES (19, 'egestas a,', 28, '2023-01-23 16:53:00', NULL);
INSERT INTO public.communities VALUES (20, 'Nam', 58, '2022-03-23 12:59:37', NULL);
INSERT INTO public.communities VALUES (21, 'sed libero.', 83, '2022-09-07 22:37:17', NULL);
INSERT INTO public.communities VALUES (22, 'diam vel', 92, '2023-02-11 04:23:01', NULL);
INSERT INTO public.communities VALUES (23, 'vel nisl. Quisque', 74, '2022-08-15 16:29:58', NULL);
INSERT INTO public.communities VALUES (24, 'tristique aliquet.', 56, '2023-02-05 00:43:31', NULL);
INSERT INTO public.communities VALUES (25, 'nec, euismod', 29, '2022-07-20 10:22:48', NULL);
INSERT INTO public.communities VALUES (26, 'erat,', 64, '2021-10-01 15:49:03', NULL);
INSERT INTO public.communities VALUES (27, 'Maecenas', 56, '2021-08-11 00:27:30', NULL);
INSERT INTO public.communities VALUES (28, 'nunc, ullamcorper', 70, '2021-11-19 01:28:33', NULL);
INSERT INTO public.communities VALUES (29, 'amet risus.', 55, '2022-08-17 11:01:20', NULL);
INSERT INTO public.communities VALUES (30, 'quam', 16, '2022-04-26 11:40:49', NULL);
INSERT INTO public.communities VALUES (31, 'nisl. Quisque', 24, '2021-07-07 19:10:15', NULL);
INSERT INTO public.communities VALUES (32, 'vel', 5, '2022-08-27 02:42:05', NULL);
INSERT INTO public.communities VALUES (33, 'eleifend. Cras', 61, '2021-06-16 01:05:29', NULL);
INSERT INTO public.communities VALUES (34, 'nisl elementum', 61, '2021-08-08 10:39:24', NULL);
INSERT INTO public.communities VALUES (35, 'sem,', 82, '2022-04-26 16:12:14', NULL);
INSERT INTO public.communities VALUES (36, 'dictum. Phasellus', 35, '2021-06-01 17:51:20', NULL);
INSERT INTO public.communities VALUES (37, 'convallis', 93, '2022-09-16 17:37:28', NULL);
INSERT INTO public.communities VALUES (38, 'nunc sed', 92, '2021-09-16 21:18:54', NULL);
INSERT INTO public.communities VALUES (39, 'quam vel', 8, '2021-05-07 03:00:37', NULL);
INSERT INTO public.communities VALUES (40, 'Donec tempor,', 68, '2021-10-26 06:26:38', NULL);
INSERT INTO public.communities VALUES (41, 'Pellentesque ut', 73, '2022-06-10 22:39:19', NULL);
INSERT INTO public.communities VALUES (42, 'tempor arcu.', 11, '2022-03-05 08:20:03', NULL);
INSERT INTO public.communities VALUES (43, 'tellus. Phasellus', 20, '2022-11-07 21:50:50', NULL);
INSERT INTO public.communities VALUES (44, 'arcu. Morbi', 73, '2021-09-15 21:50:18', NULL);
INSERT INTO public.communities VALUES (45, 'mollis lectus', 14, '2023-04-09 06:18:54', NULL);
INSERT INTO public.communities VALUES (46, 'Cum sociis', 91, '2022-08-15 07:49:06', NULL);
INSERT INTO public.communities VALUES (47, 'interdum libero', 71, '2021-04-20 00:20:55', NULL);
INSERT INTO public.communities VALUES (48, 'Phasellus', 86, '2022-11-01 23:59:46', NULL);
INSERT INTO public.communities VALUES (49, 'et,', 32, '2023-03-07 09:30:52', NULL);
INSERT INTO public.communities VALUES (50, 'fermentum', 63, '2021-12-06 15:08:57', NULL);
INSERT INTO public.communities VALUES (51, 'Phasellus asdsa', 11, '2021-08-28 04:42:41', NULL);
INSERT INTO public.communities VALUES (52, 'sedqw', 56, '2022-05-18 16:00:52', NULL);
INSERT INTO public.communities VALUES (53, 'luctus Curabitur', 66, '2021-06-12 14:24:17', NULL);
INSERT INTO public.communities VALUES (54, 'ante qwqe', 90, '2021-09-17 15:08:08', NULL);
INSERT INTO public.communities VALUES (55, 'Nuncqwe ac', 11, '2022-06-29 21:30:34', NULL);
INSERT INTO public.communities VALUES (56, 'feugiat. Lorem ipsum', 40, '2021-09-30 05:38:06', NULL);
INSERT INTO public.communities VALUES (57, 'dictum dqwe', 16, '2022-07-12 16:03:09', NULL);
INSERT INTO public.communities VALUES (58, 'utrr sdasd', 22, '2022-10-11 11:28:01', NULL);
INSERT INTO public.communities VALUES (59, 'velit justo nec', 60, '2023-02-16 16:54:21', NULL);
INSERT INTO public.communities VALUES (60, 'euismod urna.', 78, '2022-10-09 19:23:14', NULL);
INSERT INTO public.communities VALUES (61, 'lectus convallis', 98, '2021-10-16 11:44:58', NULL);
INSERT INTO public.communities VALUES (62, 'fermentum arcu.', 69, '2023-03-27 19:50:35', NULL);
INSERT INTO public.communities VALUES (63, 'ultrices. Vivamus', 54, '2022-10-18 04:00:46', NULL);
INSERT INTO public.communities VALUES (64, 'adipiscing elit.', 64, '2021-04-17 18:25:05', NULL);
INSERT INTO public.communities VALUES (65, 'interdum. Curabitur dictum.', 47, '2021-09-07 22:57:12', NULL);
INSERT INTO public.communities VALUES (66, 'eu sem.', 49, '2021-09-01 22:38:32', NULL);
INSERT INTO public.communities VALUES (67, 'ut asdqwd', 1, '2021-08-06 10:23:23', NULL);
INSERT INTO public.communities VALUES (68, 'Praesent wedwqe', 69, '2021-04-10 01:26:28', NULL);
INSERT INTO public.communities VALUES (69, 'aliquet. Proin', 91, '2022-02-07 02:09:28', NULL);
INSERT INTO public.communities VALUES (70, 'odio.', 76, '2023-03-08 13:06:59', NULL);
INSERT INTO public.communities VALUES (71, 'tellus', 43, '2022-11-05 12:47:45', NULL);
INSERT INTO public.communities VALUES (72, 'sem semper', 75, '2022-06-30 23:44:29', NULL);
INSERT INTO public.communities VALUES (73, 'urna,', 83, '2021-04-15 18:08:52', NULL);
INSERT INTO public.communities VALUES (74, 'non', 27, '2022-07-22 21:00:41', NULL);
INSERT INTO public.communities VALUES (75, 'quis urna.', 51, '2022-01-15 05:06:31', NULL);
INSERT INTO public.communities VALUES (76, 'Cras vehicula', 47, '2022-03-06 01:45:17', NULL);
INSERT INTO public.communities VALUES (77, 'dolor elit, pellentesque', 43, '2021-10-24 23:03:26', NULL);
INSERT INTO public.communities VALUES (78, 'ipsum porta', 37, '2022-11-26 15:32:42', NULL);
INSERT INTO public.communities VALUES (79, 'orci lacus', 38, '2022-01-13 03:23:54', NULL);
INSERT INTO public.communities VALUES (80, 'tortor nibh', 69, '2021-05-14 13:09:08', NULL);
INSERT INTO public.communities VALUES (81, 'eget magna.', 67, '2022-06-28 22:18:14', NULL);
INSERT INTO public.communities VALUES (82, 'et pede.', 43, '2021-06-05 14:40:31', NULL);
INSERT INTO public.communities VALUES (83, 'magnis dis parturient', 90, '2022-11-21 06:19:23', NULL);
INSERT INTO public.communities VALUES (84, 'vestibulum. Mauris magna.', 41, '2022-01-01 02:19:24', NULL);
INSERT INTO public.communities VALUES (85, 'atsd nisi.', 36, '2022-10-08 11:08:03', NULL);
INSERT INTO public.communities VALUES (86, 'arcu iaculis', 94, '2022-02-15 20:28:49', NULL);
INSERT INTO public.communities VALUES (87, 'nisi. Cum', 19, '2022-10-14 23:29:44', NULL);
INSERT INTO public.communities VALUES (88, 'pharetra. Quisque', 20, '2022-03-20 13:41:58', NULL);
INSERT INTO public.communities VALUES (89, 'eu dui.', 48, '2022-08-30 05:32:46', NULL);
INSERT INTO public.communities VALUES (90, 'dolor. Nulla', 56, '2022-03-18 21:36:26', NULL);
INSERT INTO public.communities VALUES (91, 'Duis sit amet', 30, '2021-06-07 21:46:52', NULL);
INSERT INTO public.communities VALUES (92, 'facilisis sdf', 20, '2022-11-24 00:12:41', NULL);
INSERT INTO public.communities VALUES (93, 'feugiat non, lobortis', 63, '2022-08-29 13:03:45', NULL);
INSERT INTO public.communities VALUES (94, 'placerat. Cras dictum', 55, '2021-09-15 16:04:49', NULL);
INSERT INTO public.communities VALUES (95, 'tortor at risus.', 94, '2022-05-22 14:10:34', NULL);
INSERT INTO public.communities VALUES (96, 'ullamcorper.', 2, '2021-07-25 15:59:21', NULL);
INSERT INTO public.communities VALUES (97, 'Cras sdf', 86, '2021-09-10 12:04:23', NULL);
INSERT INTO public.communities VALUES (98, 'volutpat.', 38, '2021-07-21 07:38:54', NULL);
INSERT INTO public.communities VALUES (99, 'antesdf ipsum primis', 23, '2021-08-06 20:06:36', NULL);
INSERT INTO public.communities VALUES (100, 'Mauris molestie', 20, '2021-05-18 21:03:54', NULL);
INSERT INTO public.communities VALUES (3, 'enim', 84, '2022-04-15 00:43:01', '{55,60,100,20}');


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.communities_users VALUES (30, 75, '2022-07-09 01:53:51', false);
INSERT INTO public.communities_users VALUES (26, 82, '2021-06-06 06:16:23', true);
INSERT INTO public.communities_users VALUES (14, 35, '2023-01-15 16:35:56', false);
INSERT INTO public.communities_users VALUES (98, 37, '2022-07-13 12:58:04', false);
INSERT INTO public.communities_users VALUES (66, 59, '2023-04-03 17:22:58', false);
INSERT INTO public.communities_users VALUES (63, 22, '2022-07-25 16:49:44', false);
INSERT INTO public.communities_users VALUES (84, 77, '2022-02-05 18:56:22', false);
INSERT INTO public.communities_users VALUES (100, 73, '2022-01-03 23:20:29', true);
INSERT INTO public.communities_users VALUES (18, 21, '2022-11-11 11:19:43', false);
INSERT INTO public.communities_users VALUES (72, 29, '2022-09-18 07:14:16', false);
INSERT INTO public.communities_users VALUES (25, 71, '2022-05-20 14:59:51', false);
INSERT INTO public.communities_users VALUES (77, 68, '2021-07-16 15:01:23', false);
INSERT INTO public.communities_users VALUES (94, 12, '2021-05-13 11:48:32', false);
INSERT INTO public.communities_users VALUES (82, 68, '2023-02-16 23:25:34', false);
INSERT INTO public.communities_users VALUES (5, 31, '2022-02-02 10:14:50', false);
INSERT INTO public.communities_users VALUES (43, 33, '2022-09-21 20:27:17', true);
INSERT INTO public.communities_users VALUES (96, 75, '2021-08-08 05:27:36', false);
INSERT INTO public.communities_users VALUES (38, 40, '2023-04-07 02:30:20', true);
INSERT INTO public.communities_users VALUES (100, 61, '2022-04-30 07:27:22', false);
INSERT INTO public.communities_users VALUES (85, 98, '2022-10-20 11:12:58', true);
INSERT INTO public.communities_users VALUES (65, 33, '2021-12-29 02:41:01', true);
INSERT INTO public.communities_users VALUES (53, 71, '2022-04-18 04:44:22', false);
INSERT INTO public.communities_users VALUES (73, 74, '2021-11-11 16:04:36', false);
INSERT INTO public.communities_users VALUES (36, 29, '2021-11-14 19:04:51', true);
INSERT INTO public.communities_users VALUES (91, 86, '2023-01-11 07:42:10', false);
INSERT INTO public.communities_users VALUES (7, 21, '2021-07-16 10:11:12', false);
INSERT INTO public.communities_users VALUES (6, 75, '2022-12-04 03:46:46', false);
INSERT INTO public.communities_users VALUES (13, 94, '2021-10-21 06:18:21', true);
INSERT INTO public.communities_users VALUES (14, 53, '2022-06-03 06:39:59', false);
INSERT INTO public.communities_users VALUES (15, 21, '2022-11-05 05:31:58', false);
INSERT INTO public.communities_users VALUES (100, 87, '2021-12-18 04:06:31', false);
INSERT INTO public.communities_users VALUES (59, 25, '2022-05-24 20:13:31', true);
INSERT INTO public.communities_users VALUES (51, 35, '2021-11-02 20:58:00', true);
INSERT INTO public.communities_users VALUES (56, 52, '2023-04-08 05:55:40', false);
INSERT INTO public.communities_users VALUES (36, 88, '2021-11-19 07:12:13', true);
INSERT INTO public.communities_users VALUES (25, 88, '2021-07-07 13:16:05', false);
INSERT INTO public.communities_users VALUES (92, 19, '2021-07-31 06:06:08', true);
INSERT INTO public.communities_users VALUES (89, 17, '2021-06-03 06:55:14', true);
INSERT INTO public.communities_users VALUES (19, 35, '2021-09-07 19:19:46', false);
INSERT INTO public.communities_users VALUES (38, 5, '2022-07-24 01:38:27', true);
INSERT INTO public.communities_users VALUES (58, 43, '2021-06-22 08:58:39', true);
INSERT INTO public.communities_users VALUES (18, 42, '2021-06-29 07:24:57', true);
INSERT INTO public.communities_users VALUES (78, 13, '2021-11-27 08:17:26', true);
INSERT INTO public.communities_users VALUES (37, 30, '2021-10-24 19:43:34', false);
INSERT INTO public.communities_users VALUES (67, 75, '2023-04-13 02:27:40', true);
INSERT INTO public.communities_users VALUES (70, 82, '2022-12-20 03:03:03', false);
INSERT INTO public.communities_users VALUES (30, 37, '2021-12-08 13:17:07', true);
INSERT INTO public.communities_users VALUES (96, 100, '2022-11-10 05:45:35', false);
INSERT INTO public.communities_users VALUES (28, 16, '2022-06-12 22:59:59', false);
INSERT INTO public.communities_users VALUES (4, 98, '2023-04-19 06:16:57', true);
INSERT INTO public.communities_users VALUES (22, 60, '2022-04-19 17:53:06', false);
INSERT INTO public.communities_users VALUES (67, 50, '2021-11-19 07:24:06', true);
INSERT INTO public.communities_users VALUES (10, 82, '2023-02-22 02:36:38', true);
INSERT INTO public.communities_users VALUES (71, 62, '2022-05-11 09:40:13', true);
INSERT INTO public.communities_users VALUES (55, 96, '2022-10-02 08:22:13', false);
INSERT INTO public.communities_users VALUES (83, 57, '2022-12-11 16:42:51', true);
INSERT INTO public.communities_users VALUES (28, 11, '2022-05-26 21:36:24', false);
INSERT INTO public.communities_users VALUES (35, 10, '2022-07-19 17:07:41', false);
INSERT INTO public.communities_users VALUES (7, 38, '2022-04-06 18:30:01', true);
INSERT INTO public.communities_users VALUES (47, 66, '2023-02-19 10:28:48', false);
INSERT INTO public.communities_users VALUES (91, 63, '2021-11-18 17:27:39', false);
INSERT INTO public.communities_users VALUES (8, 43, '2023-01-25 14:51:24', false);
INSERT INTO public.communities_users VALUES (46, 36, '2021-09-28 01:46:05', true);
INSERT INTO public.communities_users VALUES (60, 19, '2022-12-20 22:57:33', false);
INSERT INTO public.communities_users VALUES (83, 8, '2022-10-14 10:14:23', false);
INSERT INTO public.communities_users VALUES (50, 89, '2022-08-14 15:31:45', false);
INSERT INTO public.communities_users VALUES (1, 96, '2021-12-14 15:47:47', false);
INSERT INTO public.communities_users VALUES (98, 95, '2022-03-04 01:01:41', false);
INSERT INTO public.communities_users VALUES (19, 62, '2023-01-31 07:40:11', false);
INSERT INTO public.communities_users VALUES (9, 11, '2022-06-22 13:36:31', true);
INSERT INTO public.communities_users VALUES (78, 90, '2022-01-31 11:58:06', false);
INSERT INTO public.communities_users VALUES (41, 88, '2021-08-07 14:24:42', true);
INSERT INTO public.communities_users VALUES (93, 13, '2022-08-14 06:03:00', false);
INSERT INTO public.communities_users VALUES (21, 7, '2023-02-26 02:57:00', true);
INSERT INTO public.communities_users VALUES (86, 59, '2022-12-23 20:18:21', false);
INSERT INTO public.communities_users VALUES (53, 26, '2023-01-13 07:35:13', false);
INSERT INTO public.communities_users VALUES (19, 58, '2021-11-07 19:29:28', false);
INSERT INTO public.communities_users VALUES (64, 82, '2022-03-31 01:16:11', true);
INSERT INTO public.communities_users VALUES (11, 48, '2021-11-26 11:25:42', true);
INSERT INTO public.communities_users VALUES (14, 86, '2021-08-11 08:23:35', true);
INSERT INTO public.communities_users VALUES (54, 39, '2022-04-29 01:17:08', true);
INSERT INTO public.communities_users VALUES (99, 89, '2023-04-10 15:59:12', true);
INSERT INTO public.communities_users VALUES (3, 79, '2022-03-13 02:18:24', false);
INSERT INTO public.communities_users VALUES (8, 7, '2022-12-17 12:05:09', true);
INSERT INTO public.communities_users VALUES (57, 85, '2021-12-24 14:12:57', true);
INSERT INTO public.communities_users VALUES (35, 29, '2022-06-01 05:07:46', true);
INSERT INTO public.communities_users VALUES (85, 73, '2022-01-18 19:17:54', true);
INSERT INTO public.communities_users VALUES (34, 7, '2021-07-20 06:22:25', true);
INSERT INTO public.communities_users VALUES (73, 77, '2022-03-21 19:15:43', false);
INSERT INTO public.communities_users VALUES (95, 53, '2023-01-05 04:42:46', true);


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.friendship VALUES (1, 67, 46, 4, '2022-05-27 14:57:09', '2022-05-07 04:29:04', true);
INSERT INTO public.friendship VALUES (2, 65, 72, 1, '2021-10-23 18:44:24', '2022-09-13 20:26:41', false);
INSERT INTO public.friendship VALUES (3, 59, 16, 4, '2021-12-12 15:50:51', '2022-03-12 22:04:43', true);
INSERT INTO public.friendship VALUES (4, 72, 2, 2, '2022-09-20 09:35:16', '2022-12-05 22:06:21', false);
INSERT INTO public.friendship VALUES (5, 56, 36, 1, '2021-12-22 19:20:20', '2021-11-04 12:44:00', false);
INSERT INTO public.friendship VALUES (6, 43, 66, 4, '2022-01-07 09:36:10', '2023-03-29 13:27:19', false);
INSERT INTO public.friendship VALUES (7, 17, 6, 4, '2022-11-08 11:58:11', '2021-10-25 07:35:26', true);
INSERT INTO public.friendship VALUES (8, 10, 29, 1, '2021-12-11 16:13:19', '2022-07-02 21:58:35', true);
INSERT INTO public.friendship VALUES (9, 18, 57, 4, '2021-08-21 07:01:06', '2022-07-06 09:30:45', true);
INSERT INTO public.friendship VALUES (10, 51, 90, 3, '2022-06-23 21:27:09', '2021-05-29 19:34:16', false);
INSERT INTO public.friendship VALUES (11, 47, 6, 5, '2021-11-29 14:58:30', '2022-04-23 01:44:57', false);
INSERT INTO public.friendship VALUES (12, 70, 55, 5, '2022-05-11 22:19:25', '2022-06-29 07:05:30', true);
INSERT INTO public.friendship VALUES (13, 16, 13, 4, '2022-03-26 12:58:49', '2021-05-08 17:21:26', false);
INSERT INTO public.friendship VALUES (14, 89, 9, 1, '2022-03-22 08:37:56', '2022-05-21 04:38:16', true);
INSERT INTO public.friendship VALUES (15, 85, 37, 1, '2021-12-04 05:28:29', '2021-04-29 11:58:23', false);
INSERT INTO public.friendship VALUES (16, 65, 40, 4, '2021-09-03 13:34:35', '2022-10-17 05:07:14', false);
INSERT INTO public.friendship VALUES (17, 5, 61, 1, '2021-08-15 12:18:08', '2023-01-18 08:01:11', false);
INSERT INTO public.friendship VALUES (18, 16, 16, 5, '2022-11-17 11:08:40', '2022-05-02 10:35:49', false);
INSERT INTO public.friendship VALUES (19, 23, 8, 2, '2021-09-29 19:15:48', '2022-08-15 23:20:43', false);
INSERT INTO public.friendship VALUES (20, 3, 6, 2, '2022-05-11 19:35:42', '2021-12-11 22:58:44', false);
INSERT INTO public.friendship VALUES (21, 74, 46, 4, '2023-01-24 13:11:48', '2022-01-01 19:55:26', true);
INSERT INTO public.friendship VALUES (22, 61, 54, 1, '2022-04-28 07:35:31', '2021-06-23 12:12:29', true);
INSERT INTO public.friendship VALUES (23, 91, 90, 1, '2022-05-23 11:23:17', '2021-07-01 16:29:59', false);
INSERT INTO public.friendship VALUES (24, 37, 90, 4, '2022-07-29 08:45:59', '2022-01-05 05:08:59', false);
INSERT INTO public.friendship VALUES (25, 73, 22, 4, '2021-05-06 17:26:10', '2021-12-02 03:19:01', false);
INSERT INTO public.friendship VALUES (26, 46, 30, 3, '2022-07-14 19:18:09', '2021-10-03 08:59:47', false);
INSERT INTO public.friendship VALUES (27, 74, 99, 1, '2022-12-05 11:54:33', '2021-12-30 19:04:43', true);
INSERT INTO public.friendship VALUES (28, 12, 26, 2, '2021-06-16 22:09:45', '2022-10-22 18:17:14', true);
INSERT INTO public.friendship VALUES (29, 98, 71, 2, '2023-04-17 19:54:49', '2021-05-03 09:33:05', false);
INSERT INTO public.friendship VALUES (30, 40, 17, 3, '2022-08-11 23:25:50', '2021-11-20 12:39:30', true);
INSERT INTO public.friendship VALUES (31, 14, 75, 3, '2022-06-18 19:20:40', '2022-03-14 01:48:45', false);
INSERT INTO public.friendship VALUES (32, 1, 2, 1, '2023-03-14 07:54:17', '2022-11-25 22:45:02', true);
INSERT INTO public.friendship VALUES (33, 56, 48, 2, '2022-10-08 13:05:58', '2021-11-20 08:23:26', true);
INSERT INTO public.friendship VALUES (34, 42, 6, 1, '2021-11-07 21:20:08', '2022-02-13 16:05:29', true);
INSERT INTO public.friendship VALUES (35, 93, 55, 5, '2023-02-14 11:17:19', '2021-08-06 19:10:25', true);
INSERT INTO public.friendship VALUES (36, 77, 9, 4, '2022-04-01 20:48:30', '2022-05-03 12:37:52', false);
INSERT INTO public.friendship VALUES (37, 79, 38, 4, '2021-08-12 20:22:06', '2021-07-13 23:57:45', false);
INSERT INTO public.friendship VALUES (38, 72, 98, 3, '2021-10-01 07:08:28', '2021-05-05 23:09:03', false);
INSERT INTO public.friendship VALUES (39, 26, 39, 2, '2021-12-07 15:09:19', '2022-10-22 12:28:37', false);
INSERT INTO public.friendship VALUES (40, 50, 40, 4, '2021-05-03 15:34:57', '2021-08-02 08:27:11', false);
INSERT INTO public.friendship VALUES (41, 10, 76, 3, '2021-07-17 03:22:28', '2022-08-18 08:57:02', false);
INSERT INTO public.friendship VALUES (42, 39, 68, 1, '2022-05-25 05:42:29', '2022-07-06 21:39:30', true);
INSERT INTO public.friendship VALUES (43, 62, 29, 1, '2021-09-13 04:39:34', '2022-01-07 16:51:26', false);
INSERT INTO public.friendship VALUES (44, 92, 78, 4, '2022-04-01 01:46:54', '2021-11-02 11:35:57', true);
INSERT INTO public.friendship VALUES (45, 8, 56, 1, '2023-03-28 22:30:18', '2021-09-06 09:46:57', false);
INSERT INTO public.friendship VALUES (46, 62, 2, 3, '2022-12-06 07:36:31', '2021-06-02 04:27:22', true);
INSERT INTO public.friendship VALUES (47, 85, 69, 1, '2021-09-16 16:57:42', '2021-10-06 16:56:55', false);
INSERT INTO public.friendship VALUES (48, 37, 45, 1, '2023-03-14 00:27:42', '2022-09-25 08:07:51', true);
INSERT INTO public.friendship VALUES (49, 50, 49, 1, '2022-12-25 14:29:19', '2023-02-09 13:53:55', false);
INSERT INTO public.friendship VALUES (50, 65, 31, 2, '2021-11-15 20:03:14', '2021-06-16 11:31:51', true);
INSERT INTO public.friendship VALUES (51, 34, 53, 5, '2023-01-01 03:33:16', '2022-10-02 13:43:21', false);
INSERT INTO public.friendship VALUES (52, 15, 36, 2, '2022-11-21 08:42:04', '2022-08-23 23:00:15', true);
INSERT INTO public.friendship VALUES (53, 43, 79, 2, '2022-02-01 08:46:58', '2022-08-16 13:11:12', true);
INSERT INTO public.friendship VALUES (54, 96, 67, 2, '2022-03-01 00:45:28', '2021-10-02 19:57:50', true);
INSERT INTO public.friendship VALUES (55, 99, 69, 3, '2021-12-02 12:03:27', '2023-03-21 13:15:52', false);
INSERT INTO public.friendship VALUES (56, 82, 44, 1, '2023-02-16 09:38:29', '2021-05-14 22:42:57', false);
INSERT INTO public.friendship VALUES (57, 56, 17, 4, '2021-12-19 05:29:36', '2022-01-01 17:12:18', false);
INSERT INTO public.friendship VALUES (58, 11, 3, 4, '2021-04-08 03:04:04', '2023-01-11 18:31:23', false);
INSERT INTO public.friendship VALUES (59, 84, 51, 3, '2021-06-15 03:57:43', '2022-08-05 01:33:10', true);
INSERT INTO public.friendship VALUES (60, 3, 21, 1, '2023-01-12 18:10:37', '2022-04-08 08:19:53', true);
INSERT INTO public.friendship VALUES (61, 10, 16, 1, '2021-04-06 21:55:17', '2022-12-19 06:47:58', false);
INSERT INTO public.friendship VALUES (62, 79, 47, 2, '2023-03-12 06:53:10', '2021-09-18 01:22:08', true);
INSERT INTO public.friendship VALUES (63, 23, 86, 5, '2022-07-31 21:17:32', '2022-04-11 22:20:38', true);
INSERT INTO public.friendship VALUES (64, 30, 31, 3, '2022-07-04 01:13:50', '2021-08-13 06:19:48', true);
INSERT INTO public.friendship VALUES (65, 32, 58, 1, '2023-01-04 22:24:21', '2022-06-11 21:49:40', false);
INSERT INTO public.friendship VALUES (66, 10, 74, 4, '2022-02-26 15:57:53', '2022-10-16 11:31:57', false);
INSERT INTO public.friendship VALUES (67, 72, 68, 3, '2022-02-25 17:09:50', '2022-06-27 05:13:08', false);
INSERT INTO public.friendship VALUES (68, 8, 86, 1, '2022-08-27 08:47:34', '2022-08-14 07:56:22', false);
INSERT INTO public.friendship VALUES (69, 82, 92, 4, '2022-03-07 03:31:24', '2021-12-08 01:05:11', true);
INSERT INTO public.friendship VALUES (70, 7, 4, 2, '2022-04-25 06:43:41', '2021-07-29 01:42:28', false);
INSERT INTO public.friendship VALUES (71, 20, 33, 1, '2022-12-06 12:33:06', '2021-12-15 06:59:21', true);
INSERT INTO public.friendship VALUES (72, 10, 54, 1, '2022-04-05 21:04:21', '2021-06-22 14:05:22', true);
INSERT INTO public.friendship VALUES (73, 89, 26, 2, '2021-04-21 08:12:24', '2022-01-26 17:37:16', true);
INSERT INTO public.friendship VALUES (74, 65, 20, 2, '2022-06-07 07:00:48', '2022-01-14 17:21:15', false);
INSERT INTO public.friendship VALUES (75, 41, 97, 1, '2021-06-13 23:12:14', '2021-12-08 19:27:22', false);
INSERT INTO public.friendship VALUES (76, 33, 34, 2, '2022-03-26 16:39:48', '2022-07-15 12:53:10', true);
INSERT INTO public.friendship VALUES (77, 29, 39, 1, '2021-12-28 15:47:57', '2023-01-15 19:26:50', false);
INSERT INTO public.friendship VALUES (78, 40, 28, 3, '2022-10-24 04:21:32', '2022-10-27 11:10:38', true);
INSERT INTO public.friendship VALUES (79, 15, 93, 2, '2021-10-31 08:17:33', '2022-10-14 03:41:34', true);
INSERT INTO public.friendship VALUES (80, 31, 28, 5, '2021-04-07 16:19:43', '2022-06-03 23:53:32', false);
INSERT INTO public.friendship VALUES (81, 81, 42, 3, '2022-11-29 23:21:05', '2022-08-02 03:56:18', false);
INSERT INTO public.friendship VALUES (82, 18, 47, 4, '2021-07-03 14:25:12', '2023-03-19 01:41:39', false);
INSERT INTO public.friendship VALUES (83, 72, 60, 4, '2022-02-20 16:59:43', '2021-09-15 23:13:19', true);
INSERT INTO public.friendship VALUES (84, 92, 62, 2, '2022-06-19 16:40:03', '2022-10-17 09:21:27', true);
INSERT INTO public.friendship VALUES (85, 65, 89, 1, '2021-09-15 11:57:25', '2023-02-17 08:52:55', true);
INSERT INTO public.friendship VALUES (86, 74, 52, 2, '2022-12-10 09:55:53', '2022-10-11 16:12:12', true);
INSERT INTO public.friendship VALUES (87, 98, 30, 1, '2022-09-14 21:12:37', '2022-11-27 00:43:22', true);
INSERT INTO public.friendship VALUES (88, 86, 25, 3, '2021-09-13 21:31:20', '2021-11-11 08:49:56', false);
INSERT INTO public.friendship VALUES (89, 42, 62, 2, '2023-03-27 21:48:13', '2022-12-11 21:20:28', true);
INSERT INTO public.friendship VALUES (90, 68, 39, 1, '2022-06-06 08:30:11', '2022-08-10 20:39:49', false);
INSERT INTO public.friendship VALUES (91, 60, 66, 1, '2021-08-12 21:27:56', '2021-09-02 01:55:31', true);
INSERT INTO public.friendship VALUES (92, 1, 18, 4, '2023-03-11 03:48:21', '2022-05-15 12:39:12', true);
INSERT INTO public.friendship VALUES (93, 7, 70, 1, '2022-01-13 11:40:50', '2021-11-13 19:13:47', true);
INSERT INTO public.friendship VALUES (94, 52, 44, 1, '2021-06-20 08:12:39', '2021-08-07 14:10:15', true);
INSERT INTO public.friendship VALUES (95, 17, 77, 1, '2022-08-01 06:48:27', '2023-02-08 17:52:47', false);
INSERT INTO public.friendship VALUES (96, 90, 30, 1, '2021-04-15 15:39:06', '2022-03-20 11:17:43', true);
INSERT INTO public.friendship VALUES (97, 7, 9, 5, '2022-06-23 12:23:31', '2021-09-09 22:00:08', false);
INSERT INTO public.friendship VALUES (98, 62, 40, 4, '2023-03-25 11:12:57', '2021-07-20 21:32:26', false);
INSERT INTO public.friendship VALUES (99, 77, 62, 4, '2023-03-16 02:26:51', '2023-04-13 13:51:11', false);
INSERT INTO public.friendship VALUES (100, 10, 10, 3, '2021-10-20 08:37:50', '2022-11-18 20:57:53', false);


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.friendship_statuses VALUES (1, 'ipsum');
INSERT INTO public.friendship_statuses VALUES (2, 'Nullam');
INSERT INTO public.friendship_statuses VALUES (3, 'dignissim');
INSERT INTO public.friendship_statuses VALUES (4, 'Donec');
INSERT INTO public.friendship_statuses VALUES (5, 'sapien,');


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.messages VALUES (1, 94, 96, 'facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a', false, false, '2021-07-25 09:15:45');
INSERT INTO public.messages VALUES (2, 73, 72, 'Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh', true, false, '2021-09-15 22:16:13');
INSERT INTO public.messages VALUES (3, 43, 75, 'lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In', true, false, '2023-01-28 09:08:41');
INSERT INTO public.messages VALUES (4, 90, 1, 'aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla', true, true, '2021-06-09 05:32:06');
INSERT INTO public.messages VALUES (5, 79, 85, 'Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum.', true, false, '2021-05-31 18:52:37');
INSERT INTO public.messages VALUES (6, 27, 30, 'bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer', true, false, '2023-01-06 03:02:24');
INSERT INTO public.messages VALUES (7, 87, 5, 'Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem', false, false, '2023-03-27 06:40:55');
INSERT INTO public.messages VALUES (8, 22, 72, 'eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae', true, false, '2022-06-08 00:24:18');
INSERT INTO public.messages VALUES (9, 86, 39, 'metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper', false, false, '2022-01-12 23:49:54');
INSERT INTO public.messages VALUES (10, 25, 56, 'in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla.', true, true, '2022-06-09 11:24:25');
INSERT INTO public.messages VALUES (11, 64, 85, 'tortor. Integer aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna.', true, true, '2023-01-31 08:21:50');
INSERT INTO public.messages VALUES (12, 32, 2, 'at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor', false, true, '2022-01-26 01:19:24');
INSERT INTO public.messages VALUES (13, 8, 46, 'quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia', true, true, '2021-06-20 11:31:39');
INSERT INTO public.messages VALUES (14, 89, 23, 'senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros.', false, true, '2021-07-03 18:21:31');
INSERT INTO public.messages VALUES (15, 82, 77, 'consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis', false, false, '2021-11-21 18:10:40');
INSERT INTO public.messages VALUES (16, 94, 98, 'ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede', true, false, '2022-01-13 13:39:04');
INSERT INTO public.messages VALUES (17, 57, 21, 'eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque.', false, false, '2021-06-03 02:26:05');
INSERT INTO public.messages VALUES (18, 55, 78, 'neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque', true, true, '2023-03-18 05:54:09');
INSERT INTO public.messages VALUES (19, 70, 14, 'turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed', true, true, '2023-03-02 08:18:27');
INSERT INTO public.messages VALUES (20, 36, 90, 'fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec', true, true, '2021-10-24 20:38:21');
INSERT INTO public.messages VALUES (21, 41, 37, 'arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a', false, true, '2022-10-16 10:06:30');
INSERT INTO public.messages VALUES (22, 19, 74, 'a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et', false, true, '2022-07-10 16:34:27');
INSERT INTO public.messages VALUES (23, 13, 54, 'ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam', false, true, '2021-09-01 06:43:18');
INSERT INTO public.messages VALUES (24, 16, 91, 'pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum', false, true, '2022-02-14 22:50:10');
INSERT INTO public.messages VALUES (25, 43, 8, 'vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem', false, true, '2022-07-16 22:47:04');
INSERT INTO public.messages VALUES (26, 11, 52, 'lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis', true, false, '2022-01-31 22:39:10');
INSERT INTO public.messages VALUES (27, 5, 69, 'fermentum risus, at fringilla purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris', true, true, '2022-10-12 13:56:45');
INSERT INTO public.messages VALUES (28, 42, 72, 'amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit.', false, true, '2022-12-20 00:13:16');
INSERT INTO public.messages VALUES (29, 87, 36, 'arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat', false, false, '2021-04-27 01:02:41');
INSERT INTO public.messages VALUES (30, 56, 8, 'ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,', true, true, '2022-09-15 07:00:26');
INSERT INTO public.messages VALUES (31, 30, 29, 'diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula.', true, false, '2022-11-03 13:12:57');
INSERT INTO public.messages VALUES (32, 94, 19, 'Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc', true, true, '2021-05-23 13:49:49');
INSERT INTO public.messages VALUES (33, 80, 68, 'semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan', false, false, '2022-04-03 23:13:42');
INSERT INTO public.messages VALUES (34, 50, 68, 'sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut cursus luctus, ipsum leo', true, false, '2021-11-02 02:17:39');
INSERT INTO public.messages VALUES (35, 8, 32, 'at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia', false, true, '2021-10-17 10:40:00');
INSERT INTO public.messages VALUES (36, 44, 45, 'sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt', false, false, '2022-01-30 13:50:50');
INSERT INTO public.messages VALUES (37, 94, 62, 'metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero', false, true, '2021-04-22 21:10:30');
INSERT INTO public.messages VALUES (38, 91, 92, 'non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque penatibus et magnis dis', true, true, '2022-03-07 07:48:49');
INSERT INTO public.messages VALUES (39, 9, 23, 'arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus', true, true, '2021-11-01 17:39:05');
INSERT INTO public.messages VALUES (40, 87, 96, 'erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla', true, false, '2022-12-15 01:21:40');
INSERT INTO public.messages VALUES (41, 84, 18, 'Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus', false, true, '2022-06-03 20:31:24');
INSERT INTO public.messages VALUES (42, 21, 89, 'massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim diam vel arcu. Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing non, luctus', true, false, '2023-01-12 11:17:58');
INSERT INTO public.messages VALUES (43, 76, 37, 'sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at', true, true, '2022-10-18 19:18:40');
INSERT INTO public.messages VALUES (44, 8, 19, 'erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin', false, true, '2021-12-12 21:28:36');
INSERT INTO public.messages VALUES (45, 32, 64, 'porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique', false, false, '2021-12-10 00:48:09');
INSERT INTO public.messages VALUES (46, 47, 31, 'ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi felis,', false, false, '2022-05-01 20:06:02');
INSERT INTO public.messages VALUES (47, 3, 77, 'ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris', false, false, '2023-01-29 02:55:05');
INSERT INTO public.messages VALUES (48, 66, 20, 'Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris', false, false, '2022-04-20 21:58:47');
INSERT INTO public.messages VALUES (49, 28, 14, 'erat vel pede blandit congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat', false, true, '2023-04-03 05:30:59');
INSERT INTO public.messages VALUES (50, 57, 27, 'ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit', true, true, '2021-06-04 10:23:41');
INSERT INTO public.messages VALUES (51, 76, 64, 'eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis,', false, false, '2021-08-22 18:47:12');
INSERT INTO public.messages VALUES (52, 31, 73, 'id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh', true, false, '2023-02-24 15:50:43');
INSERT INTO public.messages VALUES (53, 30, 12, 'non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam', false, true, '2021-10-06 20:47:50');
INSERT INTO public.messages VALUES (54, 12, 79, 'orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames', true, true, '2022-01-12 13:22:01');
INSERT INTO public.messages VALUES (55, 24, 25, 'semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis', false, true, '2023-02-09 01:46:12');
INSERT INTO public.messages VALUES (56, 92, 31, 'amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna convallis erat, eget tincidunt dui augue eu tellus. Phasellus elit', false, false, '2022-06-09 16:39:29');
INSERT INTO public.messages VALUES (57, 1, 33, 'turpis. Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui', true, false, '2022-06-25 23:03:55');
INSERT INTO public.messages VALUES (58, 56, 82, 'fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem,', false, true, '2021-08-18 22:16:04');
INSERT INTO public.messages VALUES (59, 83, 72, 'egestas ligula. Nullam feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus.', true, true, '2023-01-25 05:53:41');
INSERT INTO public.messages VALUES (60, 81, 62, 'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras', true, true, '2021-10-03 01:24:40');
INSERT INTO public.messages VALUES (61, 82, 91, 'vitae purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel, vulputate eu, odio. Phasellus at', true, true, '2021-08-28 16:39:37');
INSERT INTO public.messages VALUES (62, 60, 45, 'convallis est, vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse', false, false, '2022-12-29 00:22:02');
INSERT INTO public.messages VALUES (63, 31, 31, 'orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum.', false, false, '2022-12-10 18:11:46');
INSERT INTO public.messages VALUES (64, 60, 2, 'dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim.', true, false, '2022-06-07 20:45:36');
INSERT INTO public.messages VALUES (65, 3, 39, 'amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales nisi magna', false, true, '2021-11-21 10:40:26');
INSERT INTO public.messages VALUES (66, 56, 71, 'Aenean eget metus. In nec orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non,', true, true, '2021-12-17 23:11:25');
INSERT INTO public.messages VALUES (67, 94, 5, 'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas.', true, false, '2023-02-02 05:16:53');
INSERT INTO public.messages VALUES (68, 85, 51, 'dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin', false, true, '2023-02-28 18:43:46');
INSERT INTO public.messages VALUES (69, 7, 93, 'dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas', false, true, '2021-10-12 13:38:03');
INSERT INTO public.messages VALUES (70, 77, 18, 'Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et netus et', false, false, '2022-01-09 04:05:34');
INSERT INTO public.messages VALUES (71, 56, 92, 'Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis velit', true, true, '2021-05-15 07:55:15');
INSERT INTO public.messages VALUES (72, 63, 29, 'ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer', false, true, '2021-09-10 15:52:46');
INSERT INTO public.messages VALUES (73, 64, 87, 'ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec', true, true, '2023-03-15 22:16:43');
INSERT INTO public.messages VALUES (74, 26, 33, 'nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate,', false, false, '2022-06-25 07:07:08');
INSERT INTO public.messages VALUES (75, 58, 90, 'ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis.', false, true, '2022-03-30 15:48:54');
INSERT INTO public.messages VALUES (76, 69, 84, 'Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et', false, true, '2022-05-26 06:14:58');
INSERT INTO public.messages VALUES (77, 85, 22, 'nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet.', false, false, '2022-08-29 21:57:31');
INSERT INTO public.messages VALUES (78, 65, 58, 'ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus', true, false, '2023-02-10 17:05:01');
INSERT INTO public.messages VALUES (79, 66, 34, 'pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed', false, false, '2023-03-07 22:08:26');
INSERT INTO public.messages VALUES (80, 91, 44, 'erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla', true, false, '2021-09-26 07:17:44');
INSERT INTO public.messages VALUES (81, 41, 30, 'aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci,', true, false, '2021-08-05 19:17:47');
INSERT INTO public.messages VALUES (82, 79, 95, 'eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel', true, false, '2022-11-23 16:45:14');
INSERT INTO public.messages VALUES (83, 36, 44, 'amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus', true, true, '2022-08-26 01:32:10');
INSERT INTO public.messages VALUES (84, 78, 84, 'pellentesque eget, dictum placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam', false, true, '2021-04-17 18:58:50');
INSERT INTO public.messages VALUES (85, 4, 51, 'fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem,', true, false, '2023-03-20 10:24:34');
INSERT INTO public.messages VALUES (86, 31, 65, 'erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum risus, at fringilla purus mauris a nunc. In', false, true, '2022-03-10 16:26:33');
INSERT INTO public.messages VALUES (87, 23, 51, 'lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor.', false, true, '2022-11-14 19:10:10');
INSERT INTO public.messages VALUES (88, 39, 11, 'et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet', true, false, '2021-05-06 23:10:26');
INSERT INTO public.messages VALUES (89, 5, 13, 'semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in', false, false, '2022-07-17 14:24:39');
INSERT INTO public.messages VALUES (90, 25, 16, 'vitae sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie', true, false, '2022-02-04 05:25:40');
INSERT INTO public.messages VALUES (91, 94, 76, 'massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi, ac mattis', false, false, '2023-04-25 09:32:35');
INSERT INTO public.messages VALUES (92, 54, 73, 'libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut', false, true, '2022-03-09 04:11:56');
INSERT INTO public.messages VALUES (93, 33, 85, 'mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor', false, true, '2022-02-27 01:45:28');
INSERT INTO public.messages VALUES (94, 67, 33, 'aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare', false, true, '2022-08-02 05:11:46');
INSERT INTO public.messages VALUES (95, 42, 36, 'purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus', false, false, '2022-06-17 00:10:11');
INSERT INTO public.messages VALUES (96, 11, 80, 'nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus.', false, true, '2021-10-17 16:18:27');
INSERT INTO public.messages VALUES (97, 87, 55, 'faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor', false, true, '2022-05-02 04:31:45');
INSERT INTO public.messages VALUES (98, 19, 25, 'In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit', true, true, '2022-03-16 19:50:49');
INSERT INTO public.messages VALUES (99, 80, 50, 'eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac', true, true, '2022-05-01 06:59:12');
INSERT INTO public.messages VALUES (100, 89, 32, 'Proin vel nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend', true, false, '2022-08-09 17:32:20');


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.photo VALUES (1, 'https://zoom.us/user/110?search=1', 9, 'ornare. Fusce mollis. Duis sit', '2021-12-08 00:45:32', 58, '{"id" : 1, "url" : "https://zoom.us/user/110?search=1", "size" : 58}');
INSERT INTO public.photo VALUES (2, 'https://naver.com/one?page=1&offset=1', 81, 'vitae, aliquet', '2022-12-20 18:19:46', 50, '{"id" : 2, "url" : "https://naver.com/one?page=1&offset=1", "size" : 50}');
INSERT INTO public.photo VALUES (3, 'http://bbc.co.uk/settings?q=11', 74, 'nec, diam.', '2022-07-19 19:22:25', 46, '{"id" : 3, "url" : "http://bbc.co.uk/settings?q=11", "size" : 46}');
INSERT INTO public.photo VALUES (4, 'https://twitter.com/site?ab=441&aad=2', 47, 'nibh enim, gravida sit amet, dapibus id, blandit at,', '2021-07-14 17:34:51', 43, '{"id" : 4, "url" : "https://twitter.com/site?ab=441&aad=2", "size" : 43}');
INSERT INTO public.photo VALUES (5, 'http://bbc.co.uk/sub/cars?gi=100', 22, 'orci luctus et ultrices posuere cubilia Curae Phasellus', '2022-12-20 06:10:40', 70, '{"id" : 5, "url" : "http://bbc.co.uk/sub/cars?gi=100", "size" : 70}');
INSERT INTO public.photo VALUES (6, 'http://nytimes.com/fr?gi=100', 41, 'id', '2022-11-08 19:25:54', 79, '{"id" : 6, "url" : "http://nytimes.com/fr?gi=100", "size" : 79}');
INSERT INTO public.photo VALUES (7, 'http://twitter.com/en-ca?p=8', 52, 'magna. Phasellus dolor', '2022-06-27 06:36:45', 10, '{"id" : 7, "url" : "http://twitter.com/en-ca?p=8", "size" : 10}');
INSERT INTO public.photo VALUES (8, 'https://whatsapp.com/site?q=4', 22, 'dictum placerat, augue. Sed molestie. Sed id risus quis diam', '2022-08-18 08:04:41', 52, '{"id" : 8, "url" : "https://whatsapp.com/site?q=4", "size" : 52}');
INSERT INTO public.photo VALUES (9, 'http://guardian.co.uk/user/110?str=se', 54, 'nunc risus varius orci, in consequat enim diam vel arcu.', '2023-01-14 22:12:53', 73, '{"id" : 9, "url" : "http://guardian.co.uk/user/110?str=se", "size" : 73}');
INSERT INTO public.photo VALUES (10, 'https://google.com/settings?str=se', 100, 'ullamcorper, nisl arcu iaculis enim, sit amet', '2022-03-24 23:26:44', 11, '{"id" : 10, "url" : "https://google.com/settings?str=se", "size" : 11}');
INSERT INTO public.photo VALUES (11, 'https://nytimes.com/en-us?ad=115', 52, 'Curae Donec tincidunt. Donec vitae erat', '2022-06-04 07:08:44', 87, '{"id" : 11, "url" : "https://nytimes.com/en-us?ad=115", "size" : 87}');
INSERT INTO public.photo VALUES (12, 'http://facebook.com/sub/cars?search=1', 30, 'Integer vitae nibh. Donec est mauris,', '2021-11-06 09:46:28', 43, '{"id" : 12, "url" : "http://facebook.com/sub/cars?search=1", "size" : 43}');
INSERT INTO public.photo VALUES (13, 'http://netflix.com/fr?p=8', 7, 'Cum sociis natoque penatibus', '2023-03-08 20:58:14', 80, '{"id" : 13, "url" : "http://netflix.com/fr?p=8", "size" : 80}');
INSERT INTO public.photo VALUES (14, 'http://walmart.com/one?q=test', 51, 'eu dolor egestas rhoncus. Proin', '2023-03-17 14:15:06', 47, '{"id" : 14, "url" : "http://walmart.com/one?q=test", "size" : 47}');
INSERT INTO public.photo VALUES (15, 'http://naver.com/settings?q=4', 77, 'In nec orci. Donec', '2023-02-11 14:54:19', 83, '{"id" : 15, "url" : "http://naver.com/settings?q=4", "size" : 83}');
INSERT INTO public.photo VALUES (16, 'https://facebook.com/site?q=4', 72, 'ipsum ac mi', '2022-10-19 20:22:06', 57, '{"id" : 16, "url" : "https://facebook.com/site?q=4", "size" : 57}');
INSERT INTO public.photo VALUES (17, 'https://ebay.com/site?k=0', 85, 'Nulla facilisis.', '2022-04-30 02:19:32', 62, '{"id" : 17, "url" : "https://ebay.com/site?k=0", "size" : 62}');
INSERT INTO public.photo VALUES (18, 'https://yahoo.com/en-us?q=test', 50, 'purus ac tellus. Suspendisse sed dolor. Fusce', '2022-01-13 08:09:52', 98, '{"id" : 18, "url" : "https://yahoo.com/en-us?q=test", "size" : 98}');
INSERT INTO public.photo VALUES (19, 'http://pinterest.com/site?client=g', 30, 'elit pede, malesuada vel, venenatis vel,', '2021-11-11 14:08:05', 51, '{"id" : 19, "url" : "http://pinterest.com/site?client=g", "size" : 51}');
INSERT INTO public.photo VALUES (20, 'http://netflix.com/sub/cars?q=0', 97, 'dui.', '2023-02-11 16:26:33', 53, '{"id" : 20, "url" : "http://netflix.com/sub/cars?q=0", "size" : 53}');
INSERT INTO public.photo VALUES (21, 'http://netflix.com/sub?q=11', 33, 'ligula. Aliquam', '2021-06-07 07:36:39', 33, '{"id" : 21, "url" : "http://netflix.com/sub?q=11", "size" : 33}');
INSERT INTO public.photo VALUES (22, 'https://pinterest.com/en-ca?search=1&q=de', 73, 'ipsum dolor', '2023-03-22 13:41:13', 78, '{"id" : 22, "url" : "https://pinterest.com/en-ca?search=1&q=de", "size" : 78}');
INSERT INTO public.photo VALUES (23, 'http://pinterest.com/sub?page=1&offset=1', 49, 'Ut', '2022-03-16 10:55:40', 70, '{"id" : 23, "url" : "http://pinterest.com/sub?page=1&offset=1", "size" : 70}');
INSERT INTO public.photo VALUES (24, 'https://netflix.com/user/110?p=8', 45, 'arcu. Aliquam ultrices iaculis odio. Nam interdum enim non', '2022-10-26 16:15:51', 96, '{"id" : 24, "url" : "https://netflix.com/user/110?p=8", "size" : 96}');
INSERT INTO public.photo VALUES (25, 'https://nytimes.com/site?ad=115', 4, 'orci, in consequat enim', '2022-12-07 14:35:47', 20, '{"id" : 25, "url" : "https://nytimes.com/site?ad=115", "size" : 20}');
INSERT INTO public.photo VALUES (26, 'https://wikipedia.org/group/9?q=0', 65, 'Duis cursus, diam at pretium aliquet, metus urna', '2021-07-10 04:34:32', 24, '{"id" : 26, "url" : "https://wikipedia.org/group/9?q=0", "size" : 24}');
INSERT INTO public.photo VALUES (27, 'https://reddit.com/user/110?ad=115', 66, 'Integer tincidunt aliquam arcu.', '2021-12-15 10:23:59', 57, '{"id" : 27, "url" : "https://reddit.com/user/110?ad=115", "size" : 57}');
INSERT INTO public.photo VALUES (28, 'http://guardian.co.uk/user/110?q=4', 61, 'sem mollis dui, in', '2022-07-25 09:00:03', 68, '{"id" : 28, "url" : "http://guardian.co.uk/user/110?q=4", "size" : 68}');
INSERT INTO public.photo VALUES (29, 'https://zoom.us/fr?ad=115', 3, 'enim consequat purus. Maecenas', '2022-08-26 19:37:59', 40, '{"id" : 29, "url" : "https://zoom.us/fr?ad=115", "size" : 40}');
INSERT INTO public.photo VALUES (30, 'https://pinterest.com/en-us?q=0', 66, 'mi fringilla mi lacinia mattis. Integer eu', '2022-11-20 02:40:39', 84, '{"id" : 30, "url" : "https://pinterest.com/en-us?q=0", "size" : 84}');
INSERT INTO public.photo VALUES (31, 'https://youtube.com/en-ca?k=0', 15, 'Maecenas malesuada fringilla est. Mauris eu', '2022-03-23 13:28:39', 77, '{"id" : 31, "url" : "https://youtube.com/en-ca?k=0", "size" : 77}');
INSERT INTO public.photo VALUES (32, 'https://netflix.com/group/9?search=1', 54, 'tellus eu', '2022-07-24 10:12:18', 42, '{"id" : 32, "url" : "https://netflix.com/group/9?search=1", "size" : 42}');
INSERT INTO public.photo VALUES (33, 'http://pinterest.com/en-us?q=0', 66, 'metus. In nec orci. Donec nibh. Quisque nonummy', '2023-02-24 15:04:12', 40, '{"id" : 33, "url" : "http://pinterest.com/en-us?q=0", "size" : 40}');
INSERT INTO public.photo VALUES (34, 'https://whatsapp.com/settings?ad=115', 67, 'cursus non, egestas a, dui. Cras pellentesque.', '2022-10-21 19:04:44', 61, '{"id" : 34, "url" : "https://whatsapp.com/settings?ad=115", "size" : 61}');
INSERT INTO public.photo VALUES (35, 'http://wikipedia.org/fr?g=1', 27, 'libero at auctor ullamcorper, nisl', '2021-08-17 13:01:31', 72, '{"id" : 35, "url" : "http://wikipedia.org/fr?g=1", "size" : 72}');
INSERT INTO public.photo VALUES (36, 'http://google.com/en-us?ad=115', 98, 'nulla. Cras eu', '2022-05-22 18:53:45', 67, '{"id" : 36, "url" : "http://google.com/en-us?ad=115", "size" : 67}');
INSERT INTO public.photo VALUES (37, 'http://baidu.com/sub?q=0', 20, 'Duis dignissim tempor arcu. Vestibulum ut eros non enim', '2022-07-29 04:19:07', 99, '{"id" : 37, "url" : "http://baidu.com/sub?q=0", "size" : 99}');
INSERT INTO public.photo VALUES (38, 'http://nytimes.com/fr?q=11', 31, 'quam', '2022-05-30 12:17:28', 17, '{"id" : 38, "url" : "http://nytimes.com/fr?q=11", "size" : 17}');
INSERT INTO public.photo VALUES (39, 'https://ebay.com/settings?page=1&offset=1', 33, 'varius orci, in consequat enim diam vel', '2021-07-26 17:42:52', 50, '{"id" : 39, "url" : "https://ebay.com/settings?page=1&offset=1", "size" : 50}');
INSERT INTO public.photo VALUES (40, 'https://whatsapp.com/user/110?search=1', 12, 'lacus. Ut nec urna et', '2021-11-16 08:15:20', 15, '{"id" : 40, "url" : "https://whatsapp.com/user/110?search=1", "size" : 15}');
INSERT INTO public.photo VALUES (41, 'https://naver.com/sub/cars?q=0', 80, 'fringilla ornare placerat, orci lacus vestibulum', '2021-09-25 05:13:25', 48, '{"id" : 41, "url" : "https://naver.com/sub/cars?q=0", "size" : 48}');
INSERT INTO public.photo VALUES (42, 'http://netflix.com/user/110?gi=100', 89, 'nibh enim, gravida sit amet, dapibus id,', '2023-02-02 14:48:02', 70, '{"id" : 42, "url" : "http://netflix.com/user/110?gi=100", "size" : 70}');
INSERT INTO public.photo VALUES (43, 'http://whatsapp.com/fr?p=8', 87, 'vulputate, risus a ultricies adipiscing, enim mi', '2022-07-02 08:35:22', 49, '{"id" : 43, "url" : "http://whatsapp.com/fr?p=8", "size" : 49}');
INSERT INTO public.photo VALUES (44, 'https://whatsapp.com/en-ca?str=se', 28, 'nibh enim,', '2021-05-04 02:38:03', 45, '{"id" : 44, "url" : "https://whatsapp.com/en-ca?str=se", "size" : 45}');
INSERT INTO public.photo VALUES (45, 'http://facebook.com/one?page=1&offset=1', 55, 'odio. Nam interdum enim', '2022-01-24 07:52:32', 67, '{"id" : 45, "url" : "http://facebook.com/one?page=1&offset=1", "size" : 67}');
INSERT INTO public.photo VALUES (46, 'http://yahoo.com/sub/cars?page=1&offset=1', 69, 'porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin', '2021-08-07 09:51:51', 15, '{"id" : 46, "url" : "http://yahoo.com/sub/cars?page=1&offset=1", "size" : 15}');
INSERT INTO public.photo VALUES (47, 'https://pinterest.com/settings?q=11', 98, 'vel turpis. Aliquam adipiscing lobortis risus. In', '2023-03-14 11:45:06', 27, '{"id" : 47, "url" : "https://pinterest.com/settings?q=11", "size" : 27}');
INSERT INTO public.photo VALUES (48, 'https://netflix.com/sub?search=1&q=de', 89, 'quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper', '2022-04-13 09:36:07', 80, '{"id" : 48, "url" : "https://netflix.com/sub?search=1&q=de", "size" : 80}');
INSERT INTO public.photo VALUES (49, 'http://zoom.us/site?q=0', 47, 'nisi nibh lacinia orci,', '2022-08-11 23:48:40', 64, '{"id" : 49, "url" : "http://zoom.us/site?q=0", "size" : 64}');
INSERT INTO public.photo VALUES (50, 'http://bbc.co.uk/one?k=0', 71, 'nibh vulputate mauris sagittis placerat.', '2023-04-09 05:31:34', 71, '{"id" : 50, "url" : "http://bbc.co.uk/one?k=0", "size" : 71}');
INSERT INTO public.photo VALUES (51, 'https://pinterest.com/en-ca?q=4', 58, 'Suspendisse non leo. Vivamus', '2022-02-14 10:53:47', 36, '{"id" : 51, "url" : "https://pinterest.com/en-ca?q=4", "size" : 36}');
INSERT INTO public.photo VALUES (52, 'https://youtube.com/user/110?ad=115', 17, 'lacus vestibulum lorem, sit', '2021-06-09 12:42:50', 18, '{"id" : 52, "url" : "https://youtube.com/user/110?ad=115", "size" : 18}');
INSERT INTO public.photo VALUES (53, 'http://baidu.com/settings?p=8', 21, 'Cras vehicula aliquet libero.', '2022-07-03 12:27:07', 72, '{"id" : 53, "url" : "http://baidu.com/settings?p=8", "size" : 72}');
INSERT INTO public.photo VALUES (54, 'https://netflix.com/group/9?gi=100', 83, 'Lorem ipsum dolor', '2022-04-08 09:05:29', 35, '{"id" : 54, "url" : "https://netflix.com/group/9?gi=100", "size" : 35}');
INSERT INTO public.photo VALUES (55, 'http://bbc.co.uk/fr?ad=115', 66, 'nec, eleifend non, dapibus rutrum,', '2022-12-19 17:56:12', 66, '{"id" : 55, "url" : "http://bbc.co.uk/fr?ad=115", "size" : 66}');
INSERT INTO public.photo VALUES (56, 'https://pinterest.com/en-us?search=1&q=de', 90, 'Aenean eget metus.', '2022-06-26 21:23:20', 51, '{"id" : 56, "url" : "https://pinterest.com/en-us?search=1&q=de", "size" : 51}');
INSERT INTO public.photo VALUES (57, 'https://wikipedia.org/sub?g=1', 9, 'dapibus quam quis diam. Pellentesque habitant morbi tristique', '2022-06-25 06:41:22', 93, '{"id" : 57, "url" : "https://wikipedia.org/sub?g=1", "size" : 93}');
INSERT INTO public.photo VALUES (58, 'https://walmart.com/sub/cars?gi=100', 30, 'interdum libero dui', '2021-11-16 02:36:25', 39, '{"id" : 58, "url" : "https://walmart.com/sub/cars?gi=100", "size" : 39}');
INSERT INTO public.photo VALUES (59, 'http://instagram.com/fr?g=1', 11, 'Mauris ut quam vel sapien imperdiet ornare.', '2021-11-11 07:36:36', 69, '{"id" : 59, "url" : "http://instagram.com/fr?g=1", "size" : 69}');
INSERT INTO public.photo VALUES (60, 'http://pinterest.com/user/110?search=1', 90, 'mauris erat eget ipsum. Suspendisse sagittis. Nullam', '2022-06-23 08:29:55', 55, '{"id" : 60, "url" : "http://pinterest.com/user/110?search=1", "size" : 55}');
INSERT INTO public.photo VALUES (61, 'http://ebay.com/en-us?search=1&q=de', 58, 'risus. Nulla eget', '2022-05-03 13:14:09', 38, '{"id" : 61, "url" : "http://ebay.com/en-us?search=1&q=de", "size" : 38}');
INSERT INTO public.photo VALUES (62, 'https://naver.com/group/9?p=8', 66, 'ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius', '2021-11-03 05:36:39', 35, '{"id" : 62, "url" : "https://naver.com/group/9?p=8", "size" : 35}');
INSERT INTO public.photo VALUES (63, 'https://zoom.us/en-ca?q=test', 68, 'ullamcorper. Duis cursus, diam at pretium aliquet,', '2022-02-22 14:46:25', 70, '{"id" : 63, "url" : "https://zoom.us/en-ca?q=test", "size" : 70}');
INSERT INTO public.photo VALUES (64, 'http://google.com/fr?k=0', 96, 'Proin', '2022-06-20 18:18:37', 54, '{"id" : 64, "url" : "http://google.com/fr?k=0", "size" : 54}');
INSERT INTO public.photo VALUES (65, 'https://youtube.com/settings?q=0', 15, 'euismod et, commodo', '2022-07-13 08:58:00', 66, '{"id" : 65, "url" : "https://youtube.com/settings?q=0", "size" : 66}');
INSERT INTO public.photo VALUES (66, 'https://cnn.com/en-us?ad=115', 90, 'Duis dignissim tempor arcu. Vestibulum', '2021-06-02 07:22:47', 13, '{"id" : 66, "url" : "https://cnn.com/en-us?ad=115", "size" : 13}');
INSERT INTO public.photo VALUES (67, 'http://guardian.co.uk/settings?gi=100', 52, 'natoque penatibus et magnis dis parturient montes, nascetur', '2021-08-25 03:04:34', 31, '{"id" : 67, "url" : "http://guardian.co.uk/settings?gi=100", "size" : 31}');
INSERT INTO public.photo VALUES (68, 'http://guardian.co.uk/group/9?gi=100', 9, 'interdum. Sed auctor odio', '2022-01-17 01:19:14', 82, '{"id" : 68, "url" : "http://guardian.co.uk/group/9?gi=100", "size" : 82}');
INSERT INTO public.photo VALUES (69, 'https://reddit.com/one?p=8', 80, 'Fusce mi lorem, vehicula et, rutrum eu, ultrices', '2022-09-11 12:25:13', 69, '{"id" : 69, "url" : "https://reddit.com/one?p=8", "size" : 69}');
INSERT INTO public.photo VALUES (70, 'https://whatsapp.com/group/9?p=8', 29, 'porttitor vulputate, posuere vulputate, lacus. Cras', '2022-06-04 09:13:49', 74, '{"id" : 70, "url" : "https://whatsapp.com/group/9?p=8", "size" : 74}');
INSERT INTO public.photo VALUES (71, 'https://ebay.com/sub?search=1&q=de', 86, 'Nam interdum enim', '2021-07-27 21:35:47', 89, '{"id" : 71, "url" : "https://ebay.com/sub?search=1&q=de", "size" : 89}');
INSERT INTO public.photo VALUES (72, 'https://cnn.com/sub?g=1', 11, 'leo. Cras vehicula aliquet', '2021-05-21 04:52:23', 77, '{"id" : 72, "url" : "https://cnn.com/sub?g=1", "size" : 77}');
INSERT INTO public.photo VALUES (73, 'http://naver.com/user/110?k=0', 2, 'ut', '2022-07-09 12:56:29', 10, '{"id" : 73, "url" : "http://naver.com/user/110?k=0", "size" : 10}');
INSERT INTO public.photo VALUES (74, 'http://ebay.com/site?page=1&offset=1', 40, 'eleifend.', '2023-02-21 02:10:55', 47, '{"id" : 74, "url" : "http://ebay.com/site?page=1&offset=1", "size" : 47}');
INSERT INTO public.photo VALUES (75, 'http://ebay.com/settings?page=1&offset=1', 54, 'enim. Sed nulla ante, iaculis', '2022-11-03 06:07:38', 56, '{"id" : 75, "url" : "http://ebay.com/settings?page=1&offset=1", "size" : 56}');
INSERT INTO public.photo VALUES (76, 'https://naver.com/en-ca?ad=115', 94, 'massa. Vestibulum accumsan neque et', '2021-06-28 01:14:23', 64, '{"id" : 76, "url" : "https://naver.com/en-ca?ad=115", "size" : 64}');
INSERT INTO public.photo VALUES (77, 'https://guardian.co.uk/user/110?q=11', 96, 'penatibus et magnis dis parturient montes, nascetur ridiculus mus.', '2022-05-19 08:51:45', 45, '{"id" : 77, "url" : "https://guardian.co.uk/user/110?q=11", "size" : 45}');
INSERT INTO public.photo VALUES (78, 'https://baidu.com/fr?g=1', 20, 'vehicula aliquet libero. Integer in magna.', '2021-06-29 16:27:47', 47, '{"id" : 78, "url" : "https://baidu.com/fr?g=1", "size" : 47}');
INSERT INTO public.photo VALUES (79, 'https://google.com/en-ca?q=11', 74, 'velit eu sem. Pellentesque ut ipsum ac', '2023-03-01 02:22:50', 22, '{"id" : 79, "url" : "https://google.com/en-ca?q=11", "size" : 22}');
INSERT INTO public.photo VALUES (80, 'http://guardian.co.uk/group/9?q=4', 64, 'dapibus quam quis diam. Pellentesque habitant morbi tristique senectus et', '2023-04-11 13:46:36', 85, '{"id" : 80, "url" : "http://guardian.co.uk/group/9?q=4", "size" : 85}');
INSERT INTO public.photo VALUES (81, 'https://instagram.com/site?k=0', 13, 'est ac facilisis facilisis,', '2021-12-15 13:32:10', 27, '{"id" : 81, "url" : "https://instagram.com/site?k=0", "size" : 27}');
INSERT INTO public.photo VALUES (82, 'http://youtube.com/user/110?str=se', 40, 'pharetra. Nam ac nulla. In', '2021-06-01 01:58:14', 15, '{"id" : 82, "url" : "http://youtube.com/user/110?str=se", "size" : 15}');
INSERT INTO public.photo VALUES (83, 'http://wikipedia.org/settings?k=0', 49, 'Integer sem elit, pharetra ut, pharetra sed,', '2021-06-25 16:48:03', 22, '{"id" : 83, "url" : "http://wikipedia.org/settings?k=0", "size" : 22}');
INSERT INTO public.photo VALUES (84, 'http://twitter.com/user/110?ad=115', 54, 'sodales nisi magna sed dui. Fusce aliquam, enim nec', '2022-07-24 23:51:23', 57, '{"id" : 84, "url" : "http://twitter.com/user/110?ad=115", "size" : 57}');
INSERT INTO public.photo VALUES (85, 'https://youtube.com/en-us?client=g', 24, 'lectus justo eu arcu. Morbi sit amet', '2022-04-04 12:33:30', 28, '{"id" : 85, "url" : "https://youtube.com/en-us?client=g", "size" : 28}');
INSERT INTO public.photo VALUES (86, 'http://baidu.com/settings?page=1&offset=1', 59, 'magna a neque. Nullam ut nisi a odio semper', '2022-09-04 02:52:41', 98, '{"id" : 86, "url" : "http://baidu.com/settings?page=1&offset=1", "size" : 98}');
INSERT INTO public.photo VALUES (87, 'http://cnn.com/en-us?g=1', 41, 'in molestie tortor', '2021-09-10 19:48:22', 50, '{"id" : 87, "url" : "http://cnn.com/en-us?g=1", "size" : 50}');
INSERT INTO public.photo VALUES (88, 'http://google.com/settings?search=1', 89, 'semper et, lacinia vitae, sodales at, velit. Pellentesque', '2022-09-24 15:01:23', 56, '{"id" : 88, "url" : "http://google.com/settings?search=1", "size" : 56}');
INSERT INTO public.photo VALUES (89, 'https://google.com/user/110?q=test', 6, 'non enim commodo', '2021-08-09 07:13:11', 11, '{"id" : 89, "url" : "https://google.com/user/110?q=test", "size" : 11}');
INSERT INTO public.photo VALUES (90, 'https://nytimes.com/sub?q=4', 87, 'dui quis accumsan convallis, ante', '2022-07-22 05:32:24', 25, '{"id" : 90, "url" : "https://nytimes.com/sub?q=4", "size" : 25}');
INSERT INTO public.photo VALUES (91, 'https://ebay.com/sub/cars?str=se', 86, 'metus. In nec', '2022-12-10 12:08:00', 11, '{"id" : 91, "url" : "https://ebay.com/sub/cars?str=se", "size" : 11}');
INSERT INTO public.photo VALUES (92, 'http://ebay.com/en-ca?gi=100', 94, 'aliquet diam. Sed diam lorem,', '2021-11-15 08:51:37', 19, '{"id" : 92, "url" : "http://ebay.com/en-ca?gi=100", "size" : 19}');
INSERT INTO public.photo VALUES (93, 'https://pinterest.com/settings?g=1', 54, 'sed turpis nec mauris blandit mattis. Cras eget', '2021-11-26 12:59:36', 84, '{"id" : 93, "url" : "https://pinterest.com/settings?g=1", "size" : 84}');
INSERT INTO public.photo VALUES (94, 'http://zoom.us/fr?g=1', 100, 'dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis.', '2021-07-17 03:32:22', 58, '{"id" : 94, "url" : "http://zoom.us/fr?g=1", "size" : 58}');
INSERT INTO public.photo VALUES (95, 'https://naver.com/en-ca?k=0', 79, 'est, mollis non, cursus non, egestas a, dui. Cras pellentesque.', '2022-11-29 18:26:41', 77, '{"id" : 95, "url" : "https://naver.com/en-ca?k=0", "size" : 77}');
INSERT INTO public.photo VALUES (96, 'http://guardian.co.uk/one?p=8', 43, 'elementum purus, accumsan interdum libero dui', '2023-02-14 01:10:42', 17, '{"id" : 96, "url" : "http://guardian.co.uk/one?p=8", "size" : 17}');
INSERT INTO public.photo VALUES (97, 'http://baidu.com/fr?q=0', 76, 'nibh enim, gravida sit amet,', '2021-05-01 17:45:22', 40, '{"id" : 97, "url" : "http://baidu.com/fr?q=0", "size" : 40}');
INSERT INTO public.photo VALUES (98, 'http://youtube.com/en-ca?gi=100', 75, 'consequat nec, mollis vitae, posuere', '2022-04-18 08:24:02', 76, '{"id" : 98, "url" : "http://youtube.com/en-ca?gi=100", "size" : 76}');
INSERT INTO public.photo VALUES (99, 'https://ebay.com/user/110?k=0', 2, 'magna et ipsum cursus vestibulum. Mauris', '2021-06-10 04:56:45', 49, '{"id" : 99, "url" : "https://ebay.com/user/110?k=0", "size" : 49}');
INSERT INTO public.photo VALUES (100, 'https://yahoo.com/settings?k=0', 44, 'porttitor scelerisque neque. Nullam nisl. Maecenas', '2023-04-02 11:11:48', 64, '{"id" : 100, "url" : "https://yahoo.com/settings?k=0", "size" : 64}');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.users VALUES (1, 'Orli', 'Suarez', 'sed@google.net', '1-951-906-7588', 88, '2022-02-02 15:39:59', '(1-951-906-7588,sed@google.net)');
INSERT INTO public.users VALUES (2, 'Cecilia', 'Miller', 'ornare.lectus@yahoo.edu', '1-232-179-9667', 24, '2021-06-09 04:37:20', '(1-232-179-9667,ornare.lectus@yahoo.edu)');
INSERT INTO public.users VALUES (3, 'Reuben', 'Yang', 'tempus.lorem.fringilla@protonmail.edu', '(131) 946-3699', 81, '2021-06-07 10:24:42', '("(131) 946-3699",tempus.lorem.fringilla@protonmail.edu)');
INSERT INTO public.users VALUES (4, 'Tanner', 'Blankenship', 'erat@icloud.edu', '(627) 488-7188', 97, '2023-01-06 06:27:50', '("(627) 488-7188",erat@icloud.edu)');
INSERT INTO public.users VALUES (5, 'Howard', 'Pitts', 'consectetuer@protonmail.ca', '1-752-757-3163', 38, '2022-02-04 15:25:43', '(1-752-757-3163,consectetuer@protonmail.ca)');
INSERT INTO public.users VALUES (6, 'Coby', 'Bush', 'eu@yahoo.edu', '1-281-385-6643', 83, '2023-03-13 02:42:43', '(1-281-385-6643,eu@yahoo.edu)');
INSERT INTO public.users VALUES (7, 'Jakeem', 'Bishop', 'fringilla.porttitor.vulputate@outlook.couk', '1-894-399-3173', 27, '2022-12-03 22:26:18', '(1-894-399-3173,fringilla.porttitor.vulputate@outlook.couk)');
INSERT INTO public.users VALUES (8, 'Ishmael', 'Sloan', 'mauris.sagittis@protonmail.ca', '1-883-585-9722', 82, '2021-12-09 06:53:18', '(1-883-585-9722,mauris.sagittis@protonmail.ca)');
INSERT INTO public.users VALUES (9, 'Kaseem', 'Villarreal', 'vulputate.nisi@icloud.net', '(565) 428-3668', 41, '2022-03-16 23:29:08', '("(565) 428-3668",vulputate.nisi@icloud.net)');
INSERT INTO public.users VALUES (10, 'Demetrius', 'Rosales', 'non.leo.vivamus@google.couk', '1-719-644-4621', 10, '2021-10-13 06:52:07', '(1-719-644-4621,non.leo.vivamus@google.couk)');
INSERT INTO public.users VALUES (11, 'Kylee', 'Gray', 'tincidunt.donec@aol.ca', '(236) 313-5833', 81, '2022-06-06 03:51:17', '("(236) 313-5833",tincidunt.donec@aol.ca)');
INSERT INTO public.users VALUES (12, 'Juliet', 'Armstrong', 'aliquam@outlook.couk', '(707) 855-2512', 28, '2021-10-26 11:47:35', '("(707) 855-2512",aliquam@outlook.couk)');
INSERT INTO public.users VALUES (13, 'Yael', 'Valdez', 'magnis.dis@google.ca', '1-356-427-9642', 45, '2021-04-23 01:32:05', '(1-356-427-9642,magnis.dis@google.ca)');
INSERT INTO public.users VALUES (14, 'Ori', 'Medina', 'ridiculus.mus.donec@hotmail.edu', '1-831-345-7454', 87, '2023-04-17 19:44:06', '(1-831-345-7454,ridiculus.mus.donec@hotmail.edu)');
INSERT INTO public.users VALUES (15, 'Kenneth', 'Sharp', 'dui@protonmail.couk', '1-297-542-6077', 4, '2022-09-17 04:06:15', '(1-297-542-6077,dui@protonmail.couk)');
INSERT INTO public.users VALUES (16, 'Elijah', 'Lane', 'mollis.duis@yahoo.net', '1-736-326-5295', 80, '2022-07-18 21:34:01', '(1-736-326-5295,mollis.duis@yahoo.net)');
INSERT INTO public.users VALUES (17, 'Scarlet', 'Woodward', 'quis.diam.luctus@aol.couk', '(279) 474-2362', 56, '2023-04-25 19:27:20', '("(279) 474-2362",quis.diam.luctus@aol.couk)');
INSERT INTO public.users VALUES (18, 'Vincent', 'Lawson', 'congue.turpis.in@protonmail.couk', '1-338-586-5772', 4, '2023-04-26 06:57:43', '(1-338-586-5772,congue.turpis.in@protonmail.couk)');
INSERT INTO public.users VALUES (19, 'Venus', 'Mercer', 'nibh@outlook.couk', '(271) 384-3314', 85, '2022-10-14 11:27:03', '("(271) 384-3314",nibh@outlook.couk)');
INSERT INTO public.users VALUES (20, 'Shafira', 'Ochoa', 'ornare.in@google.com', '1-424-447-3043', 79, '2021-09-12 02:50:29', '(1-424-447-3043,ornare.in@google.com)');
INSERT INTO public.users VALUES (22, 'Hanna', 'Owen', 'vel.quam.dignissim@google.edu', '1-845-821-8148', 83, '2021-12-31 05:39:50', '(1-845-821-8148,vel.quam.dignissim@google.edu)');
INSERT INTO public.users VALUES (23, 'Ahmed', 'Lynch', 'cubilia@google.couk', '1-772-477-8406', 62, '2021-06-20 21:54:04', '(1-772-477-8406,cubilia@google.couk)');
INSERT INTO public.users VALUES (24, 'Len', 'Sanders', 'mauris.nulla@google.org', '1-835-877-9653', 44, '2021-09-04 16:58:05', '(1-835-877-9653,mauris.nulla@google.org)');
INSERT INTO public.users VALUES (25, 'Ulysses', 'Salas', 'tempus.lorem.fringilla@yahoo.org', '(614) 540-2440', 7, '2023-04-23 10:35:15', '("(614) 540-2440",tempus.lorem.fringilla@yahoo.org)');
INSERT INTO public.users VALUES (26, 'Charity', 'Golden', 'augue@hotmail.com', '(755) 710-4541', 92, '2022-12-26 23:09:24', '("(755) 710-4541",augue@hotmail.com)');
INSERT INTO public.users VALUES (27, 'Kaitlin', 'Matthews', 'penatibus.et.magnis@icloud.net', '1-959-133-5396', 61, '2022-05-11 03:06:22', '(1-959-133-5396,penatibus.et.magnis@icloud.net)');
INSERT INTO public.users VALUES (28, 'Derek', 'Burris', 'est.nunc@hotmail.edu', '(352) 435-3704', 44, '2023-04-13 09:30:00', '("(352) 435-3704",est.nunc@hotmail.edu)');
INSERT INTO public.users VALUES (29, 'Aidan', 'Blackwell', 'integer.eu@hotmail.org', '(343) 329-0780', 97, '2021-05-11 09:49:16', '("(343) 329-0780",integer.eu@hotmail.org)');
INSERT INTO public.users VALUES (30, 'Ahmed', 'Jarvis', 'rhoncus.nullam@protonmail.edu', '1-856-669-4542', 50, '2021-08-19 10:57:41', '(1-856-669-4542,rhoncus.nullam@protonmail.edu)');
INSERT INTO public.users VALUES (31, 'Jennifer', 'Witt', 'diam.dictum.sapien@outlook.com', '(625) 232-8187', 35, '2021-09-14 18:52:58', '("(625) 232-8187",diam.dictum.sapien@outlook.com)');
INSERT INTO public.users VALUES (32, 'Porter', 'Pace', 'mollis.dui@google.com', '(751) 418-4947', 97, '2022-07-22 18:28:08', '("(751) 418-4947",mollis.dui@google.com)');
INSERT INTO public.users VALUES (33, 'Connor', 'Barnes', 'adipiscing.fringilla@protonmail.net', '1-786-436-1037', 78, '2021-05-17 01:57:55', '(1-786-436-1037,adipiscing.fringilla@protonmail.net)');
INSERT INTO public.users VALUES (34, 'Talon', 'Johnson', 'lorem.semper@outlook.edu', '1-511-455-4757', 11, '2022-09-29 10:44:20', '(1-511-455-4757,lorem.semper@outlook.edu)');
INSERT INTO public.users VALUES (35, 'Colin', 'Bernard', 'purus@protonmail.com', '1-465-179-4326', 1, '2021-04-08 06:43:28', '(1-465-179-4326,purus@protonmail.com)');
INSERT INTO public.users VALUES (36, 'Hanae', 'Rivera', 'donec@hotmail.org', '(232) 362-2260', 29, '2022-03-27 07:32:44', '("(232) 362-2260",donec@hotmail.org)');
INSERT INTO public.users VALUES (37, 'Lucian', 'Noble', 'lectus.nullam@aol.org', '(864) 360-2437', 43, '2022-03-21 20:04:51', '("(864) 360-2437",lectus.nullam@aol.org)');
INSERT INTO public.users VALUES (21, 'Colorado', 'Jarvis', 'ornare.libero.at@protonmail.com', '1-858-877-7096', 30, '2022-05-01 23:19:21', '(1-858-877-7096,test@somemail.ru)');
INSERT INTO public.users VALUES (38, 'Reese', 'Brooks', 'vel.faucibus.id@protonmail.edu', '1-214-421-4632', 62, '2022-02-09 08:55:49', '(1-214-421-4632,vel.faucibus.id@protonmail.edu)');
INSERT INTO public.users VALUES (39, 'Christine', 'Mcmahon', 'ornare.sagittis@hotmail.org', '(926) 263-6997', 69, '2021-08-27 03:35:17', '("(926) 263-6997",ornare.sagittis@hotmail.org)');
INSERT INTO public.users VALUES (40, 'Xavier', 'Hampton', 'elit.elit@aol.com', '1-376-365-2271', 87, '2021-12-24 00:27:22', '(1-376-365-2271,elit.elit@aol.com)');
INSERT INTO public.users VALUES (41, 'Yen', 'Huff', 'nulla@hotmail.net', '1-204-336-5345', 28, '2022-09-08 15:32:37', '(1-204-336-5345,nulla@hotmail.net)');
INSERT INTO public.users VALUES (42, 'Aidan', 'Boone', 'orci.quis@icloud.com', '1-659-445-5932', 24, '2022-11-16 13:24:48', '(1-659-445-5932,orci.quis@icloud.com)');
INSERT INTO public.users VALUES (43, 'Kylan', 'Watts', 'facilisis.magna@outlook.ca', '1-556-367-1244', 28, '2023-03-08 21:04:58', '(1-556-367-1244,facilisis.magna@outlook.ca)');
INSERT INTO public.users VALUES (44, 'Rachel', 'Griffin', 'ipsum.primis@outlook.edu', '1-471-651-5036', 92, '2021-04-02 08:15:26', '(1-471-651-5036,ipsum.primis@outlook.edu)');
INSERT INTO public.users VALUES (45, 'Slade', 'Knapp', 'fringilla.mi.lacinia@google.com', '1-338-284-3978', 15, '2022-12-11 08:25:19', '(1-338-284-3978,fringilla.mi.lacinia@google.com)');
INSERT INTO public.users VALUES (46, 'Joseph', 'Harrell', 'ornare.egestas.ligula@icloud.couk', '1-594-945-3663', 5, '2022-01-23 23:26:51', '(1-594-945-3663,ornare.egestas.ligula@icloud.couk)');
INSERT INTO public.users VALUES (47, 'Lionel', 'Nixon', 'ac.mattis@protonmail.org', '1-746-445-1574', 35, '2023-02-28 12:04:42', '(1-746-445-1574,ac.mattis@protonmail.org)');
INSERT INTO public.users VALUES (48, 'Maxwell', 'Hayden', 'tincidunt.congue@icloud.net', '1-936-318-7349', 5, '2023-01-22 21:22:00', '(1-936-318-7349,tincidunt.congue@icloud.net)');
INSERT INTO public.users VALUES (49, 'Tana', 'Merrill', 'nec.tempus@google.org', '(487) 639-6114', 93, '2023-02-19 10:12:49', '("(487) 639-6114",nec.tempus@google.org)');
INSERT INTO public.users VALUES (50, 'Stone', 'Foreman', 'nulla.tincidunt@yahoo.net', '(217) 673-7536', 64, '2022-02-20 00:43:47', '("(217) 673-7536",nulla.tincidunt@yahoo.net)');
INSERT INTO public.users VALUES (51, 'Hayley', 'Harper', 'vulputate.posuere@aol.couk', '1-407-150-2434', 55, '2021-05-03 12:12:43', '(1-407-150-2434,vulputate.posuere@aol.couk)');
INSERT INTO public.users VALUES (52, 'Nayda', 'Davenport', 'nibh.aliquam.ornare@protonmail.edu', '1-737-178-2182', 33, '2022-06-26 08:33:46', '(1-737-178-2182,nibh.aliquam.ornare@protonmail.edu)');
INSERT INTO public.users VALUES (53, 'Hamilton', 'Ford', 'sed.sapien.nunc@google.ca', '1-212-624-7172', 51, '2022-11-21 20:31:46', '(1-212-624-7172,sed.sapien.nunc@google.ca)');
INSERT INTO public.users VALUES (54, 'Uma', 'Rosario', 'donec.est.nunc@icloud.com', '(860) 622-9988', 20, '2022-04-22 07:14:05', '("(860) 622-9988",donec.est.nunc@icloud.com)');
INSERT INTO public.users VALUES (55, 'Kelly', 'Langley', 'aliquam.eros@aol.org', '1-106-684-2676', 22, '2022-10-24 16:33:07', '(1-106-684-2676,aliquam.eros@aol.org)');
INSERT INTO public.users VALUES (56, 'Basia', 'Moreno', 'mollis.duis@hotmail.ca', '(540) 258-2854', 69, '2022-03-01 17:32:13', '("(540) 258-2854",mollis.duis@hotmail.ca)');
INSERT INTO public.users VALUES (57, 'Kermit', 'Schultz', 'sociis.natoque.penatibus@google.org', '1-362-688-1740', 2, '2021-10-22 19:14:44', '(1-362-688-1740,sociis.natoque.penatibus@google.org)');
INSERT INTO public.users VALUES (58, 'Clark', 'Valenzuela', 'sapien.cursus@yahoo.couk', '1-106-101-7847', 40, '2021-10-08 21:38:39', '(1-106-101-7847,sapien.cursus@yahoo.couk)');
INSERT INTO public.users VALUES (59, 'Aristotle', 'Rasmussen', 'augue.eu@icloud.org', '1-250-483-8466', 72, '2023-03-04 13:14:50', '(1-250-483-8466,augue.eu@icloud.org)');
INSERT INTO public.users VALUES (60, 'Zorita', 'Le', 'at.fringilla.purus@google.couk', '1-240-569-2546', 4, '2022-01-18 16:49:23', '(1-240-569-2546,at.fringilla.purus@google.couk)');
INSERT INTO public.users VALUES (61, 'Sacha', 'Humphrey', 'semper.dui@protonmail.net', '(381) 724-0684', 87, '2023-04-03 19:43:59', '("(381) 724-0684",semper.dui@protonmail.net)');
INSERT INTO public.users VALUES (62, 'Phelan', 'Roman', 'eget.metus@hotmail.couk', '(724) 988-7867', 66, '2022-06-11 04:07:48', '("(724) 988-7867",eget.metus@hotmail.couk)');
INSERT INTO public.users VALUES (63, 'Cooper', 'Stark', 'eu.tellus@google.edu', '(983) 288-2266', 59, '2022-05-13 03:54:40', '("(983) 288-2266",eu.tellus@google.edu)');
INSERT INTO public.users VALUES (64, 'Teegan', 'Riddle', 'mauris.suspendisse@aol.ca', '1-669-396-9449', 57, '2022-05-26 18:15:15', '(1-669-396-9449,mauris.suspendisse@aol.ca)');
INSERT INTO public.users VALUES (65, 'Akeem', 'Osborne', 'dolor.egestas@yahoo.edu', '1-673-252-3433', 97, '2021-11-14 21:59:41', '(1-673-252-3433,dolor.egestas@yahoo.edu)');
INSERT INTO public.users VALUES (66, 'Beverly', 'Green', 'vel.turpis@protonmail.couk', '(722) 876-4936', 80, '2021-12-04 23:47:17', '("(722) 876-4936",vel.turpis@protonmail.couk)');
INSERT INTO public.users VALUES (67, 'Cally', 'Molina', 'magna.tellus@aol.edu', '1-692-948-2915', 35, '2022-07-08 17:19:07', '(1-692-948-2915,magna.tellus@aol.edu)');
INSERT INTO public.users VALUES (68, 'Fletcher', 'Huffman', 'diam@aol.edu', '(454) 585-2091', 95, '2022-06-14 00:45:30', '("(454) 585-2091",diam@aol.edu)');
INSERT INTO public.users VALUES (69, 'Orlando', 'Quinn', 'nunc.id@outlook.edu', '(954) 562-9145', 74, '2023-03-30 16:06:03', '("(954) 562-9145",nunc.id@outlook.edu)');
INSERT INTO public.users VALUES (70, 'Arden', 'Drake', 'eu@yahoo.com', '1-590-725-2741', 61, '2022-11-26 18:47:42', '(1-590-725-2741,eu@yahoo.com)');
INSERT INTO public.users VALUES (71, 'Phelan', 'Hoffman', 'eu.erat.semper@aol.org', '1-578-986-7324', 79, '2022-08-21 23:34:39', '(1-578-986-7324,eu.erat.semper@aol.org)');
INSERT INTO public.users VALUES (72, 'Lance', 'Craig', 'cras@hotmail.net', '1-255-814-1351', 78, '2021-06-08 08:19:21', '(1-255-814-1351,cras@hotmail.net)');
INSERT INTO public.users VALUES (73, 'Liberty', 'Tanner', 'aenean.massa.integer@aol.org', '1-814-892-9177', 95, '2022-10-19 21:47:23', '(1-814-892-9177,aenean.massa.integer@aol.org)');
INSERT INTO public.users VALUES (74, 'Tatyana', 'Gilmore', 'dictum@icloud.couk', '(582) 997-5283', 32, '2021-09-01 02:47:49', '("(582) 997-5283",dictum@icloud.couk)');
INSERT INTO public.users VALUES (75, 'Eric', 'Flynn', 'duis.risus@hotmail.net', '(147) 220-2481', 11, '2021-12-02 10:00:08', '("(147) 220-2481",duis.risus@hotmail.net)');
INSERT INTO public.users VALUES (76, 'Zachary', 'Pace', 'tincidunt@hotmail.org', '1-643-946-4327', 42, '2023-01-16 11:09:00', '(1-643-946-4327,tincidunt@hotmail.org)');
INSERT INTO public.users VALUES (77, 'Kay', 'Newton', 'elit@hotmail.net', '(584) 418-0512', 54, '2022-10-15 12:28:45', '("(584) 418-0512",elit@hotmail.net)');
INSERT INTO public.users VALUES (78, 'Russell', 'Meyers', 'nunc.risus.varius@outlook.couk', '1-561-531-1234', 51, '2021-07-14 01:19:44', '(1-561-531-1234,nunc.risus.varius@outlook.couk)');
INSERT INTO public.users VALUES (79, 'Jaime', 'Collier', 'ullamcorper.magna@yahoo.net', '(412) 772-3786', 18, '2022-04-22 09:21:18', '("(412) 772-3786",ullamcorper.magna@yahoo.net)');
INSERT INTO public.users VALUES (80, 'Griffith', 'Irwin', 'fringilla.donec@protonmail.org', '(524) 846-2249', 26, '2023-04-16 19:45:36', '("(524) 846-2249",fringilla.donec@protonmail.org)');
INSERT INTO public.users VALUES (81, 'Vincent', 'Simpson', 'justo.nec.ante@outlook.ca', '(722) 288-0436', 50, '2022-02-06 20:35:24', '("(722) 288-0436",justo.nec.ante@outlook.ca)');
INSERT INTO public.users VALUES (82, 'Grace', 'Ramos', 'nunc.risus@google.couk', '1-646-949-4315', 40, '2022-02-02 14:35:48', '(1-646-949-4315,nunc.risus@google.couk)');
INSERT INTO public.users VALUES (83, 'Cameran', 'Huff', 'sed.sapien@outlook.net', '1-557-456-8684', 37, '2021-07-14 03:56:14', '(1-557-456-8684,sed.sapien@outlook.net)');
INSERT INTO public.users VALUES (84, 'Clinton', 'Walls', 'augue@outlook.org', '(705) 356-7463', 42, '2022-06-08 13:04:40', '("(705) 356-7463",augue@outlook.org)');
INSERT INTO public.users VALUES (85, 'Kelsie', 'Ford', 'volutpat.ornare.facilisis@aol.net', '1-313-863-3328', 11, '2021-11-11 07:28:40', '(1-313-863-3328,volutpat.ornare.facilisis@aol.net)');
INSERT INTO public.users VALUES (86, 'Hashim', 'Pate', 'pede.et@icloud.org', '1-473-282-8742', 81, '2022-01-26 10:22:36', '(1-473-282-8742,pede.et@icloud.org)');
INSERT INTO public.users VALUES (87, 'Eugenia', 'Harris', 'lectus@outlook.edu', '1-678-212-0302', 82, '2023-02-12 08:25:30', '(1-678-212-0302,lectus@outlook.edu)');
INSERT INTO public.users VALUES (88, 'Palmer', 'Green', 'ut@icloud.org', '(618) 521-3738', 11, '2021-11-29 15:38:44', '("(618) 521-3738",ut@icloud.org)');
INSERT INTO public.users VALUES (89, 'Stuart', 'Monroe', 'vel.lectus.cum@aol.couk', '(286) 283-5669', 27, '2021-05-02 20:13:18', '("(286) 283-5669",vel.lectus.cum@aol.couk)');
INSERT INTO public.users VALUES (90, 'Orli', 'O''connor', 'primis.in.faucibus@icloud.net', '(283) 244-5156', 31, '2021-12-10 12:26:39', '("(283) 244-5156",primis.in.faucibus@icloud.net)');
INSERT INTO public.users VALUES (91, 'Wynter', 'Booker', 'vitae.dolor@protonmail.couk', '1-742-106-0546', 29, '2021-12-01 23:34:54', '(1-742-106-0546,vitae.dolor@protonmail.couk)');
INSERT INTO public.users VALUES (92, 'Tobias', 'Wilkinson', 'amet@aol.ca', '(245) 516-1837', 50, '2021-05-08 12:42:36', '("(245) 516-1837",amet@aol.ca)');
INSERT INTO public.users VALUES (93, 'Jaquelyn', 'Wood', 'mauris.ut.mi@yahoo.org', '(593) 425-2636', 47, '2023-03-03 05:57:13', '("(593) 425-2636",mauris.ut.mi@yahoo.org)');
INSERT INTO public.users VALUES (94, 'Fulton', 'Sawyer', 'blandit.viverra@google.com', '1-525-379-7317', 52, '2021-06-05 22:02:20', '(1-525-379-7317,blandit.viverra@google.com)');
INSERT INTO public.users VALUES (95, 'Alika', 'Parks', 'magnis@aol.couk', '(609) 364-5584', 84, '2021-10-03 15:15:21', '("(609) 364-5584",magnis@aol.couk)');
INSERT INTO public.users VALUES (96, 'Sean', 'Bond', 'tellus.non@yahoo.net', '(472) 488-7282', 69, '2022-10-27 10:16:33', '("(472) 488-7282",tellus.non@yahoo.net)');
INSERT INTO public.users VALUES (97, 'Ariel', 'Gaines', 'aenean@aol.ca', '1-773-661-9549', 30, '2022-12-24 23:31:36', '(1-773-661-9549,aenean@aol.ca)');
INSERT INTO public.users VALUES (98, 'Camilla', 'Turner', 'at.auctor@yahoo.net', '1-675-274-7675', 33, '2022-07-17 06:05:33', '(1-675-274-7675,at.auctor@yahoo.net)');
INSERT INTO public.users VALUES (99, 'Sarah', 'Velez', 'sed.dolor@google.com', '(968) 845-5053', 32, '2022-08-17 13:53:11', '("(968) 845-5053",sed.dolor@google.com)');
INSERT INTO public.users VALUES (100, 'Sierra', 'Pollard', 'odio.etiam@protonmail.couk', '1-457-609-5774', 74, '2022-07-13 10:36:41', '(1-457-609-5774,odio.etiam@protonmail.couk)');


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

INSERT INTO public.video VALUES (1, 'http://facebook.com/one?q=test', 38, 'consectetuer rhoncus. Nullam velit dui, semper et, lacinia', '2021-12-01 12:35:41', 30);
INSERT INTO public.video VALUES (2, 'https://youtube.com/group/9?p=8', 70, 'pede. Nunc sed orci lobortis augue scelerisque', '2022-08-06 09:17:00', 67);
INSERT INTO public.video VALUES (3, 'http://nytimes.com/en-us?search=1', 61, 'posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse', '2022-04-22 23:37:56', 16);
INSERT INTO public.video VALUES (4, 'http://walmart.com/en-us?q=4', 36, 'et, rutrum non, hendrerit id, ante.', '2022-11-04 10:59:24', 86);
INSERT INTO public.video VALUES (5, 'https://walmart.com/fr?p=8', 62, 'malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in', '2023-04-18 00:36:04', 17);
INSERT INTO public.video VALUES (6, 'http://cnn.com/settings?client=g', 34, 'ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt', '2022-03-18 21:42:19', 13);
INSERT INTO public.video VALUES (7, 'http://zoom.us/user/110?gi=100', 67, 'lectus sit amet luctus vulputate, nisi sem', '2021-06-28 03:15:44', 36);
INSERT INTO public.video VALUES (8, 'https://ebay.com/en-us?q=0', 4, 'consequat, lectus sit amet luctus vulputate, nisi sem semper', '2022-11-09 04:14:10', 64);
INSERT INTO public.video VALUES (9, 'http://guardian.co.uk/settings?q=test', 85, 'vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam', '2022-09-12 20:06:54', 57);
INSERT INTO public.video VALUES (10, 'http://facebook.com/fr?q=0', 53, 'odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.', '2021-07-12 10:25:59', 97);
INSERT INTO public.video VALUES (11, 'https://youtube.com/sub?q=11', 93, 'Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula.', '2021-11-09 16:49:50', 59);
INSERT INTO public.video VALUES (12, 'https://facebook.com/settings?q=0', 71, 'Sed pharetra,', '2021-11-17 07:38:52', 26);
INSERT INTO public.video VALUES (13, 'http://guardian.co.uk/settings?search=1&q=de', 49, 'Integer vulputate, risus', '2021-06-19 01:59:45', 85);
INSERT INTO public.video VALUES (14, 'http://baidu.com/one?q=0', 86, 'tincidunt orci quis lectus. Nullam suscipit, est', '2022-11-19 13:20:21', 64);
INSERT INTO public.video VALUES (15, 'https://google.com/en-us?q=11', 94, 'ac mattis', '2021-10-28 22:44:26', 29);
INSERT INTO public.video VALUES (16, 'http://youtube.com/settings?q=4', 70, 'eleifend,', '2021-11-30 08:09:30', 77);
INSERT INTO public.video VALUES (17, 'https://twitter.com/settings?k=0', 30, 'molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper,', '2022-05-25 09:14:01', 52);
INSERT INTO public.video VALUES (18, 'http://wikipedia.org/settings?g=1', 32, 'egestas a, scelerisque sed, sapien. Nunc pulvinar arcu', '2023-03-21 07:43:37', 90);
INSERT INTO public.video VALUES (19, 'http://whatsapp.com/fr?search=1&q=de', 99, 'mollis. Integer tincidunt aliquam arcu.', '2023-03-09 12:04:33', 76);
INSERT INTO public.video VALUES (20, 'http://netflix.com/en-us?q=4', 5, 'Proin', '2022-05-25 04:15:02', 29);
INSERT INTO public.video VALUES (21, 'http://cnn.com/sub/cars?g=1', 62, 'aliquet molestie tellus. Aenean egestas hendrerit', '2021-12-11 17:49:33', 75);
INSERT INTO public.video VALUES (22, 'http://naver.com/one?ad=115', 87, 'fringilla. Donec feugiat metus sit', '2021-07-10 16:37:45', 91);
INSERT INTO public.video VALUES (23, 'http://ebay.com/user/110?q=0', 21, 'Sed id risus quis diam luctus lobortis. Class aptent taciti', '2022-10-20 22:05:22', 25);
INSERT INTO public.video VALUES (24, 'http://whatsapp.com/sub/cars?q=11', 42, 'parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse', '2022-11-04 03:07:22', 80);
INSERT INTO public.video VALUES (25, 'http://pinterest.com/site?ad=115', 51, 'netus et malesuada fames ac turpis egestas. Fusce aliquet', '2021-09-06 04:19:05', 53);
INSERT INTO public.video VALUES (26, 'https://netflix.com/settings?search=1', 15, 'id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut', '2021-06-25 01:10:48', 92);
INSERT INTO public.video VALUES (27, 'https://naver.com/settings?q=11', 79, 'sagittis. Duis gravida. Praesent eu nulla', '2022-09-25 01:51:55', 18);
INSERT INTO public.video VALUES (28, 'http://twitter.com/settings?page=1&offset=1', 86, 'fames ac', '2022-10-20 20:09:36', 87);
INSERT INTO public.video VALUES (29, 'https://guardian.co.uk/en-us?client=g', 10, 'ultrices posuere cubilia Curae Phasellus ornare. Fusce mollis. Duis sit', '2021-08-31 23:25:07', 99);
INSERT INTO public.video VALUES (30, 'http://twitter.com/sub?q=0', 81, 'semper rutrum. Fusce dolor quam, elementum', '2022-04-11 06:52:11', 99);
INSERT INTO public.video VALUES (31, 'https://bbc.co.uk/user/110?p=8', 82, 'libero et', '2022-12-02 13:01:24', 91);
INSERT INTO public.video VALUES (32, 'https://walmart.com/en-us?k=0', 95, 'justo eu arcu. Morbi sit amet', '2021-05-16 17:59:15', 82);
INSERT INTO public.video VALUES (33, 'http://google.com/sub/cars?g=1', 63, 'quis urna. Nunc quis arcu vel quam', '2022-01-18 12:25:30', 11);
INSERT INTO public.video VALUES (34, 'http://guardian.co.uk/sub?k=0', 84, 'lacus. Cras interdum. Nunc sollicitudin', '2021-08-05 21:59:51', 42);
INSERT INTO public.video VALUES (35, 'https://guardian.co.uk/one?q=test', 90, 'Vestibulum ante', '2021-12-23 23:12:37', 95);
INSERT INTO public.video VALUES (36, 'https://zoom.us/fr?gi=100', 1, 'euismod urna. Nullam lobortis', '2021-08-31 03:53:58', 15);
INSERT INTO public.video VALUES (37, 'http://google.com/fr?q=4', 24, 'in, cursus et, eros. Proin ultrices.', '2021-09-04 09:40:27', 74);
INSERT INTO public.video VALUES (38, 'https://facebook.com/en-ca?page=1&offset=1', 9, 'justo sit amet nulla. Donec non justo.', '2022-08-09 12:28:57', 95);
INSERT INTO public.video VALUES (39, 'http://reddit.com/one?page=1&offset=1', 12, 'vel est', '2022-12-02 11:24:07', 26);
INSERT INTO public.video VALUES (40, 'https://bbc.co.uk/group/9?gi=100', 9, 'tellus faucibus leo, in lobortis', '2022-12-11 23:48:15', 59);
INSERT INTO public.video VALUES (41, 'https://bbc.co.uk/site?q=11', 78, 'arcu. Morbi sit amet massa. Quisque porttitor eros nec', '2023-02-16 10:50:56', 13);
INSERT INTO public.video VALUES (42, 'https://nytimes.com/settings?client=g', 33, 'diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget,', '2023-03-08 23:53:38', 45);
INSERT INTO public.video VALUES (43, 'http://facebook.com/site?client=g', 65, 'rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet,', '2022-08-17 11:20:10', 94);
INSERT INTO public.video VALUES (44, 'http://baidu.com/en-us?ab=441&aad=2', 5, 'condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec', '2023-01-09 17:10:37', 53);
INSERT INTO public.video VALUES (45, 'http://yahoo.com/sub/cars?q=test', 11, 'egestas a, scelerisque', '2022-12-18 07:53:24', 15);
INSERT INTO public.video VALUES (46, 'https://guardian.co.uk/sub/cars?q=test', 86, 'Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus.', '2022-12-19 21:03:30', 69);
INSERT INTO public.video VALUES (47, 'http://nytimes.com/en-us?ad=115', 76, 'eu odio tristique pharetra.', '2021-08-16 00:00:41', 44);
INSERT INTO public.video VALUES (48, 'https://wikipedia.org/en-us?q=test', 43, 'nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec,', '2022-12-28 17:15:19', 70);
INSERT INTO public.video VALUES (49, 'https://baidu.com/en-us?str=se', 31, 'a, arcu. Sed et', '2023-01-01 11:51:53', 20);
INSERT INTO public.video VALUES (50, 'https://wikipedia.org/settings?ab=441&aad=2', 19, 'et, magna. Praesent interdum ligula eu enim.', '2022-03-28 17:38:32', 65);
INSERT INTO public.video VALUES (51, 'https://pinterest.com/en-us?page=1&offset=1', 54, 'tempor arcu. Vestibulum ut eros non enim', '2022-06-10 21:11:02', 50);
INSERT INTO public.video VALUES (52, 'http://walmart.com/sub/cars?q=4', 50, 'ipsum dolor sit amet, consectetuer adipiscing elit.', '2021-10-27 00:41:03', 61);
INSERT INTO public.video VALUES (53, 'http://nytimes.com/user/110?q=11', 98, 'vitae aliquam eros turpis non enim. Mauris quis', '2021-07-31 13:13:30', 78);
INSERT INTO public.video VALUES (54, 'https://twitter.com/one?g=1', 64, 'mi. Duis risus odio, auctor vitae, aliquet nec,', '2022-02-20 17:25:11', 95);
INSERT INTO public.video VALUES (55, 'https://twitter.com/site?q=0', 27, 'Fusce aliquam,', '2023-02-16 12:43:56', 14);
INSERT INTO public.video VALUES (56, 'http://bbc.co.uk/site?client=g', 60, 'et, commodo at,', '2021-06-08 05:24:54', 64);
INSERT INTO public.video VALUES (57, 'http://yahoo.com/one?q=4', 21, 'Donec non justo. Proin non massa', '2022-02-01 18:54:33', 42);
INSERT INTO public.video VALUES (58, 'http://naver.com/site?q=0', 45, 'a ultricies adipiscing, enim mi tempor lorem, eget', '2022-08-10 05:56:35', 48);
INSERT INTO public.video VALUES (59, 'https://reddit.com/settings?q=11', 23, 'dis parturient montes, nascetur', '2023-04-20 12:48:28', 63);
INSERT INTO public.video VALUES (60, 'https://zoom.us/group/9?ab=441&aad=2', 92, 'quam. Pellentesque habitant morbi tristique senectus', '2021-05-29 04:00:58', 73);
INSERT INTO public.video VALUES (61, 'http://bbc.co.uk/en-ca?search=1&q=de', 62, 'eget odio. Aliquam vulputate', '2021-06-17 21:01:08', 69);
INSERT INTO public.video VALUES (62, 'http://walmart.com/en-us?q=test', 21, 'Nullam enim. Sed nulla ante, iaculis nec, eleifend non,', '2021-05-10 17:32:18', 76);
INSERT INTO public.video VALUES (63, 'https://yahoo.com/en-ca?gi=100', 23, 'interdum. Curabitur dictum. Phasellus', '2021-05-09 07:55:00', 96);
INSERT INTO public.video VALUES (64, 'http://ebay.com/fr?str=se', 50, 'vehicula', '2023-02-03 00:35:47', 95);
INSERT INTO public.video VALUES (65, 'http://netflix.com/sub?gi=100', 13, 'Nunc lectus pede, ultrices', '2023-01-20 08:12:36', 58);
INSERT INTO public.video VALUES (66, 'http://twitter.com/fr?client=g', 58, 'fermentum', '2022-02-20 22:27:44', 69);
INSERT INTO public.video VALUES (67, 'http://whatsapp.com/fr?ab=441&aad=2', 53, 'nisi sem semper erat, in consectetuer ipsum nunc id', '2022-10-17 01:21:44', 18);
INSERT INTO public.video VALUES (68, 'http://google.com/one?ab=441&aad=2', 31, 'non, sollicitudin a, malesuada id,', '2022-07-23 03:03:01', 83);
INSERT INTO public.video VALUES (69, 'https://nytimes.com/settings?search=1', 60, 'sit amet,', '2021-07-07 15:49:47', 58);
INSERT INTO public.video VALUES (70, 'http://pinterest.com/sub?search=1&q=de', 74, 'torquent per conubia nostra, per inceptos hymenaeos.', '2022-02-20 15:11:50', 62);
INSERT INTO public.video VALUES (71, 'http://yahoo.com/fr?g=1', 63, 'at arcu. Vestibulum', '2022-11-05 11:16:44', 84);
INSERT INTO public.video VALUES (72, 'http://ebay.com/en-ca?search=1', 13, 'Vestibulum', '2022-03-01 04:50:59', 53);
INSERT INTO public.video VALUES (73, 'https://walmart.com/group/9?ad=115', 77, 'aptent taciti sociosqu ad litora', '2023-01-16 08:17:03', 81);
INSERT INTO public.video VALUES (74, 'https://netflix.com/settings?client=g', 60, 'mauris ut mi. Duis risus', '2022-08-08 05:30:30', 12);
INSERT INTO public.video VALUES (75, 'http://instagram.com/fr?ab=441&aad=2', 46, 'Donec nibh.', '2023-04-06 02:08:42', 91);
INSERT INTO public.video VALUES (76, 'https://whatsapp.com/fr?k=0', 62, 'velit. Sed malesuada augue ut lacus.', '2022-04-19 14:36:53', 54);
INSERT INTO public.video VALUES (77, 'https://whatsapp.com/fr?q=4', 42, 'condimentum eget, volutpat ornare, facilisis eget,', '2023-01-14 03:06:50', 39);
INSERT INTO public.video VALUES (78, 'https://walmart.com/site?page=1&offset=1', 65, 'non, vestibulum nec, euismod in, dolor. Fusce feugiat.', '2022-05-09 10:59:36', 69);
INSERT INTO public.video VALUES (79, 'http://netflix.com/user/110?str=se', 56, 'et netus et malesuada fames', '2021-11-27 08:49:14', 20);
INSERT INTO public.video VALUES (80, 'http://naver.com/one?str=se', 49, 'ante. Vivamus non lorem vitae', '2021-07-12 23:12:49', 66);
INSERT INTO public.video VALUES (81, 'https://whatsapp.com/one?gi=100', 14, 'dolor sit', '2023-04-17 00:53:04', 64);
INSERT INTO public.video VALUES (82, 'http://google.com/one?p=8', 65, 'velit. Cras lorem lorem, luctus ut, pellentesque', '2023-04-08 03:47:58', 53);
INSERT INTO public.video VALUES (83, 'http://naver.com/en-ca?q=test', 85, 'dolor. Nulla semper', '2022-07-30 12:06:27', 16);
INSERT INTO public.video VALUES (84, 'http://guardian.co.uk/user/110?q=11', 74, 'nunc risus varius', '2021-08-12 08:48:18', 99);
INSERT INTO public.video VALUES (85, 'https://google.com/group/9?page=1&offset=1', 34, 'ipsum dolor sit amet,', '2022-12-15 16:52:33', 75);
INSERT INTO public.video VALUES (86, 'http://bbc.co.uk/sub/cars?ab=441&aad=2', 24, 'Mauris vel turpis. Aliquam adipiscing lobortis risus. In mi pede,', '2023-01-14 07:21:34', 41);
INSERT INTO public.video VALUES (87, 'https://nytimes.com/user/110?q=4', 54, 'pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper', '2023-03-08 15:11:05', 38);
INSERT INTO public.video VALUES (88, 'https://ebay.com/fr?ab=441&aad=2', 60, 'libero. Donec consectetuer mauris id sapien. Cras dolor', '2022-08-21 22:35:51', 40);
INSERT INTO public.video VALUES (89, 'https://facebook.com/en-ca?client=g', 59, 'fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus', '2023-03-06 14:21:37', 93);
INSERT INTO public.video VALUES (90, 'http://twitter.com/site?k=0', 86, 'Mauris molestie pharetra', '2021-11-28 05:21:03', 93);
INSERT INTO public.video VALUES (91, 'https://walmart.com/settings?q=11', 74, 'dictum placerat, augue. Sed molestie. Sed id risus', '2022-12-19 16:30:23', 74);
INSERT INTO public.video VALUES (92, 'https://bbc.co.uk/group/9?ab=441&aad=2', 47, 'aliquet molestie', '2022-08-22 07:54:57', 21);
INSERT INTO public.video VALUES (93, 'https://guardian.co.uk/site?ad=115', 68, 'fermentum risus, at', '2022-10-07 00:48:41', 57);
INSERT INTO public.video VALUES (94, 'https://pinterest.com/sub/cars?q=11', 64, 'dis parturient montes,', '2022-12-26 17:36:45', 40);
INSERT INTO public.video VALUES (95, 'https://facebook.com/user/110?g=1', 49, 'luctus vulputate, nisi sem semper erat, in consectetuer', '2022-04-28 21:12:04', 68);
INSERT INTO public.video VALUES (96, 'https://naver.com/fr?p=8', 81, 'quis urna. Nunc quis arcu vel', '2022-10-13 23:04:28', 45);
INSERT INTO public.video VALUES (97, 'https://bbc.co.uk/sub/cars?search=1&q=de', 33, 'accumsan convallis, ante', '2022-05-10 03:10:21', 16);
INSERT INTO public.video VALUES (98, 'https://google.com/site?g=1', 65, 'Nulla dignissim. Maecenas ornare egestas ligula.', '2021-10-13 23:02:59', 71);
INSERT INTO public.video VALUES (99, 'https://naver.com/settings?g=1', 56, 'faucibus orci luctus et ultrices posuere cubilia Curae', '2021-10-22 17:44:36', 12);
INSERT INTO public.video VALUES (100, 'http://yahoo.com/fr?p=8', 73, 'odio,', '2022-01-07 04:26:29', 81);


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 1, false);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 1, false);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 1, false);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 1, false);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- Name: communities communities_creator_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_creator_id_fk FOREIGN KEY (creator_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: communities_users communities_users_community_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_community_id_fk FOREIGN KEY (community_id) REFERENCES public.communities(id) ON DELETE CASCADE;


--
-- Name: communities_users communities_users_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: friendship friendship_requested_by_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_requested_by_user_id_fk FOREIGN KEY (requested_by_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: friendship friendship_requested_to_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_requested_to_user_id_fk FOREIGN KEY (requested_to_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: friendship friendship_status_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_status_id_fk FOREIGN KEY (status_id) REFERENCES public.friendship_statuses(id) ON DELETE RESTRICT;


--
-- Name: messages messages_from_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_from_user_id_fk FOREIGN KEY (from_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_to_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_to_user_id_fk FOREIGN KEY (to_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: photo photo_owner_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_main_photo_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_main_photo_id_fk FOREIGN KEY (main_photo_id) REFERENCES public.photo(id);


--
-- Name: video video_owner_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
