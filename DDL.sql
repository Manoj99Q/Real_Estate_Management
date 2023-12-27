BEGIN;


CREATE TABLE IF NOT EXISTS public.address
(
    address_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    street_number integer NOT NULL,
    street_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    apartment_number integer NOT NULL,
    city character varying(255) COLLATE pg_catalog."default" NOT NULL,
    state character varying(255) COLLATE pg_catalog."default" NOT NULL,
    zip character varying(255) COLLATE pg_catalog."default" NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT address_pkey PRIMARY KEY (address_id)
);

CREATE TABLE IF NOT EXISTS public.agent
(
    user_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    first_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email_address character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    address_id integer,
    job_title character varying(255) COLLATE pg_catalog."default",
    agency_id integer,
    CONSTRAINT agent_pkey PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public.apartments
(
    property_id integer NOT NULL,
    building_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    no_of_bedrooms integer NOT NULL,
    no_of_bathrooms integer NOT NULL,
    pets_allowed boolean NOT NULL,
    CONSTRAINT apartments_pkey PRIMARY KEY (property_id)
);

CREATE TABLE IF NOT EXISTS public.bookings
(
    booking_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    start_date date NOT NULL,
    end_date date NOT NULL,
    rental_period integer NOT NULL,
    credit_card_number bigint NOT NULL,
    user_id integer NOT NULL,
    property_id integer NOT NULL,
    CONSTRAINT bookings_pkey PRIMARY KEY (booking_id)
);

CREATE TABLE IF NOT EXISTS public.commercial_buildings
(
    property_id integer NOT NULL,
    square_footage integer NOT NULL,
    no_of_cameras integer NOT NULL,
    types_of_business character varying(255) COLLATE pg_catalog."default" NOT NULL,
    alarm boolean NOT NULL,
    CONSTRAINT commercial_buildings_pkey PRIMARY KEY (property_id)
);

CREATE TABLE IF NOT EXISTS public.credit_card_info
(
    credit_card_number bigint NOT NULL,
    expiry_date character varying(255) COLLATE pg_catalog."default" NOT NULL,
    name_on_card character varying(255) COLLATE pg_catalog."default" NOT NULL,
    address_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT credit_card_info_pkey PRIMARY KEY (credit_card_number)
);

CREATE TABLE IF NOT EXISTS public.houses
(
    property_id integer NOT NULL,
    square_footage integer NOT NULL,
    no_of_bathrooms integer NOT NULL,
    no_of_bedrooms integer NOT NULL,
    parking boolean NOT NULL,
    CONSTRAINT houses_pkey PRIMARY KEY (property_id)
);

CREATE TABLE IF NOT EXISTS public.neighborhood
(
    neighborhood_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    crime_rate double precision NOT NULL,
    no_of_parks integer NOT NULL,
    no_of_schools integer NOT NULL,
    pollution_levels double precision NOT NULL,
    CONSTRAINT neighborhood_pkey PRIMARY KEY (neighborhood_name)
);

CREATE TABLE IF NOT EXISTS public.open_land
(
    property_id integer NOT NULL,
    square_footage integer NOT NULL,
    has_road_access boolean NOT NULL,
    residental boolean NOT NULL,
    water_availability boolean NOT NULL,
    CONSTRAINT open_land_pkey PRIMARY KEY (property_id)
);

CREATE TABLE IF NOT EXISTS public.property
(
    property_id integer NOT NULL,
    rental_or_sale character varying(255) COLLATE pg_catalog."default" NOT NULL,
    property_type character varying(255) COLLATE pg_catalog."default" NOT NULL,
    description character varying(255) COLLATE pg_catalog."default" NOT NULL,
    availability_date date NOT NULL,
    address_id integer NOT NULL,
    agency_id integer NOT NULL,
    neighborhood_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    updatedon timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT property_pkey PRIMARY KEY (property_id)
);

CREATE TABLE IF NOT EXISTS public.prospective_renter
(
    user_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    first_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    email_address character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    budget double precision,
    preferred_location character varying(255) COLLATE pg_catalog."default",
    move_in_date date,
    reward_points integer,
    address_id integer,
    CONSTRAINT prospective_renter_pkey PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS public.real_estate_agency
(
    agency_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    agency_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    no_of_agents integer NOT NULL,
    CONSTRAINT real_estate_agency_pkey PRIMARY KEY (agency_id)
);

CREATE TABLE IF NOT EXISTS public.rent
(
    deposit integer NOT NULL,
    monthlyrent integer NOT NULL,
    wifi integer NOT NULL,
    electricity integer NOT NULL,
    gas integer NOT NULL,
    property_id integer NOT NULL,
    CONSTRAINT rent_pkey PRIMARY KEY (property_id)
);

CREATE TABLE IF NOT EXISTS public.sale
(
    propertycost integer NOT NULL,
    registrationfee integer NOT NULL,
    wifi integer NOT NULL,
    electricity integer NOT NULL,
    gas integer NOT NULL,
    property_id integer NOT NULL,
    CONSTRAINT sale_pkey PRIMARY KEY (property_id)
);

CREATE TABLE IF NOT EXISTS public.vacation_house
(
    property_id integer NOT NULL,
    square_footage integer NOT NULL,
    occupancy_limit integer NOT NULL,
    pool_size integer NOT NULL,
    types_of_vacation character varying(255) COLLATE pg_catalog."default" NOT NULL,
    no_of_bedrooms integer NOT NULL,
    home_theater boolean NOT NULL,
    CONSTRAINT vacation_house_pkey PRIMARY KEY (property_id)
);

ALTER TABLE IF EXISTS public.address
    ADD CONSTRAINT address_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.prospective_renter (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.agent
    ADD CONSTRAINT agent_address_id_fkey FOREIGN KEY (address_id)
    REFERENCES public.address (address_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.agent
    ADD CONSTRAINT agent_agency_id_fkey FOREIGN KEY (agency_id)
    REFERENCES public.real_estate_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.apartments
    ADD CONSTRAINT apartments_property_id_fkey FOREIGN KEY (property_id)
    REFERENCES public.property (property_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS apartments_pkey
    ON public.apartments(property_id);


ALTER TABLE IF EXISTS public.bookings
    ADD CONSTRAINT bookings_credit_card_number_fkey FOREIGN KEY (credit_card_number)
    REFERENCES public.credit_card_info (credit_card_number) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.bookings
    ADD CONSTRAINT bookings_property_id_fkey FOREIGN KEY (property_id)
    REFERENCES public.property (property_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.bookings
    ADD CONSTRAINT bookings_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.prospective_renter (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.commercial_buildings
    ADD CONSTRAINT commercial_buildings_property_id_fkey FOREIGN KEY (property_id)
    REFERENCES public.property (property_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS commercial_buildings_pkey
    ON public.commercial_buildings(property_id);


ALTER TABLE IF EXISTS public.credit_card_info
    ADD CONSTRAINT credit_card_info_address_id_fkey FOREIGN KEY (address_id)
    REFERENCES public.address (address_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.credit_card_info
    ADD CONSTRAINT credit_card_info_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES public.prospective_renter (user_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.houses
    ADD CONSTRAINT houses_property_id_fkey FOREIGN KEY (property_id)
    REFERENCES public.property (property_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS houses_pkey
    ON public.houses(property_id);


ALTER TABLE IF EXISTS public.open_land
    ADD CONSTRAINT open_land_property_id_fkey FOREIGN KEY (property_id)
    REFERENCES public.property (property_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS open_land_pkey
    ON public.open_land(property_id);


ALTER TABLE IF EXISTS public.property
    ADD CONSTRAINT property_address_id_fkey FOREIGN KEY (address_id)
    REFERENCES public.address (address_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.property
    ADD CONSTRAINT property_agency_id_fkey FOREIGN KEY (agency_id)
    REFERENCES public.real_estate_agency (agency_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.property
    ADD CONSTRAINT property_neighborhood_name_fkey FOREIGN KEY (neighborhood_name)
    REFERENCES public.neighborhood (neighborhood_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.prospective_renter
    ADD CONSTRAINT prospective_renter_address_id_fkey FOREIGN KEY (address_id)
    REFERENCES public.address (address_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.rent
    ADD CONSTRAINT rent_property_id_fkey FOREIGN KEY (property_id)
    REFERENCES public.property (property_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS rent_pkey
    ON public.rent(property_id);


ALTER TABLE IF EXISTS public.sale
    ADD CONSTRAINT sale_property_id_fkey FOREIGN KEY (property_id)
    REFERENCES public.property (property_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS sale_pkey
    ON public.sale(property_id);


ALTER TABLE IF EXISTS public.vacation_house
    ADD CONSTRAINT vacation_house_property_id_fkey FOREIGN KEY (property_id)
    REFERENCES public.property (property_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
CREATE INDEX IF NOT EXISTS vacation_house_pkey
    ON public.vacation_house(property_id);

END;