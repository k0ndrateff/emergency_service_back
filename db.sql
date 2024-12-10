--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13 (Homebrew)
-- Dumped by pg_dump version 14.13 (Homebrew)

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
-- Name: crew; Type: TABLE; Schema: public; Owner: newuser
--

CREATE TABLE public.crew (
    id integer NOT NULL,
    type integer NOT NULL,
    status integer NOT NULL,
    size integer NOT NULL,
    officer_phone character varying(33),
    base_address text,
    current_lat real,
    current_lon real
);


ALTER TABLE public.crew OWNER TO newuser;

--
-- Name: crew_id_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.crew_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crew_id_seq OWNER TO newuser;

--
-- Name: crew_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.crew_id_seq OWNED BY public.crew.id;


--
-- Name: crew_size_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.crew_size_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crew_size_seq OWNER TO newuser;

--
-- Name: crew_size_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.crew_size_seq OWNED BY public.crew.size;


--
-- Name: crew_status_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.crew_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crew_status_seq OWNER TO newuser;

--
-- Name: crew_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.crew_status_seq OWNED BY public.crew.status;


--
-- Name: crew_type_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.crew_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crew_type_seq OWNER TO newuser;

--
-- Name: crew_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.crew_type_seq OWNED BY public.crew.type;


--
-- Name: incident; Type: TABLE; Schema: public; Owner: newuser
--

CREATE TABLE public.incident (
    id integer NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    status integer NOT NULL,
    description text,
    danger_class integer NOT NULL,
    priority integer NOT NULL,
    id_operator integer NOT NULL,
    services integer[],
    address text
);


ALTER TABLE public.incident OWNER TO newuser;

--
-- Name: incident_danger_class_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.incident_danger_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_danger_class_seq OWNER TO newuser;

--
-- Name: incident_danger_class_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.incident_danger_class_seq OWNED BY public.incident.danger_class;


--
-- Name: incident_id_operator_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.incident_id_operator_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_id_operator_seq OWNER TO newuser;

--
-- Name: incident_id_operator_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.incident_id_operator_seq OWNED BY public.incident.id_operator;


--
-- Name: incident_id_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.incident_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_id_seq OWNER TO newuser;

--
-- Name: incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.incident_id_seq OWNED BY public.incident.id;


--
-- Name: incident_priority_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.incident_priority_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_priority_seq OWNER TO newuser;

--
-- Name: incident_priority_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.incident_priority_seq OWNED BY public.incident.priority;


--
-- Name: incident_status_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.incident_status_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_status_seq OWNER TO newuser;

--
-- Name: incident_status_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.incident_status_seq OWNED BY public.incident.status;


--
-- Name: operator; Type: TABLE; Schema: public; Owner: newuser
--

CREATE TABLE public.operator (
    id integer NOT NULL,
    first_name character varying(127),
    last_name character varying(127),
    middle_name character varying(127),
    is_free boolean
);


ALTER TABLE public.operator OWNER TO newuser;

--
-- Name: operator_id_seq; Type: SEQUENCE; Schema: public; Owner: newuser
--

CREATE SEQUENCE public.operator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.operator_id_seq OWNER TO newuser;

--
-- Name: operator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newuser
--

ALTER SEQUENCE public.operator_id_seq OWNED BY public.operator.id;


--
-- Name: crew id; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.crew ALTER COLUMN id SET DEFAULT nextval('public.crew_id_seq'::regclass);


--
-- Name: crew type; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.crew ALTER COLUMN type SET DEFAULT nextval('public.crew_type_seq'::regclass);


--
-- Name: crew status; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.crew ALTER COLUMN status SET DEFAULT nextval('public.crew_status_seq'::regclass);


--
-- Name: crew size; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.crew ALTER COLUMN size SET DEFAULT nextval('public.crew_size_seq'::regclass);


--
-- Name: incident id; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.incident ALTER COLUMN id SET DEFAULT nextval('public.incident_id_seq'::regclass);


--
-- Name: incident status; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.incident ALTER COLUMN status SET DEFAULT nextval('public.incident_status_seq'::regclass);


--
-- Name: incident danger_class; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.incident ALTER COLUMN danger_class SET DEFAULT nextval('public.incident_danger_class_seq'::regclass);


--
-- Name: incident priority; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.incident ALTER COLUMN priority SET DEFAULT nextval('public.incident_priority_seq'::regclass);


--
-- Name: incident id_operator; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.incident ALTER COLUMN id_operator SET DEFAULT nextval('public.incident_id_operator_seq'::regclass);


--
-- Name: operator id; Type: DEFAULT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.operator ALTER COLUMN id SET DEFAULT nextval('public.operator_id_seq'::regclass);


--
-- Data for Name: crew; Type: TABLE DATA; Schema: public; Owner: newuser
--

COPY public.crew (id, type, status, size, officer_phone, base_address, current_lat, current_lon) FROM stdin;
1	1	1	3	+79912996581	Москва, ул Лобачевского, 42	55.653706	37.491535
\.


--
-- Data for Name: incident; Type: TABLE DATA; Schema: public; Owner: newuser
--

COPY public.incident (id, start_time, end_time, status, description, danger_class, priority, id_operator, services, address) FROM stdin;
3	2024-10-10 21:42:56	2024-10-10 21:42:59	2	Ложный	4	4	1	\N	\N
8	2024-10-28 00:16:22	\N	1	Боль в животе	1	3	14	\N	
7	2024-10-28 00:16:07	\N	2	Учебная тревога	4	3	14	\N	
6	2024-10-28 00:08:30	\N	1	Запах газа	1	1	14	\N	
9	2024-10-28 00:32:28	\N	1	Тест системы	3	3	14	\N	
5	2024-10-28 00:08:29	\N	1	Падение	1	1	14	\N	
11	2024-11-02 20:35:30	2024-11-02 18:17:01.636	4	Ложный	1	4	14	\N	
12	2024-11-12 23:48:15	2024-11-12 21:05:20.598	3	ldjsdjslds	1	4	14	\N	
4	2024-10-19 00:50:23	\N	1	Пожар	1	1	1	\N	Вернадского, 78
10	2024-10-28 00:37:49	\N	1	Тест	1	2	14	\N	улица Доктора Гааза
2	2024-10-10 21:40:40	2024-10-18 17:58:40.478	3	Плохо на улице	3	4	1	\N	\N
\.


--
-- Data for Name: operator; Type: TABLE DATA; Schema: public; Owner: newuser
--

COPY public.operator (id, first_name, last_name, middle_name, is_free) FROM stdin;
8	Кондратьев	Егор	Александрович	t
11	Лалала	лала	лалал	t
12	Кабылберды	Амирхан	Амолаевич	t
14	Тестов	Тест	Тестович	t
\.


--
-- Name: crew_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.crew_id_seq', 1, true);


--
-- Name: crew_size_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.crew_size_seq', 1, false);


--
-- Name: crew_status_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.crew_status_seq', 1, false);


--
-- Name: crew_type_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.crew_type_seq', 1, false);


--
-- Name: incident_danger_class_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.incident_danger_class_seq', 1, false);


--
-- Name: incident_id_operator_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.incident_id_operator_seq', 1, false);


--
-- Name: incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.incident_id_seq', 12, true);


--
-- Name: incident_priority_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.incident_priority_seq', 1, false);


--
-- Name: incident_status_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.incident_status_seq', 1, false);


--
-- Name: operator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newuser
--

SELECT pg_catalog.setval('public.operator_id_seq', 14, true);


--
-- Name: crew crew_pkey; Type: CONSTRAINT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.crew
    ADD CONSTRAINT crew_pkey PRIMARY KEY (id);


--
-- Name: incident incident_pkey; Type: CONSTRAINT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_pkey PRIMARY KEY (id);


--
-- Name: operator operator_pkey; Type: CONSTRAINT; Schema: public; Owner: newuser
--

ALTER TABLE ONLY public.operator
    ADD CONSTRAINT operator_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

