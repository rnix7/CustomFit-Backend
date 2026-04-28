--
-- PostgreSQL database dump
--

\restrict iyazYiNvISW2X5itLXwZNgMi6t9BrMqi0f2fADpLscJMOztoxbwOao8g6Fr5PRL

-- Dumped from database version 17.9 (Ubuntu 17.9-0ubuntu0.25.10.1)
-- Dumped by pg_dump version 17.9 (Ubuntu 17.9-0ubuntu0.25.10.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: customizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customizations (
    id bigint NOT NULL,
    user_id bigint,
    template_id integer,
    couleur_hex character varying(255),
    motif_url character varying(255),
    texte_perso text,
    date_creation timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    type_vetement character varying(255)
);


ALTER TABLE public.customizations OWNER TO postgres;

--
-- Name: customizations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customizations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customizations_id_seq OWNER TO postgres;

--
-- Name: customizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customizations_id_seq OWNED BY public.customizations.id;


--
-- Name: garment_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.garment_templates (
    id integer NOT NULL,
    nom character varying(50) NOT NULL,
    prix_base numeric(10,2) NOT NULL,
    image_modele_url text
);


ALTER TABLE public.garment_templates OWNER TO postgres;

--
-- Name: garment_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.garment_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.garment_templates_id_seq OWNER TO postgres;

--
-- Name: garment_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.garment_templates_id_seq OWNED BY public.garment_templates.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id integer,
    customization_id bigint,
    statut character varying(255) DEFAULT 'EN_ATTENTE'::character varying,
    prix_total double precision,
    date_commande timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    delai_estime timestamp(6) without time zone,
    client_id bigint
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    order_id integer,
    montant numeric(10,2) NOT NULL,
    methode_paiement character varying(50),
    statut_paiement character varying(20),
    transaction_ref character varying(100)
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    mot_de_passe character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'CLIENT'::character varying,
    date_inscription timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    adresse character varying(255),
    telephone character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: customizations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customizations ALTER COLUMN id SET DEFAULT nextval('public.customizations_id_seq'::regclass);


--
-- Name: garment_templates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garment_templates ALTER COLUMN id SET DEFAULT nextval('public.garment_templates_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: customizations customizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customizations
    ADD CONSTRAINT customizations_pkey PRIMARY KEY (id);


--
-- Name: garment_templates garment_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garment_templates
    ADD CONSTRAINT garment_templates_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: payments payments_transaction_ref_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_transaction_ref_key UNIQUE (transaction_ref);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: customizations customizations_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customizations
    ADD CONSTRAINT customizations_template_id_fkey FOREIGN KEY (template_id) REFERENCES public.garment_templates(id);


--
-- Name: customizations customizations_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customizations
    ADD CONSTRAINT customizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: orders fkojjigrbyd7qrcwrxvr7e9bdr2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fkojjigrbyd7qrcwrxvr7e9bdr2 FOREIGN KEY (client_id) REFERENCES public.users(id);


--
-- Name: orders orders_customization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customization_id_fkey FOREIGN KEY (customization_id) REFERENCES public.customizations(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- PostgreSQL database dump complete
--

\unrestrict iyazYiNvISW2X5itLXwZNgMi6t9BrMqi0f2fADpLscJMOztoxbwOao8g6Fr5PRL

