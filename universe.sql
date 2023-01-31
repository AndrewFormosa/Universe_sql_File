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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_ly integer,
    distance_ly integer,
    notes text
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    radius_km integer,
    discovered_by character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_landmarks; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_landmarks (
    moon_landmarks_id integer NOT NULL,
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    notes text
);


ALTER TABLE public.moon_landmarks OWNER TO freecodecamp;

--
-- Name: moon_landmarks_moon_landmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_landmarks_moon_landmarks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_landmarks_moon_landmarks_id_seq OWNER TO freecodecamp;

--
-- Name: moon_landmarks_moon_landmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_landmarks_moon_landmarks_id_seq OWNED BY public.moon_landmarks.moon_landmarks_id;


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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    earth_mass numeric,
    potentially_habitable boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    solar_mass numeric(6,3),
    system character varying(30),
    bright_star boolean
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
-- Name: moon_landmarks moon_landmarks_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_landmarks ALTER COLUMN moon_landmarks_id SET DEFAULT nextval('public.moon_landmarks_moon_landmarks_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 0, 'Our oun galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, 2500000, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way in around 4.5 billion years from now');
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 37000, 11500000, ' It is about five times more luminous than the Milky Way and its central region is about one hundred times more luminous.');
INSERT INTO public.galaxy VALUES (4, 'Pinwheel Galaxy', 170000, 20870000, 'On February 28, 2006, NASA and the European Space Agency released a very detailed image of the Pinwheel Galaxy, which was the largest and most-detailed image of a galaxy by Hubble Space Telescope at the time.[10] The image was composed of 51 individual exposures, plus some extra ground-based photos.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 50000, 29350000, 'It has a bright nucleus, an unusually large central bulge, and a prominent dust lane in its outer disk, which is viewed almost edge-on. The dark dust lane and the bulge give it the appearance of a sombrero hat (thus the name).');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 60000, 30000000, ' the first galaxy to be classified as a spiral galaxy.');
INSERT INTO public.galaxy VALUES (7, 'Tadpole Galaxy', 280000, 420000000, 'This shape resulted from tidal interaction that drew out a long tidal tail.');
INSERT INTO public.galaxy VALUES (8, 'Hoags Object', 100000, 600000000, 'It is of the subtype Hoag-type galaxy, and may in fact be a polar-ring galaxy with the ring in the plane of rotation of the central object.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Ganymede', 6, 2634, 'Galileo');
INSERT INTO public.moon VALUES (2, 'Titan', 5, 2574, 'Huygens');
INSERT INTO public.moon VALUES (3, 'Callisto', 6, 2410, 'Galileo');
INSERT INTO public.moon VALUES (4, 'Io', 6, 1821, 'Galileo');
INSERT INTO public.moon VALUES (5, 'Moon', 3, 1738, 'Unknown');
INSERT INTO public.moon VALUES (6, 'Europa', 6, 1560, 'Galileo');
INSERT INTO public.moon VALUES (7, 'Triton', 7, 1353, 'Lassell');
INSERT INTO public.moon VALUES (8, 'Titania', 8, 789, 'Herschel');
INSERT INTO public.moon VALUES (9, 'Rhea', 5, 763, 'Cassini');
INSERT INTO public.moon VALUES (10, 'Oberon', 8, 761, 'Herschel');
INSERT INTO public.moon VALUES (11, 'Iapetus', 5, 735, 'Cassini');
INSERT INTO public.moon VALUES (12, 'Umbriel', 8, 584, 'Lassell');
INSERT INTO public.moon VALUES (13, 'Ariel', 8, 578, 'Lassell');
INSERT INTO public.moon VALUES (14, 'Dione', 5, 561, 'Cassini');
INSERT INTO public.moon VALUES (15, 'Tethys', 5, 533, 'Cassini');
INSERT INTO public.moon VALUES (16, 'Enceladus', 5, 238, 'Herschel');
INSERT INTO public.moon VALUES (17, 'Miranda', 8, 235, 'Kuiper');
INSERT INTO public.moon VALUES (18, 'Proteus', 7, 210, 'Synott');
INSERT INTO public.moon VALUES (19, 'Mimas', 5, 198, 'Herschel');
INSERT INTO public.moon VALUES (20, 'Nereid', 7, 170, 'Kuiper');


--
-- Data for Name: moon_landmarks; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_landmarks VALUES (1, 'The Lunar Marina', 5, 'These dark regions -- Latin for seas -- are solidified lava flows from between 3-3.5 billion years ago: a billion years younger than the majority of the lunar surface. Mare Tranquillitatis contained Apollo 11s landing site.');
INSERT INTO public.moon_landmarks VALUES (2, 'Montes Apenninus', 5, 'The Moons highest mountain range outlines Mare Imbrium, extending for over 400 km. It contains Mons Huygens, the Moons tallest mountain, and the Hadley–Apennine valley, where Apollo 15 landed. ');
INSERT INTO public.moon_landmarks VALUES (3, 'Tycho Crater', 5, 'A highly-reflective impact crater over 100 km in diameter in the southern lunar highlands. Prominent rays emanate from the impact site. Samples collected by Apollo 16 determined Tychos young age: 108 million years');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.0553, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.815, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.108, true);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 317.8, false);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1, 95.2, false);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 17.2, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 14.6, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri d', 2, 0.26, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 2, 1.2, true);
INSERT INTO public.planet VALUES (11, 'A Egir', 6, 248, true);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', 4, 3.9, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.000, 'Solar System', true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.122, 'Alpha Centauri', false);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 1, 1.079, 'Alpha Centauri', true);
INSERT INTO public.star VALUES (4, 'Tau Ceti', 1, 0.780, 'Cetus', true);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 2.063, 'Alpha Canis Majoris', true);
INSERT INTO public.star VALUES (6, 'Ran', 1, 0.820, 'Ran', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_landmarks_moon_landmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_landmarks_moon_landmarks_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon_landmarks moon_landmarks_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_landmarks
    ADD CONSTRAINT moon_landmarks_name_key UNIQUE (name);


--
-- Name: moon_landmarks moon_landmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_landmarks
    ADD CONSTRAINT moon_landmarks_pkey PRIMARY KEY (moon_landmarks_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon_landmarks moon_landmarks_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_landmarks
    ADD CONSTRAINT moon_landmarks_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

