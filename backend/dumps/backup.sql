--
-- PostgreSQL database dump
--

-- Dumped from database version 13.12 (Debian 13.12-1.pgdg120+1)
-- Dumped by pg_dump version 13.12 (Debian 13.12-1.pgdg120+1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO userweb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO userweb;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO userweb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO userweb;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO userweb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO userweb;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO userweb;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO userweb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO userweb;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO userweb;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO userweb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO userweb;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: credit_proposal_creditproposal; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.credit_proposal_creditproposal (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    document text NOT NULL,
    name character varying(180) NOT NULL,
    approved boolean NOT NULL,
    human_analysis boolean NOT NULL
);


ALTER TABLE public.credit_proposal_creditproposal OWNER TO userweb;

--
-- Name: credit_proposal_creditproposal_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.credit_proposal_creditproposal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credit_proposal_creditproposal_id_seq OWNER TO userweb;

--
-- Name: credit_proposal_creditproposal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.credit_proposal_creditproposal_id_seq OWNED BY public.credit_proposal_creditproposal.id;


--
-- Name: credit_proposal_proposalrequirements; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.credit_proposal_proposalrequirements (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    proposal_required_fields text NOT NULL
);


ALTER TABLE public.credit_proposal_proposalrequirements OWNER TO userweb;

--
-- Name: credit_proposal_proposalrequirements_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.credit_proposal_proposalrequirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credit_proposal_proposalrequirements_id_seq OWNER TO userweb;

--
-- Name: credit_proposal_proposalrequirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.credit_proposal_proposalrequirements_id_seq OWNED BY public.credit_proposal_proposalrequirements.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO userweb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO userweb;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_results_chordcounter; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.django_celery_results_chordcounter (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    sub_tasks text NOT NULL,
    count integer NOT NULL,
    CONSTRAINT django_celery_results_chordcounter_count_check CHECK ((count >= 0))
);


ALTER TABLE public.django_celery_results_chordcounter OWNER TO userweb;

--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.django_celery_results_chordcounter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_chordcounter_id_seq OWNER TO userweb;

--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.django_celery_results_chordcounter_id_seq OWNED BY public.django_celery_results_chordcounter.id;


--
-- Name: django_celery_results_groupresult; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.django_celery_results_groupresult (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_done timestamp with time zone NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text
);


ALTER TABLE public.django_celery_results_groupresult OWNER TO userweb;

--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.django_celery_results_groupresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_groupresult_id_seq OWNER TO userweb;

--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.django_celery_results_groupresult_id_seq OWNED BY public.django_celery_results_groupresult.id;


--
-- Name: django_celery_results_taskresult; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.django_celery_results_taskresult (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    meta text,
    task_args text,
    task_kwargs text,
    task_name character varying(255),
    worker character varying(100),
    date_created timestamp with time zone NOT NULL,
    periodic_task_name character varying(255)
);


ALTER TABLE public.django_celery_results_taskresult OWNER TO userweb;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.django_celery_results_taskresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_taskresult_id_seq OWNER TO userweb;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.django_celery_results_taskresult_id_seq OWNED BY public.django_celery_results_taskresult.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO userweb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO userweb;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO userweb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: userweb
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO userweb;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userweb
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: userweb
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO userweb;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: credit_proposal_creditproposal id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.credit_proposal_creditproposal ALTER COLUMN id SET DEFAULT nextval('public.credit_proposal_creditproposal_id_seq'::regclass);


--
-- Name: credit_proposal_proposalrequirements id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.credit_proposal_proposalrequirements ALTER COLUMN id SET DEFAULT nextval('public.credit_proposal_proposalrequirements_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_results_chordcounter id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_celery_results_chordcounter ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_chordcounter_id_seq'::regclass);


--
-- Name: django_celery_results_groupresult id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_celery_results_groupresult ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_groupresult_id_seq'::regclass);


--
-- Name: django_celery_results_taskresult id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_taskresult_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add task result	7	add_taskresult
26	Can change task result	7	change_taskresult
27	Can delete task result	7	delete_taskresult
28	Can view task result	7	view_taskresult
29	Can add chord counter	8	add_chordcounter
30	Can change chord counter	8	change_chordcounter
31	Can delete chord counter	8	delete_chordcounter
32	Can view chord counter	8	view_chordcounter
33	Can add group result	9	add_groupresult
34	Can change group result	9	change_groupresult
35	Can delete group result	9	delete_groupresult
36	Can view group result	9	view_groupresult
37	Can add Proposta de Crédito	10	add_creditproposal
38	Can change Proposta de Crédito	10	change_creditproposal
39	Can delete Proposta de Crédito	10	delete_creditproposal
40	Can view Proposta de Crédito	10	view_creditproposal
41	Can add Requisitos da Proposta de Crédito	11	add_proposalrequirements
42	Can change Requisitos da Proposta de Crédito	11	change_proposalrequirements
43	Can delete Requisitos da Proposta de Crédito	11	delete_proposalrequirements
44	Can view Requisitos da Proposta de Crédito	11	view_proposalrequirements
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$4979qOVKmckt8dNt3ELjf6$jCMgZYxuzwI4zs3V33rEvOc1N4pf8sFgjslAL7bSgUo=	2023-08-27 22:26:09.7442+00	t	DigitalSys			admin@digitalsys.com	t	t	2023-08-27 22:26:03.587292+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: credit_proposal_creditproposal; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.credit_proposal_creditproposal (id, created_at, updated_at, deleted_at, document, name, approved, human_analysis) FROM stdin;
\.


--
-- Data for Name: credit_proposal_proposalrequirements; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.credit_proposal_proposalrequirements (id, created_at, updated_at, deleted_at, proposal_required_fields) FROM stdin;
1	2023-08-27 22:25:46.679984+00	2023-08-27 22:25:46.680012+00	\N	{'cpf': 'number', 'cnpj': 'number', 'reason': 'text'}
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_celery_results_chordcounter; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.django_celery_results_chordcounter (id, group_id, sub_tasks, count) FROM stdin;
\.


--
-- Data for Name: django_celery_results_groupresult; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.django_celery_results_groupresult (id, group_id, date_created, date_done, content_type, content_encoding, result) FROM stdin;
\.


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, meta, task_args, task_kwargs, task_name, worker, date_created, periodic_task_name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	django_celery_results	taskresult
8	django_celery_results	chordcounter
9	django_celery_results	groupresult
10	credit_proposal	creditproposal
11	credit_proposal	proposalrequirements
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-08-27 22:25:46.102381+00
2	auth	0001_initial	2023-08-27 22:25:46.191072+00
3	admin	0001_initial	2023-08-27 22:25:46.216308+00
4	admin	0002_logentry_remove_auto_add	2023-08-27 22:25:46.232623+00
5	admin	0003_logentry_add_action_flag_choices	2023-08-27 22:25:46.241965+00
6	contenttypes	0002_remove_content_type_name	2023-08-27 22:25:46.259293+00
7	auth	0002_alter_permission_name_max_length	2023-08-27 22:25:46.268432+00
8	auth	0003_alter_user_email_max_length	2023-08-27 22:25:46.277353+00
9	auth	0004_alter_user_username_opts	2023-08-27 22:25:46.28767+00
10	auth	0005_alter_user_last_login_null	2023-08-27 22:25:46.297513+00
11	auth	0006_require_contenttypes_0002	2023-08-27 22:25:46.300957+00
12	auth	0007_alter_validators_add_error_messages	2023-08-27 22:25:46.396281+00
13	auth	0008_alter_user_username_max_length	2023-08-27 22:25:46.438721+00
14	auth	0009_alter_user_last_name_max_length	2023-08-27 22:25:46.451407+00
15	auth	0010_alter_group_name_max_length	2023-08-27 22:25:46.465212+00
16	auth	0011_update_proxy_permissions	2023-08-27 22:25:46.48336+00
17	auth	0012_alter_user_first_name_max_length	2023-08-27 22:25:46.495465+00
18	credit_proposal	0001_initial	2023-08-27 22:25:46.611724+00
19	credit_proposal	0002_forward_requirements	2023-08-27 22:25:46.697493+00
20	django_celery_results	0001_initial	2023-08-27 22:25:46.75354+00
21	django_celery_results	0002_add_task_name_args_kwargs	2023-08-27 22:25:46.762883+00
22	django_celery_results	0003_auto_20181106_1101	2023-08-27 22:25:46.76718+00
23	django_celery_results	0004_auto_20190516_0412	2023-08-27 22:25:46.803233+00
24	django_celery_results	0005_taskresult_worker	2023-08-27 22:25:46.815116+00
25	django_celery_results	0006_taskresult_date_created	2023-08-27 22:25:46.83402+00
26	django_celery_results	0007_remove_taskresult_hidden	2023-08-27 22:25:46.838701+00
27	django_celery_results	0008_chordcounter	2023-08-27 22:25:46.856049+00
28	django_celery_results	0009_groupresult	2023-08-27 22:25:46.951846+00
29	django_celery_results	0010_remove_duplicate_indices	2023-08-27 22:25:46.959239+00
30	django_celery_results	0011_taskresult_periodic_task_name	2023-08-27 22:25:47.00305+00
31	sessions	0001_initial	2023-08-27 22:25:47.018326+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: userweb
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
kx979sqq6cehywpow1z1angihbq2tmq5	.eJxVjEEOwiAQRe_C2hAo0A4u3XsGwgyMVA0kpV0Z765NutDtf-_9lwhxW0vYel7CnMRZaHH63TDSI9cdpHustyap1XWZUe6KPGiX15by83K4fwcl9vKtlR8H4ESEBDqCJ2WUmZy1ZNhoC8wE2cPAClk5NTmEDBoN2kSW7SjeH99KN9s:1qaOCv:Xf2IjTea8HPohW-XzRjo_ZFlHl9jmPQdxIWj2z8fCTM	2023-09-10 22:26:09.749682+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: credit_proposal_creditproposal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.credit_proposal_creditproposal_id_seq', 1, false);


--
-- Name: credit_proposal_proposalrequirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.credit_proposal_proposalrequirements_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.django_celery_results_chordcounter_id_seq', 1, false);


--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.django_celery_results_groupresult_id_seq', 1, false);


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.django_celery_results_taskresult_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userweb
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 31, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: credit_proposal_creditproposal credit_proposal_creditproposal_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.credit_proposal_creditproposal
    ADD CONSTRAINT credit_proposal_creditproposal_pkey PRIMARY KEY (id);


--
-- Name: credit_proposal_proposalrequirements credit_proposal_proposalrequirements_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.credit_proposal_proposalrequirements
    ADD CONSTRAINT credit_proposal_proposalrequirements_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_chordcounter django_celery_results_chordcounter_group_id_key; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_group_id_key UNIQUE (group_id);


--
-- Name: django_celery_results_chordcounter django_celery_results_chordcounter_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_groupresult django_celery_results_groupresult_group_id_key; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_celery_results_groupresult
    ADD CONSTRAINT django_celery_results_groupresult_group_id_key UNIQUE (group_id);


--
-- Name: django_celery_results_groupresult django_celery_results_groupresult_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_celery_results_groupresult
    ADD CONSTRAINT django_celery_results_groupresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_task_id_key; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: credit_proposal_creditproposal_deleted_at_da967b4a; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX credit_proposal_creditproposal_deleted_at_da967b4a ON public.credit_proposal_creditproposal USING btree (deleted_at);


--
-- Name: credit_proposal_proposalrequirements_deleted_at_2f327f78; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX credit_proposal_proposalrequirements_deleted_at_2f327f78 ON public.credit_proposal_proposalrequirements USING btree (deleted_at);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_cele_date_cr_bd6c1d_idx; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_cele_date_cr_bd6c1d_idx ON public.django_celery_results_groupresult USING btree (date_created);


--
-- Name: django_cele_date_cr_f04a50_idx; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_cele_date_cr_f04a50_idx ON public.django_celery_results_taskresult USING btree (date_created);


--
-- Name: django_cele_date_do_caae0e_idx; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_cele_date_do_caae0e_idx ON public.django_celery_results_groupresult USING btree (date_done);


--
-- Name: django_cele_date_do_f59aad_idx; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_cele_date_do_f59aad_idx ON public.django_celery_results_taskresult USING btree (date_done);


--
-- Name: django_cele_status_9b6201_idx; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_cele_status_9b6201_idx ON public.django_celery_results_taskresult USING btree (status);


--
-- Name: django_cele_task_na_08aec9_idx; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_cele_task_na_08aec9_idx ON public.django_celery_results_taskresult USING btree (task_name);


--
-- Name: django_cele_worker_d54dd8_idx; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_cele_worker_d54dd8_idx ON public.django_celery_results_taskresult USING btree (worker);


--
-- Name: django_celery_results_chordcounter_group_id_1f70858c_like; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_celery_results_chordcounter_group_id_1f70858c_like ON public.django_celery_results_chordcounter USING btree (group_id varchar_pattern_ops);


--
-- Name: django_celery_results_groupresult_group_id_a085f1a9_like; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_celery_results_groupresult_group_id_a085f1a9_like ON public.django_celery_results_groupresult USING btree (group_id varchar_pattern_ops);


--
-- Name: django_celery_results_taskresult_task_id_de0d95bf_like; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON public.django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: userweb
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: userweb
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

