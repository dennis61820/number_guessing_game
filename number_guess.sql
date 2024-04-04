--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    game_date date DEFAULT CURRENT_DATE NOT NULL,
    num_guesses integer DEFAULT 0 NOT NULL,
    player_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (42, '2024-04-04', 48, 29);
INSERT INTO public.games VALUES (43, '2024-04-04', 48, 29);
INSERT INTO public.games VALUES (47, '2024-04-04', 10, 25);
INSERT INTO public.games VALUES (32, '2024-04-04', 10, 25);
INSERT INTO public.games VALUES (35, '2024-04-04', 371, 27);
INSERT INTO public.games VALUES (36, '2024-04-04', 371, 27);
INSERT INTO public.games VALUES (41, '2024-04-04', 1695, 28);
INSERT INTO public.games VALUES (40, '2024-04-04', 1695, 28);
INSERT INTO public.games VALUES (44, '2024-04-04', 1695, 28);
INSERT INTO public.games VALUES (45, '2024-04-04', 1695, 28);
INSERT INTO public.games VALUES (46, '2024-04-04', 1695, 28);
INSERT INTO public.games VALUES (51, '2024-04-04', 964, 31);
INSERT INTO public.games VALUES (50, '2024-04-04', 964, 31);
INSERT INTO public.games VALUES (52, '2024-04-04', 1941, 30);
INSERT INTO public.games VALUES (49, '2024-04-04', 1941, 30);
INSERT INTO public.games VALUES (48, '2024-04-04', 1941, 30);
INSERT INTO public.games VALUES (53, '2024-04-04', 1941, 30);
INSERT INTO public.games VALUES (54, '2024-04-04', 1941, 30);
INSERT INTO public.games VALUES (39, '2024-04-04', 354, 26);
INSERT INTO public.games VALUES (38, '2024-04-04', 354, 26);
INSERT INTO public.games VALUES (33, '2024-04-04', 354, 26);
INSERT INTO public.games VALUES (34, '2024-04-04', 354, 26);
INSERT INTO public.games VALUES (37, '2024-04-04', 354, 26);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (25, 'bob');
INSERT INTO public.players VALUES (26, 'user_1712259544093');
INSERT INTO public.players VALUES (27, 'user_1712259544092');
INSERT INTO public.players VALUES (28, 'user_1712259661881');
INSERT INTO public.players VALUES (29, 'user_1712259661880');
INSERT INTO public.players VALUES (30, 'user_1712259802480');
INSERT INTO public.players VALUES (31, 'user_1712259802479');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 54, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 31, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_name_key UNIQUE (name);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

