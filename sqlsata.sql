CREATE TABLE public.contacts_log
(
    sno bigserial NOT NULL,
    name character varying NOT NULL,
    phone_no character varying NOT NULL,
    email character varying NOT NULL,
    msg character varying NOT NULL,
    date character varying,
    PRIMARY KEY (sno)
);


CREATE TABLE public.posts
(
    sno bigserial NOT NULL,
    title character varying NOT NULL,
    content character varying NOT NULL,
    date character varying,
    slug character varying,
    PRIMARY KEY (sno)
);

ALTER TABLE public.posts
    ADD COLUMN img_file character varying;

ALTER TABLE public.posts
    ADD COLUMN tagline character varying;
