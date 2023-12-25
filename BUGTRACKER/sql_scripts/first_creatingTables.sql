-- SEQUENCE: public.seq_user_id

-- DROP SEQUENCE IF EXISTS public.seq_user_id;

CREATE SEQUENCE IF NOT EXISTS public.seq_user_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.seq_user_id
    OWNER TO admin;

-- Table: public.user

-- DROP TABLE IF EXISTS public."user";

CREATE TABLE IF NOT EXISTS public."user"
(
    user_id bigint NOT NULL DEFAULT nextval('seq_user_id'::regclass),
    first_name character varying(30) COLLATE pg_catalog."default",
    last_name character varying(30) COLLATE pg_catalog."default",
    pass character varying(20) COLLATE pg_catalog."default" NOT NULL,
    login_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    role character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (user_id),
    CONSTRAINT login_name UNIQUE (login_name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."user"
    OWNER to admin;
-- Index: login_idx

-- DROP INDEX IF EXISTS public.login_idx;

CREATE INDEX IF NOT EXISTS login_idx
    ON public."user" USING btree
    (login_name COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;
	
-- SEQUENCE: public.seq_bug_id

-- DROP SEQUENCE IF EXISTS public.seq_bug_id;

CREATE SEQUENCE IF NOT EXISTS public.seq_bug_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.seq_bug_id
    OWNER TO admin;

-- Table: public.bug

-- DROP TABLE IF EXISTS public.bug;

CREATE TABLE IF NOT EXISTS public.bug
(
    bug_id bigint NOT NULL DEFAULT nextval('seq_bug_id'::regclass),
    status character varying(20) COLLATE pg_catalog."default" NOT NULL DEFAULT 'Новая'::character varying,
    description character varying(4000) COLLATE pg_catalog."default",
    short_description character varying(255) COLLATE pg_catalog."default",
    priority character varying(20) COLLATE pg_catalog."default",
    severity character varying(20) COLLATE pg_catalog."default",
    date timestamp with time zone NOT NULL DEFAULT now(),
    ref_user_id bigint,
    CONSTRAINT bugs_pkey PRIMARY KEY (bug_id),
    CONSTRAINT user_fk FOREIGN KEY (ref_user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.bug
    OWNER to admin;
-- Index: ref_user_id_idx

-- DROP INDEX IF EXISTS public.ref_user_id_idx;

CREATE INDEX IF NOT EXISTS ref_user_id_idx
    ON public.bug USING btree
    (ref_user_id ASC NULLS LAST)
    TABLESPACE pg_default;
	
-- SEQUENCE: public.seq_history_id

-- DROP SEQUENCE IF EXISTS public.seq_history_id;

CREATE SEQUENCE IF NOT EXISTS public.seq_history_id
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.seq_history_id
    OWNER TO admin;

-- Table: public.history

-- DROP TABLE IF EXISTS public.history;

CREATE TABLE IF NOT EXISTS public.history
(
    history_id bigint NOT NULL DEFAULT nextval('seq_history_id'::regclass),
    ref_bug_id bigint NOT NULL,
    act character varying(20) COLLATE pg_catalog."default",
    note character varying(4000) COLLATE pg_catalog."default",
    ref_user_id bigint,
    date timestamp with time zone NOT NULL DEFAULT now(),
    CONSTRAINT history_pkey PRIMARY KEY (history_id),
    CONSTRAINT bug_fk FOREIGN KEY (ref_bug_id)
        REFERENCES public.bug (bug_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT user_fk FOREIGN KEY (ref_user_id)
        REFERENCES public."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.history
    OWNER to admin;
-- Index: ref_bug_id_hist_idx

-- DROP INDEX IF EXISTS public.ref_bug_id_hist_idx;

CREATE INDEX IF NOT EXISTS ref_bug_id_hist_idx
    ON public.history USING btree
    (ref_bug_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: ref_user_id_hist_idx

-- DROP INDEX IF EXISTS public.ref_user_id_hist_idx;

CREATE INDEX IF NOT EXISTS ref_user_id_hist_idx
    ON public.history USING btree
    (ref_user_id ASC NULLS LAST)
    TABLESPACE pg_default;