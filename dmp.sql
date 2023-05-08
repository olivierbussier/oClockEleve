--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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
-- Name: emprunts_nantes; Type: TABLE; Schema: public; Owner: olivier
--

CREATE TABLE public.emprunts_nantes (
    id integer NOT NULL,
    reference_interne text,
    budget text,
    preteur text,
    date_de_signature date,
    montant_initial money,
    capital_restant_du_au_01_01_2022 money,
    duree_totale numeric,
    duree_residuelle numeric,
    taux text,
    classification_gissler text
);


ALTER TABLE public.emprunts_nantes OWNER TO olivier;

--
-- Name: emprunts_nantes_id_seq; Type: SEQUENCE; Schema: public; Owner: olivier
--

CREATE SEQUENCE public.emprunts_nantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emprunts_nantes_id_seq OWNER TO olivier;

--
-- Name: emprunts_nantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivier
--

ALTER SEQUENCE public.emprunts_nantes_id_seq OWNED BY public.emprunts_nantes.id;


--
-- Name: sac; Type: TABLE; Schema: public; Owner: olivier
--

CREATE TABLE public.sac (
    id integer NOT NULL,
    categorie character varying(255) NOT NULL,
    materiel character varying(255) NOT NULL,
    type character varying(255),
    dans_sac character varying(32) NOT NULL,
    poids_en_g integer,
    present character varying(32),
    commentaire character varying(255),
    pese character varying(32),
    emplacement character varying(128)
);


ALTER TABLE public.sac OWNER TO olivier;

--
-- Name: sac_id_seq; Type: SEQUENCE; Schema: public; Owner: olivier
--

CREATE SEQUENCE public.sac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sac_id_seq OWNER TO olivier;

--
-- Name: sac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: olivier
--

ALTER SEQUENCE public.sac_id_seq OWNED BY public.sac.id;


--
-- Name: emprunts_nantes id; Type: DEFAULT; Schema: public; Owner: olivier
--

ALTER TABLE ONLY public.emprunts_nantes ALTER COLUMN id SET DEFAULT nextval('public.emprunts_nantes_id_seq'::regclass);


--
-- Name: sac id; Type: DEFAULT; Schema: public; Owner: olivier
--

ALTER TABLE ONLY public.sac ALTER COLUMN id SET DEFAULT nextval('public.sac_id_seq'::regclass);


--
-- Data for Name: emprunts_nantes; Type: TABLE DATA; Schema: public; Owner: olivier
--

COPY public.emprunts_nantes (id, reference_interne, budget, preteur, date_de_signature, montant_initial, capital_restant_du_au_01_01_2022, duree_totale, duree_residuelle, taux, classification_gissler) FROM stdin;
1	291	BUDGET PRINCIPAL	CREDIT FONCIER	2005-12-14	25 000 000,00 €	6 250 000,00 €	20.00	4.83	Euribor 12 M + 0.0325	1A
2	299	BUDGET PRINCIPAL	BANQUE POSTALE	2007-01-31	10 000 000,00 €	4 009 766,43 €	21.00	5.83	Euribor 03 M	1A
3	320	BUDGET PRINCIPAL	SFIL	2003-12-18	10 000 000,00 €	1 500 000,00 €	20.00	2.00	Euribor 12 M + 0.04	1A
4	327	BUDGET PRINCIPAL	SFIL	2004-06-29	571 875,00 €	103 125,00 €	15.00	2.58	Euribor 03 M + 0.3	1A
5	333	BUDGET PRINCIPAL	CAISSE D’EPARGNE	2009-12-22	9 000 000,00 €	3 825 000,00 €	20.00	8.40	Euribor 03 M + 0.35	1A
6	356	BUDGET PRINCIPAL	CREDIT FONCIER	2014-07-18	5 000 000,00 €	2 583 333,43 €	15.00	7.61	Taux fixe à 2.63 %	1A
7	362	BUDGET PRINCIPAL	AFL	2015-12-03	25 000 000,00 €	14 999 999,92 €	15.00	8.97	Taux fixe à 1.315 %	1A
8	366	BUDGET PRINCIPAL	CAISSE DES DEPOTS ET CONSIGNATIONS	2016-06-10	3 666 269,00 €	2 970 731,91 €	20.00	15.50	Livret A + 0.75	1A
9	369	BUDGET PRINCIPAL	PBB	2016-11-21	15 000 000,00 €	11 000 000,00 €	15.00	10.08	Euribor 12 M + 0.36	1A
10	387	BUDGET PRINCIPAL	BANQUE POSTALE	2020-11-19	10 000 000,00 €	9 625 000,00 €	20.00	19.00	Taux fixe à 0.41 %	1A
11	389	BUDGET PRINCIPAL	BANQUE POSTALE	2020-11-19	10 000 000,00 €	10 000 000,00 €	20.00	19.00	Taux fixe à 0.42 %	1A
12	398	BUDGET PRINCIPAL	AFL	2021-11-23	25 000 000,00 €	0,00 €	20.00	20.00	Taux fixe à 0.64 %	1A
13	assain-421	BUDGET ASSAINISSEMENT	AGENCE EAU LOIRE BRETAGNE	2005-01-12	94 410,00 €	6 294,00 €	17.00	0.33	Taux fixe à 0 %	1A
14	assain-422	BUDGET ASSAINISSEMENT	AGENCE EAU LOIRE BRETAGNE	2005-01-12	85 600,00 €	5 706,62 €	17.00	0.42	Taux fixe à 0 %	1A
15	assain-425	BUDGET ASSAINISSEMENT	AGENCE EAU LOIRE BRETAGNE	2005-10-19	104 910,00 €	13 988,00 €	17.00	1.58	Taux fixe à 0 %	1A
16	DECHETS-007	BUDGET DECHETS	CAISSE D’EPARGNE	2010-11-08	15 000 000,00 €	4 000 000,00 €	15.00	3.90	Taux fixe à 3.03 %	1A
17	Eau-135	BUDGET EAU	CREDIT AGRICOLE CIB	2006-01-02	4 000 000,00 €	1 354 400,00 €	20.00	4.96	TAG 03 M + 0.05	1A
18	Eau-149	BUDGET EAU	AGENCE EAU LOIRE BRETAGNE	2015-01-15	261 030,00 €	192 543,46 €	19.00	12.33	Taux fixe à 0 %	1A
19	Stat-101	BUDGET STATIONNEMENT	CREDIT FONCIER	2014-07-16	10 543 672,32 €	5 810 423,16 €	20.00	14.50	Taux fixe à 2.12 %	1A
20	Transport-12	BUDGET TRANSPORT	AFL	2019-07-08	30 000 000,00 €	26 250 000,00 €	20.00	17.47	Taux fixe à 0.32 %	1A
21	304	BUDGET PRINCIPAL	BANQUE POSTALE	2007-07-26	16 283 445,00 €	7 456 929,91 €	20.00	6.00	Taux fixe à 3.16 %	1A
22	332	BUDGET PRINCIPAL	CREDIT AGRICOLE CIB	2009-11-05	15 000 000,00 €	6 750 000,00 €	21.00	8.75	Euribor 03 M + 0.42	1A
23	340	BUDGET PRINCIPAL	CREDIT FONCIER	2004-12-22	7 500 000,00 €	2 000 000,00 €	15.00	3.75	TAG 06 M + 0.075	1A
24	341	BUDGET PRINCIPAL	SFIL	2010-11-08	750 000,00 €	233 621,82 €	15.00	4.00	Taux fixe à 1.82 %	1A
25	342	BUDGET PRINCIPAL	SFIL	2010-11-08	2 250 000,00 €	637 500,00 €	15.00	4.00	Taux fixe à 3.14 %	1A
26	370	BUDGET PRINCIPAL	CAISSE DES DEPOTS ET CONSIGNATIONS	2009-12-28	1 183 184,29 €	795 255,09 €	22.00	10.08	Livret A + 0.6	1A
27	377	BUDGET PRINCIPAL	SFIL	2017-12-07	15 000 000,00 €	12 750 000,00 €	20.00	16.08	Euribor 12 M + 0.17	1A
28	379	BUDGET PRINCIPAL	CREDIT AGRICOLE CIB	2018-08-30	15 750 004,00 €	10 631 252,70 €	10.00	6.74	Taux fixe à 0.9 %	1A
29	383-2	BUDGET PRINCIPAL	AFL	2018-12-05	5 000 000,00 €	4 000 000,04 €	15.00	11.97	Euribor 03 M + 0.32	1A
30	384	BUDGET PRINCIPAL	CREDIT MUTUEL	2018-12-10	10 000 000,00 €	8 588 569,38 €	19.00	15.85	Taux fixe à 1.37 %	1A
31	388	BUDGET PRINCIPAL	BANQUE POSTALE	2020-11-19	10 000 000,00 €	9 639 603,70 €	20.00	19.00	Taux fixe à 0.41 %	1A
32	396	BUDGET PRINCIPAL	CREDIT FONCIER	2021-11-22	20 000 000,00 €	20 000 000,00 €	20.00	19.96	Taux fixe à 0.65 %	1A
33	Eau-134	BUDGET EAU	CREDIT FONCIER	2005-12-14	5 000 000,00 €	1 250 000,00 €	20.00	4.83	Euribor 12 M + 0.0325	1A
34	Eau-139	BUDGET EAU	CREDIT AGRICOLE CIB	2008-09-01	12 000 000,00 €	7 200 000,00 €	30.00	18.00	Taux fixe à 1.725 %	1A
35	Eau-140	BUDGET EAU	CREDIT AGRICOLE CIB	2010-01-07	8 000 000,00 €	3 600 000,00 €	20.00	9.00	Euribor 03 M + 0.35	1A
36	Eau-142	BUDGET EAU	SFIL	2011-11-14	3 000 000,00 €	75 000,00 €	10.00	0.00	Taux fixe à 4.43 %	1A
37	Eau-151	BUDGET EAU	AGENCE EAU LOIRE BRETAGNE	2016-12-22	2 211 762,60 €	2 015 161,48 €	16.00	11.50	Taux fixe à 0 %	1A
38	LIC-43	BUDGET LOCAUX INDUSTRIELS ET COMMERCIAUX	SFIL	2007-12-11	1 027 000,00 €	459 409,79 €	20.00	6.50	Taux fixe à 4.25 %	1A
39	Transport-3	BUDGET TRANSPORT	BANQUE EUROPEENNE D’INVESTISSEMENT	2005-05-23	20 000 000,00 €	4 000 000,00 €	20.00	3.96	Euribor 03 M + 0.13	1A
40	Transport-5	BUDGET TRANSPORT	BANQUE EUROPEENNE D’INVESTISSEMENT	2005-05-23	30 000 000,00 €	9 000 000,00 €	20.00	5.49	Euribor 03 M-0.013	1A
41	Transport-9	BUDGET TRANSPORT	CAISSE DES DEPOTS ET CONSIGNATIONS	2013-08-12	23 450 000,00 €	17 353 000,00 €	26.00	18.17	Livret A + 1	1A
42	Transport-13	BUDGET TRANSPORT	AFL	2019-11-29	20 000 000,00 €	18 000 000,00 €	20.00	17.97	Taux fixe à 0.68 %	1A
43	Transport-100	BUDGET TRANSPORT	ETAT	2021-01-15	38 593 575,00 €	38 593 575,00 €	10.00	9.00	Taux fixe à 0 %	1A
44	280-Obligataire	BUDGET PRINCIPAL	CACEIS	2004-12-22	20 000 000,00 €	3 000 000,00 €	20.00	2.97	Euribor 12 M + 0.03	1A
45	285-Obligataire	BUDGET PRINCIPAL	BNP FORTIS	2005-12-22	10 000 000,00 €	2 000 000,00 €	20.00	3.96	Euribor 12 M + 0.03	1A
46	302	BUDGET PRINCIPAL	SFIL	2007-07-10	5 000 000,00 €	2 286 560,01 €	20.00	6.00	Taux fixe à 4.69 %	1A
47	337	BUDGET PRINCIPAL	SOCIETE GENERALE	2009-12-22	10 000 000,00 €	4 000 000,00 €	20.00	7.99	Euribor 03 M + 0.37	1A
48	347	BUDGET PRINCIPAL	CREDIT FONCIER	2005-12-14	7 500 000,00 €	2 500 000,00 €	15.00	4.84	Euribor 12 M + 0.0325	1A
49	348	BUDGET PRINCIPAL	CAISSE DES DEPOTS ET CONSIGNATIONS	2011-12-09	12 000 000,00 €	1 441 479,95 €	10.00	0.00	Taux fixe à 4.33 %	1A
50	350	BUDGET PRINCIPAL	ARKEA	2013-05-15	20 000 000,00 €	9 333 333,36 €	15.00	6.41	Taux fixe à 3.83 %	1A
51	354	BUDGET PRINCIPAL	BANQUE POSTALE	2013-11-19	10 000 000,00 €	4 833 333,23 €	15.00	7.00	Taux fixe à 3.36 %	1A
52	367	BUDGET PRINCIPAL	SFIL	2016-11-04	10 000 000,00 €	6 833 333,27 €	15.00	10.08	Taux fixe à 0.73 %	1A
53	368	BUDGET PRINCIPAL	SFIL	2016-11-04	10 000 000,00 €	6 833 333,27 €	15.00	10.08	Taux fixe à 0.35 %	1A
54	371	BUDGET PRINCIPAL	CAISSE DES DEPOTS ET CONSIGNATIONS	2017-06-30	60 000 000,00 €	56 000 000,00 €	30.00	27.50	Livret A + 0.6	1A
55	386	BUDGET PRINCIPAL	CREDIT FONCIER	2020-09-16	30 000 000,00 €	28 125 000,00 €	20.00	18.73	Euribor 03 M + 0.68 %	1A
56	Transport-1	BUDGET TRANSPORT	CAISSE DES DEPOTS ET CONSIGNATIONS	2000-04-14	19 056 127,15 €	4 372 726,03 €	24.00	3.42	Taux fixe à 3.6 %	1A
57	Transport-8	BUDGET TRANSPORT	CAISSE DES DEPOTS ET CONSIGNATIONS	2010-08-19	28 900 000,00 €	20 230 000,00 €	25.00	17.25	Livret A + 1	1A
58	314	BUDGET PRINCIPAL	SFIL	2007-12-11	32 056 000,00 €	14 339 668,60 €	20.00	6.50	Taux fixe à 4.25 %	1A
59	355	BUDGET PRINCIPAL	CREDIT FONCIER	2014-07-24	5 000 000,00 €	2 583 333,43 €	15.00	7.58	Taux fixe à 2.63 %	1A
60	363	BUDGET PRINCIPAL	COMMUNE DE NANTES	2015-12-15	3 360 639,00 €	1 126 825,00 €	14.00	8.00	Taux fixe à 3.7 %	1A
61	364	BUDGET PRINCIPAL	CAISSE DES DEPOTS ET CONSIGNATIONS	2016-06-10	5 000 000,00 €	3 333 333,35 €	15.00	9.50	Taux fixe à 0 %	1A
62	374	BUDGET PRINCIPAL	AFL	2017-06-08	20 000 000,00 €	14 000 000,06 €	15.00	10.47	Taux fixe à 1.25 %	1A
63	378	BUDGET PRINCIPAL	CAISSE D’EPARGNE	2017-12-14	15 000 000,00 €	12 187 500,00 €	20.00	16.23	Taux fixe à 1.35 %	1A
64	assain-435	BUDGET ASSAINISSEMENT	SFIL	2007-12-11	6 266 000,00 €	2 802 981,23 €	20.00	6.50	Taux fixe à 4.25 %	1A
65	assain-442	BUDGET ASSAINISSEMENT	CAISSE D’EPARGNE	2012-11-05	3 000 000,00 €	375 000,00 €	10.00	1.07	Taux fixe à 3.65 %	1A
66	Eau-131	BUDGET EAU	CREDIT AGRICOLE	2003-06-13	5 000 000,00 €	589 005,44 €	20.00	1.44	Taux fixe à 0.05%	1A
67	Eau-136	BUDGET EAU	SFIL	2007-12-10	9 600 000,00 €	3 974 178,54 €	21.00	7.08	Taux fixe à 2.93 %	1A
68	Transport-4	BUDGET TRANSPORT	BANQUE EUROPEENNE D’INVESTISSEMENT	2005-05-23	20 000 000,00 €	6 000 000,00 €	20.00	5.24	Taux fixe à 4.221 %	1A
69	Transport-7	BUDGET TRANSPORT	CAISSE DES DEPOTS ET CONSIGNATIONS	2009-03-03	21 500 000,00 €	12 362 500,00 €	20.00	11.25	Euribor 03 M + 0.05	1A
70	289	BUDGET PRINCIPAL	CREDIT FONCIER	2004-12-22	19 140 980,00 €	4 306 720,50 €	20.00	4.42	TAG 03 M + 0.075	1A
71	293	BUDGET PRINCIPAL	CREDIT AGRICOLE CIB	2006-04-21	6 000 000,00 €	2 031 600,00 €	20.00	4.96	TAG 03 M + 0.05	1A
72	308	BUDGET PRINCIPAL	CREDIT FONCIER	2007-12-21	25 000 000,00 €	9 912 933,74 €	20.00	6.00	Taux fixe à 4.61 %	1A
73	316-Obligataire	BUDGET PRINCIPAL	BNP FORTIS	2007-12-18	10 400 000,00 €	3 640 000,00 €	20.00	6.97	Euribor 12 M + 1	1A
74	329	BUDGET PRINCIPAL	BNP PARIBAS	2009-07-06	5 000 000,00 €	1 000 000,04 €	15.00	2.58	Taux fixe à 4.333 %	1A
75	338	BUDGET PRINCIPAL	CREDIT FONCIER	2004-12-22	7 500 000,00 €	2 000 000,00 €	15.00	3.92	TAG 03 M + 0.075	1A
76	343	BUDGET PRINCIPAL	CREDIT COOPERATIF	2010-12-07	5 000 000,00 €	1 333 333,37 €	15.00	3.87	Taux fixe à 3.08 %	1A
77	365	BUDGET PRINCIPAL	CAISSE DES DEPOTS ET CONSIGNATIONS	2016-06-10	6 833 731,00 €	4 673 698,57 €	15.00	9.75	Taux fixe à 1.05 %	1A
78	385	BUDGET PRINCIPAL	SAAR LB	2020-01-13	20 000 000,00 €	18 500 000,00 €	20.00	18.04	Euribor 06 M + 0.68 %	1A
79	Eau-132	BUDGET EAU	FMS	2003-12-01	5 000 000,00 €	500 000,00 €	20.00	1.99	Euribor 12 M + 0.05	1A
80	Eau-147	BUDGET EAU	AGENCE EAU LOIRE BRETAGNE	2013-01-28	10 335 000,00 €	6 315 833,32 €	18.00	10.67	Taux fixe à 0 %	1A
81	Transport-6	BUDGET TRANSPORT	CAISSE DES DEPOTS ET CONSIGNATIONS	2007-12-11	50 000 000,00 €	23 769 426,82 €	20.00	7.00	Euribor 12 M	1A
82	Transport-10	BUDGET TRANSPORT	CAISSE DES DEPOTS ET CONSIGNATIONS	2017-05-16	8 944 772,00 €	7 015 615,53 €	15.00	11.42	Taux fixe à 1.35 %	1A
83	Transport-11	BUDGET TRANSPORT	CAISSE DES DEPOTS ET CONSIGNATIONS	2017-05-16	3 950 000,00 €	3 098 086,94 €	15.00	11.42	Taux fixe à 1.35 %	1A
84	290	BUDGET PRINCIPAL	SOCIETE GENERALE	2006-01-25	20 000 000,00 €	5 000 000,00 €	20.00	4.00	Taux fixe à 4.097 %	1A
85	317	BUDGET PRINCIPAL	SFIL	2007-12-11	14 688 000,00 €	6 080 492,47 €	20.00	7.08	Taux fixe à 2.93 %	1A
86	318	BUDGET PRINCIPAL	CREDIT AGRICOLE	2003-06-06	5 000 000,00 €	589 005,44 €	20.00	1.44	Taux fixe à 0.05%	1A
87	326	BUDGET PRINCIPAL	SFIL	2001-05-29	10 337 308,68 €	2 412 179,41 €	15.00	2.29	Euribor 03 M + 0.3	1A
88	357	BUDGET PRINCIPAL	PBB	2014-07-09	10 000 000,00 €	5 333 333,31 €	15.00	7.58	Euribor 12 M + 1	1A
89	376-2	BUDGET PRINCIPAL	CREDIT AGRICOLE CIB	2017-12-14	15 000 000,00 €	12 187 500,00 €	20.00	16.04	Taux fixe à 0.88 %	1A
90	380	BUDGET PRINCIPAL	SOCIETE GENERALE	2018-08-14	5 737 500,00 €	4 275 000,00 €	13.00	9.25	Taux fixe à 4.89 %	1A
91	383	BUDGET PRINCIPAL	AFL	2018-12-05	25 000 000,00 €	19 999 999,96 €	15.00	11.97	Taux fixe à 1.12 %	1A
92	390	BUDGET PRINCIPAL	ARKEA	2020-12-14	10 000 000,00 €	10 000 000,00 €	20.00	19.08	Taux fixe à 0.45 %	1A
93	393	BUDGET PRINCIPAL	SFIL	2021-06-22	10 000 000,00 €	10 000 000,00 €	20.00	19.58	Taux fixe à 0.75 %	1A
94	394	BUDGET PRINCIPAL	SFIL	2021-06-22	10 000 000,00 €	9 875 000,00 €	20.00	19.58	Taux fixe à 0.74 %	1A
95	395	BUDGET PRINCIPAL	CREDIT COOPERATIF	2021-06-22	15 000 000,00 €	14 812 500,00 €	20.00	19.60	Taux fixe à 0.70 %	1A
96	397	BUDGET PRINCIPAL	CREDIT FONCIER	2021-11-22	20 000 000,00 €	10 000 000,00 €	20.00	20.00	Euribor 06 M + 0.42 %	1A
97	assain-433	BUDGET ASSAINISSEMENT	BANQUE EUROPEENNE D’INVESTISSEMENT	2005-05-23	20 000 000,00 €	4 000 000,04 €	15.00	2.13	Taux fixe à 1.758 %	1A
98	Eau-144	BUDGET EAU	SOCIETE GENERALE	2011-11-14	1 500 000,00 €	500 000,00 €	15.00	4.96	Taux fixe à 4.39 %	1A
99	Eau-148-2	BUDGET EAU	CAISSE DES DEPOTS ET CONSIGNATIONS	2014-02-18	11 500 000,00 €	0,00 €	25.00	25.13	Livret A + 0.75	1A
100	Stat-001	BUDGET STATIONNEMENT	CAISSE DES DEPOTS ET CONSIGNATIONS	2005-08-17	5 378 343,15 €	1 063 998,12 €	19.00	2.92	Taux fixe à 3.55 %	1A
101	Stat-002	BUDGET STATIONNEMENT	CAISSE D’EPARGNE	2009-12-22	6 000 000,00 €	2 475 000,00 €	20.00	8.07	Euribor 03 M + 0.35	1A
102	Transport-2	BUDGET TRANSPORT	CAISSE DES DEPOTS ET CONSIGNATIONS	2004-12-17	20 000 000,00 €	5 279 462,89 €	20.00	3.00	Taux fixe à 3.82 %	1A
103	Transport-15	BUDGET TRANSPORT	SFIL	2020-09-14	10 000 000,00 €	9 500 000,00 €	20.00	18.75	Taux fixe à 0.58 %	1A
104	Transport-18	BUDGET TRANSPORT	CEB	2020-12-04	35 000 000,00 €	35 000 000,00 €	25.00	24.49	Taux fixe à 0.53 %	1A
105	295-Obligataire	BUDGET PRINCIPAL	BNP FORTIS	2006-10-03	10 000 000,00 €	2 500 000,00 €	20.00	4.96	Euribor 12 M + 0.0295	1A
106	303	BUDGET PRINCIPAL	SFIL	2007-07-10	5 000 000,00 €	2 286 560,01 €	20.00	6.08	Taux fixe à 4.69 %	1A
107	322	BUDGET PRINCIPAL	CAISSE DES DEPOTS ET CONSIGNATIONS	2008-12-31	55 000 000,00 €	10 840 270,99 €	15.00	2.67	Euribor 03 M + 0.38	1A
108	345	BUDGET PRINCIPAL	CREDIT COOPERATIF	2010-11-15	5 000 000,00 €	2 562 500,00 €	20.00	10.00	Euribor 03 M + 0.4	1A
109	351	BUDGET PRINCIPAL	CAISSE D’EPARGNE	2013-05-06	10 000 000,00 €	5 875 000,00 €	20.00	11.53	Taux fixe à 4.14 %	1A
110	359	BUDGET PRINCIPAL	SFIL	2015-03-30	15 000 000,00 €	8 500 000,00 €	15.00	8.33	Taux fixe à 1.33 %	1A
111	375	BUDGET PRINCIPAL	CAISSE DES DEPOTS ET CONSIGNATIONS	2017-11-13	3 000 000,00 €	2 200 000,00 €	15.00	10.92	Taux fixe à 0 %	1A
112	391	BUDGET PRINCIPAL	CAISSE D’EPARGNE	2020-12-01	10 000 000,00 €	9 625 000,00 €	20.00	19.05	Euribor 03 M + 0.61 %	1A
113	392	BUDGET PRINCIPAL	SFIL	2021-06-22	10 000 000,00 €	10 000 000,00 €	20.00	19.58	Taux fixe à 0.75 %	1A
114	assain-418	BUDGET ASSAINISSEMENT	AGENCE EAU LOIRE BRETAGNE	2004-09-10	2 126 280,00 €	99 226,40 €	19.00	1.83	Taux fixe à 0 %	1A
115	Eau-146	BUDGET EAU	CAISSE D’EPARGNE	2013-05-06	5 000 000,00 €	2 937 500,00 €	20.00	11.53	Taux fixe à 4.14 %	1A
116	Eau-148-1	BUDGET EAU	CAISSE DES DEPOTS ET CONSIGNATIONS	2014-02-18	20 000 000,00 €	16 800 000,00 €	27.00	20.50	Livret A + 0.75	1A
117	Eau-150	BUDGET EAU	AGENCE EAU LOIRE BRETAGNE	2016-12-22	1 080 000,00 €	899 518,77 €	16.00	11.50	Taux fixe à 0 %	1A
118	Transport-16	BUDGET TRANSPORT	SFIL	2020-09-14	10 000 000,00 €	9 527 050,02 €	20.00	18.75	Taux fixe à 0.58 %	1A
119	284R	BUDGET PRINCIPAL	SFIL	2018-03-06	23 532 000,00 €	11 766 000,00 €	7.00	3.58	Taux fixe à 0.55 %	1A
120	307-Obligataire	BUDGET PRINCIPAL	BNP FORTIS	2007-12-18	10 000 000,00 €	3 000 000,00 €	20.00	5.98	Euribor 12 M + 0.05	1A
121	344	BUDGET PRINCIPAL	AFL	2010-11-22	10 000 000,00 €	5 000 000,00 €	20.00	9.92	Taux fixe à 3.45 %	1A
122	349	BUDGET PRINCIPAL	CAISSE D’EPARGNE	2012-06-14	10 000 000,00 €	500 000,00 €	10.00	0.48	Taux fixe à 4.46 %	1A
123	353	BUDGET PRINCIPAL	SFIL	2013-05-27	5 000 000,00 €	2 250 000,11 €	15.00	6.50	Taux fixe à 3.34 %	1A
124	358	BUDGET PRINCIPAL	AFL	2015-04-08	20 000 000,00 €	11 000 000,09 €	15.00	8.22	Taux fixe à 1.42 %	1A
125	360	BUDGET PRINCIPAL	CREDIT AGRICOLE CIB	2015-08-27	12 800 000,00 €	8 533 333,35 €	15.00	9.17	Taux fixe à 0.75 %	1A
126	376-1	BUDGET PRINCIPAL	CREDIT AGRICOLE CIB	2017-12-14	15 000 000,00 €	12 000 000,00 €	20.00	15.97	Taux fixe à 0.88 %	1A
127	assain-432	BUDGET ASSAINISSEMENT	BANQUE EUROPEENNE D’INVESTISSEMENT	2005-05-23	20 000 000,00 €	2 666 666,71 €	15.00	1.87	Taux fixe à 2.05 %	1A
128	assain-443	BUDGET ASSAINISSEMENT	AGENCE EAU LOIRE BRETAGNE	2015-03-10	3 363 500,00 €	2 481 017,25 €	19.00	13.00	Taux fixe à 0 %	1A
129	assain-444	BUDGET ASSAINISSEMENT	AGENCE EAU LOIRE BRETAGNE	2015-09-10	102 641,00 €	74 631,42 €	18.00	12.00	Taux fixe à 0 %	1A
130	Eau-137	BUDGET EAU	SFIL	2007-12-10	10 651 000,00 €	4 764 531,17 €	20.00	6.50	Taux fixe à 4.25 %	1A
131	Eau-145	BUDGET EAU	CAISSE D’EPARGNE	2012-11-05	2 000 000,00 €	250 000,00 €	10.00	1.07	Taux fixe à 3.65 %	1A
132	Stat-003	BUDGET STATIONNEMENT	CREDIT FONCIER	2020-11-25	10 000 000,00 €	9 600 000,00 €	25.00	23.93	Taux fixe à 0.50 %	1A
133	Transport-14	BUDGET TRANSPORT	SFIL	2019-11-29	10 000 000,00 €	9 125 000,00 €	20.00	18.00	Taux fixe à 0.72 %	1A
134	Transport-17	BUDGET TRANSPORT	CAISSE DES DEPOTS ET CONSIGNATIONS	2020-11-24	10 358 793,00 €	9 990 498,26 €	20.00	19.17	Taux fixe à 0.55 %	1A
\.


--
-- Data for Name: sac; Type: TABLE DATA; Schema: public; Owner: olivier
--

COPY public.sac (id, categorie, materiel, type, dans_sac, poids_en_g, present, commentaire, pese, emplacement) FROM stdin;
1	0 - Vêtements	Chaussures rando	\N	Non	690	Oui	\N	\N	Hors sac
2	0 - Vêtements	Polaire	\N	Oui	318	Oui	Au lieu de 380	Oui	Poche 2
3	0 - Vêtements	Sandales	\N	Oui	300	Non	A acheter plus tard	\N	Grande poche
4	0 - Vêtements	Bermuda	\N	Non	233	Oui	\N	Oui	Poche 2
5	0 - Vêtements	Pantalon	\N	Oui	213	Oui	\N	Oui	Poche 2
6	0 - Vêtements	Merinos manches longues	Odlo vert	Oui	212	Oui	\N	Oui	Poche 2
7	0 - Vêtements	coupe-vent	Light Kiprun	Oui	194	Oui	Avec sac	Oui	Poche externe gauche
8	0 - Vêtements	T shirt merinos	\N	Oui	123	Oui	Rouge Vaude	Oui	Poche 2
9	0 - Vêtements	merinos manches courtes	\N	Non	100	Oui	Vaude bleu	Oui	Poche 2
10	0 - Vêtements	Slip	\N	Non	72	Oui	Bleu Schott	Oui	Poche 2
11	0 - Vêtements	Chaussettes	\N	Non	60	Oui	Techniques	Oui	Poche 2
12	0 - Vêtements	Chaussettes	\N	Oui	60	Oui	Techniques	Oui	Poche 2
13	0 - Vêtements	Slip	\N	Oui	56	Oui	Rouge	Oui	Poche 2
14	0 - Vêtements	Chaussettes basses	\N	Oui	43	Oui	2 paires	Oui	Poche 2
15	0 - Vêtements	Poche étanche Vetements	CIMALP	Oui	42	Oui	\N	Oui	Poche 2
16	0 - Vêtements	Tour de cou	\N	Non	31	Oui	Vivons vélo	Oui	Poche 2
17	0 - Vêtements	Tour de cou	\N	Oui	30	Oui	\N	Oui	Poche 2
18	0 - Vêtements	Pantalon nuit	\N	Oui	0	Non	\N	\N	Poche 2
19	1 - Accessoires	Etui a lunettes	\N	Oui	32	Oui	\N	Oui	Poche haute
20	1 - Accessoires	Lunettes de secours	\N	Oui	30	Oui	\N	Oui	Poche haute
21	1 - Accessoires	Lunettes de soleil	\N	Oui	8	Oui	\N	Oui	Poche haute
22	1 - Accessoires	Petit ziplock Lunettes	\N	Oui	8	Oui	\N	Oui	Poche haute
23	2a - Matériel	Poche aérée Matériel	\N	Oui	56	Oui	\N	Oui	Poche 1
24	2a - Toilette	Serviette microfibre	PACKTOWL ULTRALITE BODY XL	Oui	184	Oui	\N	Oui	Poche 3
25	2a - Toilette	Crème solaire	\N	Oui	80	Non	\N	\N	Poche 1
26	2a - Toilette	Dentifrice	\N	Oui	78	A améliorer	\N	Oui	Poche 1
27	2a - Toilette	Savon de marseille	\N	Oui	40	Oui	2 savons bio	Oui	Poche 1
28	2a - Toilette	Peigne	\N	Oui	16	Oui	\N	Oui	Poche 1
29	2a - Toilette	Boite savon	\N	Oui	15	Oui	petit zip	Oui	Poche 1
30	2a - Toilette	Epingles nourrice + boules quies	\N	Oui	15	Oui	\N	Oui	Poche 1
31	2a - Toilette	Papier toilette	\N	Oui	11	Oui	20 feulles	Oui	Poche 1
32	2a - Toilette	Brosse a dents	\N	Oui	8	Oui	\N	Oui	Poche 1
33	2a - Toilette	Petit ziplock Toilette	\N	Oui	7	Oui	\N	Oui	Poche 1
34	2a - Toilette	Brossettes dents	\N	Oui	4	Oui	2 brossettes	Oui	Poche 1
35	2b - Secours	Mini pharmacie	\N	Oui	177	Oui	\N	Oui	Poche 1
36	2b - Secours	Couverture de survie	\N	Oui	107	Oui	\N	Oui	Poche 1
37	3a - Electronique	Liseuse	\N	Oui	209	Oui	Sans la protection	Oui	Poche haute
38	3a - Electronique	Oreillettes	Bose avec sac	Oui	21	Oui	\N	Oui	Poche haute
39	3a - Electronique	Grand ziplock liseuse	\N	Oui	12	Oui	\N	Oui	Poche haute
40	3b - Energie	Batterie	Essentiel B 10 000	Oui	180	Oui	\N	Oui	Poche 1
41	3b - Energie	Rasoir	\N	Oui	108	Oui	Rasoir seul 106g	Oui	Poche 1
42	3b - Energie	Multiprise	3 prises	Oui	51	Oui	\N	Oui	Poche 1
43	3b - Energie	Chargeur Rasoir	\N	Oui	43	Oui	Rasoir seul 106g	Oui	Poche 1
44	3b - Energie	Chargeur	Fast	Oui	40	Oui	\N	Oui	Poche 1
45	3b - Energie	Cable chargeur	A vers micro usb	Oui	23	Oui	Cable 1m	Oui	Poche 1
46	3b - Energie	Cable chargeur	C vers C	Oui	22	Oui	\N	Oui	Poche 1
47	3b - Energie	Cable chargeur	A vers C	Oui	17	Oui	\N	Oui	Poche 1
48	3b - Energie	Cable chargeur	A vers montre fenix	Oui	14	Oui	\N	Oui	Poche 1
49	3b - Energie	Grand Ziplock energie	\N	Oui	12	Oui	\N	Oui	Poche 1
50	3c - Electronique	Téléphone	\N	Non	230	Oui	\N	Oui	Hors sac
51	3c - Electronique	Frontale	Petzl	Oui	84	Oui	\N	Oui	Poche haute
52	4a - Matériel	Sac à dos	Osprey levity 45	Oui	860	Oui	\N	Oui	N.A
53	4a - Matériel	Batons de marche	\N	Non	550	Oui	\N	Oui	Hors sac
54	4a - Matériel	Cape pluie (poncho)	\N	Oui	347	A améliorer	Avec sac	Oui	Poche externe gauche
55	4a - Matériel	Perche à selfie	\N	Oui	168	Oui	\N	Oui	Poche haute
56	4a - Matériel	Poche a eau	\N	Oui	150	Oui	\N	Oui	Poche interne eau
57	4a - Matériel	Protège sac	\N	Oui	131	Oui	\N	Oui	Poche externe gauche
58	4a - Matériel	Cordelette	\N	Oui	27	Oui	\N	Oui	Poche 3
59	4b - Camping	Tente	LanShan 2	Oui	1299	Oui	Avec tapis de sol et piquets	Oui	Grande poche
60	4b - Camping	Sac couchage 10°	Cumulus LiteLine 300	Oui	631	Oui	Avec sac compression	Oui	Grande poche
61	4b - Camping	Matelas gonflable	Therm-a-Rest NeoAir XLite RW	Oui	525	Oui	Avec sac et sac pompe	Oui	Grande poche
62	4b - Camping	Liner (sac soie)	\N	Oui	116	Oui	Avec sac	Oui	Grande poche
63	4b - Camping	Matelas sol mousse	\N	Oui	116	Oui	\N	Oui	Poche externe droite
64	4b - Camping	Sac poubelle	\N	Oui	43	Oui	5 sacs 20l	\N	Poche 3
65	4b - Camping	Kit réparation matelas	\N	Oui	12	Oui	\N	Oui	Poche 1
66	4c - Cuisine	Gaz	\N	Oui	178	Oui	\N	Oui	Poche 3
67	4c - Cuisine	popote	\N	Oui	125	Oui	avec sac	Oui	Poche 3
68	4c - Cuisine	Poche aérée Cuisine	Décathlon	Oui	56	Oui	\N	Oui	Poche 3
69	4c - Cuisine	Petite microfibre	\N	Oui	48	Oui	\N	Oui	Poche 3
70	4c - Cuisine	Couteau	\N	Oui	45	Oui	\N	Oui	Poche 3
71	4c - Cuisine	Bruleur	\N	Oui	29	Oui	\N	Oui	Poche 3
72	4c - Cuisine	Briquet	\N	Oui	12	Oui	\N	Oui	Poche 3
73	4c - Cuisine	Fourchette/cuiller	\N	Oui	11	Oui	\N	Oui	Poche 3
74	4d - Papiers	Carnet	\N	Oui	94	Oui	\N	Oui	Poche haute
75	4d - Papiers	Permis/vitale/CB+credent	\N	Oui	43	Oui	\N	Oui	Poche haute
76	4d - Papiers	Stylo/Crayon papier	\N	Oui	35	Oui	porte mines + bic + gomme	Oui	Poche haute
77	4d - Papiers	Petit ziplock Papiers	\N	Oui	6	Oui	\N	Oui	Poche haute
78	8 - Nourriture	Spaghettis carbonara	\N	Oui	184	Oui	\N	Oui	Poche 4
79	8 - Nourriture	Emincé de boeuf	\N	Oui	154	Oui	\N	Oui	Poche 4
80	8 - Nourriture	Aligot Aveyronais	\N	Oui	143	Oui	\N	Oui	Poche 4
81	8 - Nourriture	Muesli aux raisins	\N	Oui	88	Oui	\N	Oui	Poche 4
82	8 - Nourriture	Muesli aux raisins	\N	Oui	85	Oui	\N	Oui	Poche 4
83	8 - Nourriture	Lait en poudre	15 dosettes	Non	74	Oui	\N	Oui	Poche 4
84	8 - Nourriture	Poche étanche Nourriture	Décathlon	Non	47	Oui	\N	Oui	Poche 4
85	8 - Nourriture	Café Lyophilisé	10 dosettes	Oui	23	Oui	\N	Oui	Poche 4
86	Sac	Petit ziplock Secours	\N	Oui	8	Oui	\N	Oui	Poche 3
\.


--
-- Name: emprunts_nantes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivier
--

SELECT pg_catalog.setval('public.emprunts_nantes_id_seq', 134, true);


--
-- Name: sac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: olivier
--

SELECT pg_catalog.setval('public.sac_id_seq', 86, true);


--
-- Name: sac sac_pkey; Type: CONSTRAINT; Schema: public; Owner: olivier
--

ALTER TABLE ONLY public.sac
    ADD CONSTRAINT sac_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

