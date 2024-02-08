--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: all_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.all_users (
    uid integer NOT NULL,
    uname character varying(100),
    question character varying,
    ans character varying(50),
    pass character varying(50)
);


ALTER TABLE public.all_users OWNER TO postgres;

--
-- Name: all_users_uid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.all_users_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.all_users_uid_seq OWNER TO postgres;

--
-- Name: all_users_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.all_users_uid_seq OWNED BY public.all_users.uid;


--
-- Name: friends; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friends (
    a integer,
    b integer
);


ALTER TABLE public.friends OWNER TO postgres;

--
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests (
    a integer,
    b integer
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- Name: t16; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t16 (
    sender integer,
    msg character varying,
    at character varying
);


ALTER TABLE public.t16 OWNER TO postgres;

--
-- Name: t17; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t17 (
    sender integer,
    msg character varying,
    at character varying
);


ALTER TABLE public.t17 OWNER TO postgres;

--
-- Name: t18; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t18 (
    sender integer,
    msg character varying,
    at character varying
);


ALTER TABLE public.t18 OWNER TO postgres;

--
-- Name: t23; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t23 (
    sender integer,
    msg character varying,
    at character varying
);


ALTER TABLE public.t23 OWNER TO postgres;

--
-- Name: t7; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t7 (
    sender integer,
    msg character varying,
    at character varying
);


ALTER TABLE public.t7 OWNER TO postgres;

--
-- Name: all_users uid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.all_users ALTER COLUMN uid SET DEFAULT nextval('public.all_users_uid_seq'::regclass);


--
-- Data for Name: all_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.all_users (uid, uname, question, ans, pass) FROM stdin;
2	hari	What is your first School name ?	aes	root
4	a	What is your first School name ?	a	a
3	b	What is your first School name ?	b	c
8	u3	What is your first School name ?	u3	u3
9	u4	What is your first School name ?	u4	u4
10	u5	What is your first School name ?	u5	u5
11	c	What is your first School name ?	c	y
12	d	What is your first School name ?	d	d
\.


--
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friends (a, b) FROM stdin;
3	4
9	8
8	10
11	12
4	12
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requests (a, b) FROM stdin;
12	11
4	8
4	8
4	10
\.


--
-- Data for Name: t16; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t16 (sender, msg, at) FROM stdin;
4	hekko d	02-06 17:10
12	hi q=a==	02-06 17:10
\.


--
-- Data for Name: t17; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t17 (sender, msg, at) FROM stdin;
9	Hello	30-05 19:33
8	Hii	30-05 19:33
\.


--
-- Data for Name: t18; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t18 (sender, msg, at) FROM stdin;
\.


--
-- Data for Name: t23; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t23 (sender, msg, at) FROM stdin;
11	hi dd	02-06 16:34
12	Hello c	02-06 16:36
\.


--
-- Data for Name: t7; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t7 (sender, msg, at) FROM stdin;
4	hi	27-05 20:48
4	hi	27-05 21:46
4	hwllo	27-05 21:47
4	a	27-05 21:48
3	ssup a ?	27-05 21:49
4	sada	27-05 22:07
4	java	27-05 22:16
4	mava	03-06 10:27
\.


--
-- Name: all_users_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.all_users_uid_seq', 12, true);


--
-- Name: all_users all_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.all_users
    ADD CONSTRAINT all_users_pkey PRIMARY KEY (uid);


--
-- Name: all_users all_users_uname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.all_users
    ADD CONSTRAINT all_users_uname_key UNIQUE (uname);


--
-- Name: friends friends_a_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_a_fkey FOREIGN KEY (a) REFERENCES public.all_users(uid);


--
-- Name: friends friends_b_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friends
    ADD CONSTRAINT friends_b_fkey FOREIGN KEY (b) REFERENCES public.all_users(uid);


--
-- Name: requests requests_req_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_req_by_fkey FOREIGN KEY (a) REFERENCES public.all_users(uid);


--
-- Name: requests requests_req_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_req_to_fkey FOREIGN KEY (b) REFERENCES public.all_users(uid);


--
-- Name: t16 t16_sender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t16
    ADD CONSTRAINT t16_sender_fkey FOREIGN KEY (sender) REFERENCES public.all_users(uid);


--
-- Name: t17 t17_sender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t17
    ADD CONSTRAINT t17_sender_fkey FOREIGN KEY (sender) REFERENCES public.all_users(uid);


--
-- Name: t18 t18_sender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t18
    ADD CONSTRAINT t18_sender_fkey FOREIGN KEY (sender) REFERENCES public.all_users(uid);


--
-- Name: t23 t23_sender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t23
    ADD CONSTRAINT t23_sender_fkey FOREIGN KEY (sender) REFERENCES public.all_users(uid);


--
-- Name: t7 t7_sender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t7
    ADD CONSTRAINT t7_sender_fkey FOREIGN KEY (sender) REFERENCES public.all_users(uid);


--
-- PostgreSQL database dump complete
--

