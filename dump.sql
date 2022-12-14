--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "creatorId" integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "visitsCount" integer DEFAULT 0
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '3af72afd-0fe5-459c-b4a7-6499f95c26a6', 1, '2022-10-13 12:34:56.114337');
INSERT INTO public.sessions VALUES (2, '5562d5e5-47fe-4edd-ac28-6508bea9ed4c', 2, '2022-10-14 11:03:26.913386');
INSERT INTO public.sessions VALUES (3, '91f0ab4f-f3e0-443f-bf99-897e01b16307', 3, '2022-10-14 16:22:59.011986');
INSERT INTO public.sessions VALUES (4, '75341b18-3eda-40ba-baf5-59c0c7cbba93', 3, '2022-10-14 16:23:15.503942');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (2, 1, 'B8pYBqw6gP9BHOeyzhCI4', 'https://br.mundo.com/fotos/201506/animal-selfie-1-600x400.jpg', '2022-10-14 11:23:04.781684', 8);
INSERT INTO public.urls VALUES (3, 1, 'fAXQ2y4_CV2eZ2uUrXri0', 'https://br.mundo.com/fotos/201506/animal-selfie-1-600x400.jpg', '2022-10-14 11:23:13.687965', 5);
INSERT INTO public.urls VALUES (4, 1, 'vLiLiRfHvJNcrCg8e_sMK', 'https://dba.stackexchange.com/questions/2758/how-to-get-the-timestamp-column-in-only-milliseconds-from-postgresql', '2022-10-14 15:50:37.617339', 0);
INSERT INTO public.urls VALUES (5, 2, 'CT_TYqnt4h2qEpO1M-Qmg', 'https://dba.stackexchange.com/questions/2758/how-to-get-the-timestamp-column-in-only-milliseconds-from-postgresql', '2022-10-14 15:51:21.487889', 2);
INSERT INTO public.urls VALUES (6, 3, 'YPVZVEi_MZGHTIHS5gxCq', 'https://dropsdejogos.uai.com.br/wp-content/uploads/sites/10/2020/09/fortnite-1-scaled.jpg', '2022-10-14 16:25:26.413963', 0);
INSERT INTO public.urls VALUES (7, 3, 'qLyaMQrbaBOEGO5Ytc0ef', 'https://dropsdejogos.uai.com.br/wp-content/uploads/sites/10/2020/09/fortnite-1-scaled.jpg', '2022-10-14 16:39:07.800099', 0);
INSERT INTO public.urls VALUES (8, 3, 'WpunZPJIO-3sjtahallyj', 'https://dropsdejogos.uai.com.br/wp-content/uploads/sites/10/2020/09/fortnite-1-scaled.jpg', '2022-10-14 16:42:20.556151', 0);
INSERT INTO public.urls VALUES (9, 3, '3EOI4doVQzLCJ0Z5Ym6jn', 'https://dropsdejogos.uai.com.br/wp-content/uploads/sites/10/2020/09/fortnite-1-scaled.jpg', '2022-10-14 16:42:34.466679', 0);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Vinicius', 'vini@gmail.com', '$2b$10$ukzAorxsV6LnYAU8HBw7bOjxggGacYj.7gThg6Y/mZzap..8rbGka');
INSERT INTO public.users VALUES (2, 'mariana', 'mariana@gmail.com', '$2b$10$NxjuXobVzj2YikHGx7jDPOWxGQoTUTK9CsoQwME76TedG3oQIFwbu');
INSERT INTO public.users VALUES (3, 'pedrinculos', 'pedrin@gmail.com', '$2b$10$VcSulKWBvbEOAv54o3i8fOit9L5ZxOX0QVSJKbEb6IEo00JvAcAPi');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_creatorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

