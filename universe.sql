--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(50) NOT NULL,
    years_of_experience integer,
    is_active boolean,
    research_area text
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_billion_years real NOT NULL,
    description text,
    distance_from_earth_ly real NOT NULL,
    has_black_hole boolean NOT NULL,
    num_stars integer,
    num_planets integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km real NOT NULL,
    distance_from_planet_km real
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    orbital_period numeric,
    order_to_sun integer NOT NULL,
    has_atmosphere boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type text NOT NULL,
    temperature_kelvin real
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Alice', 5, true, 'astrophysics');
INSERT INTO public.astronomer VALUES (2, 'Qun Li', 4, true, 'cosmology');
INSERT INTO public.astronomer VALUES (3, 'Oliver', 2, true, '');
INSERT INTO public.astronomer VALUES (4, 'Luna', 1, true, 'astrogeology');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.6, 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxys appearance from Earth', 0, true, NULL, 1);
INSERT INTO public.galaxy VALUES (2, 'LMC', 15000, NULL, 163000, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 10, NULL, 2.495096e+06, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 82', 0.1, NULL, 1.14e+07, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 21, NULL, 2.09e+07, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 13, NULL, 3.1e+07, true, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3475, 383500);
INSERT INTO public.moon VALUES (2, 'Europa', 5, 3121.6, 671000);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5, 5268.2, 1.07e+06);
INSERT INTO public.moon VALUES (4, 'Thebe', 5, 98.6, 222000);
INSERT INTO public.moon VALUES (5, 'Adrastea', 5, 16.4, NULL);
INSERT INTO public.moon VALUES (6, 'Io', 5, 16.4, 262000);
INSERT INTO public.moon VALUES (7, 'Herse', 5, 2, 23.4);
INSERT INTO public.moon VALUES (8, 'Callirrhoe', 5, 9.6, 24.1);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 170, 1.15e+07);
INSERT INTO public.moon VALUES (10, 'Callisto', 5, 4820.6, 3.904e+08);
INSERT INTO public.moon VALUES (11, 'Themisto', 5, 8, 7.3e+06);
INSERT INTO public.moon VALUES (12, 'Cyllene', 5, 2, 2.38e+07);
INSERT INTO public.moon VALUES (13, 'Amalthea', 5, 167, 181400);
INSERT INTO public.moon VALUES (14, 'Eukelade', 5, 4, 2.33e+07);
INSERT INTO public.moon VALUES (15, 'Arche', 5, 3, 2.34e+07);
INSERT INTO public.moon VALUES (16, 'Mneme', 5, 2, 2.1e+07);
INSERT INTO public.moon VALUES (17, 'Aoede', 5, 4, 2.4e+07);
INSERT INTO public.moon VALUES (18, 'Helike', 5, 4, 2.11e+07);
INSERT INTO public.moon VALUES (19, 'Carme', 5, 46.7, 2.34e+07);
INSERT INTO public.moon VALUES (20, 'Carpo', 5, 3, 1.7e+07);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 88, 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 225, 2, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 365, 3, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 687, 4, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4333, 5, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 10759, 6, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 30687, 7, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 60190, 8, true);
INSERT INTO public.planet VALUES (10, 'Kepler-16b', 1, 228.776, 10, true);
INSERT INTO public.planet VALUES (11, 'test', 3, 123, 11, true);
INSERT INTO public.planet VALUES (12, 'test22', 3, 3123, 12, true);
INSERT INTO public.planet VALUES (13, 'test33', 2, 23, 13, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Stellar', 1.5000273e+07);
INSERT INTO public.star VALUES (2, 'HD 15558', 1, 'O-type', 46800);
INSERT INTO public.star VALUES (3, '63 Andromedae', 3, 'B9VpSi', 11967);
INSERT INTO public.star VALUES (4, 'Iota Andromedae', 3, 'B8 V', 12620);
INSERT INTO public.star VALUES (5, '7 Andromedae', 3, 'F1V', 7380);
INSERT INTO public.star VALUES (6, '14 Andromedae', 3, 'K0 III', 4743);
INSERT INTO public.star VALUES (7, 'Kepler-16', 1, 'K / M', 4450);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


--
-- Name: astronomer astronomer_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_unique UNIQUE (astronomer_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: planet galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: galaxy galaxy_unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: planet planet_unique_order_to_sun; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_order_to_sun UNIQUE (order_to_sun);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

