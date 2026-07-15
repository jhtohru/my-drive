--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: spicedb
--

CREATE TABLE public.alembic_version (
    version_num character varying NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO spicedb;

--
-- Name: caveat; Type: TABLE; Schema: public; Owner: spicedb
--

CREATE TABLE public.caveat (
    name character varying NOT NULL,
    definition bytea NOT NULL,
    created_transaction bigint,
    deleted_transaction bigint DEFAULT '9223372036854775807'::bigint,
    created_xid xid8 DEFAULT pg_current_xact_id() NOT NULL,
    deleted_xid xid8 DEFAULT '9223372036854775807'::xid8 NOT NULL
);


ALTER TABLE public.caveat OWNER TO spicedb;

--
-- Name: metadata; Type: TABLE; Schema: public; Owner: spicedb
--

CREATE TABLE public.metadata (
    unique_id character varying NOT NULL
);


ALTER TABLE public.metadata OWNER TO spicedb;

--
-- Name: namespace_config; Type: TABLE; Schema: public; Owner: spicedb
--

CREATE TABLE public.namespace_config (
    namespace character varying NOT NULL,
    serialized_config bytea NOT NULL,
    created_xid xid8 DEFAULT pg_current_xact_id() NOT NULL,
    deleted_xid xid8 DEFAULT '9223372036854775807'::xid8 NOT NULL
);


ALTER TABLE public.namespace_config OWNER TO spicedb;

--
-- Name: relation_tuple; Type: TABLE; Schema: public; Owner: spicedb
--

CREATE TABLE public.relation_tuple (
    namespace character varying NOT NULL,
    object_id character varying NOT NULL,
    relation character varying NOT NULL,
    userset_namespace character varying NOT NULL,
    userset_object_id character varying NOT NULL,
    userset_relation character varying NOT NULL,
    caveat_name character varying,
    caveat_context jsonb,
    created_xid xid8 DEFAULT pg_current_xact_id() NOT NULL,
    deleted_xid xid8 DEFAULT '9223372036854775807'::xid8 NOT NULL,
    expiration timestamp with time zone
);


ALTER TABLE public.relation_tuple OWNER TO spicedb;

--
-- Name: relation_tuple_transaction; Type: TABLE; Schema: public; Owner: spicedb
--

CREATE TABLE public.relation_tuple_transaction (
    "timestamp" timestamp without time zone DEFAULT (now() AT TIME ZONE 'UTC'::text) NOT NULL,
    xid xid8 DEFAULT pg_current_xact_id() NOT NULL,
    snapshot pg_snapshot DEFAULT pg_current_snapshot() NOT NULL,
    metadata jsonb DEFAULT '{}'::jsonb NOT NULL
);


ALTER TABLE public.relation_tuple_transaction OWNER TO spicedb;

--
-- Name: relationship_counter; Type: TABLE; Schema: public; Owner: spicedb
--

CREATE TABLE public.relationship_counter (
    name character varying NOT NULL,
    serialized_filter bytea NOT NULL,
    current_count bigint DEFAULT 0 NOT NULL,
    updated_revision_snapshot pg_snapshot,
    created_xid xid8 DEFAULT pg_current_xact_id() NOT NULL,
    deleted_xid xid8 DEFAULT '9223372036854775807'::xid8 NOT NULL
);


ALTER TABLE public.relationship_counter OWNER TO spicedb;

--
-- Name: schema; Type: TABLE; Schema: public; Owner: spicedb
--

CREATE TABLE public.schema (
    name character varying NOT NULL,
    chunk_index integer NOT NULL,
    chunk_data bytea NOT NULL,
    created_xid xid8 DEFAULT pg_current_xact_id() NOT NULL,
    deleted_xid xid8 DEFAULT '9223372036854775807'::xid8 NOT NULL
);


ALTER TABLE public.schema OWNER TO spicedb;

--
-- Name: schema_revision; Type: TABLE; Schema: public; Owner: spicedb
--

CREATE TABLE public.schema_revision (
    name character varying DEFAULT 'current'::character varying NOT NULL,
    hash bytea NOT NULL,
    created_xid xid8 DEFAULT pg_current_xact_id() NOT NULL,
    deleted_xid xid8 DEFAULT '9223372036854775807'::xid8 NOT NULL
);


ALTER TABLE public.schema_revision OWNER TO spicedb;

--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: spicedb
--

COPY public.alembic_version (version_num) FROM stdin;
populate-schema-tables
\.


--
-- Data for Name: caveat; Type: TABLE DATA; Schema: public; Owner: spicedb
--

COPY public.caveat (name, definition, created_transaction, deleted_transaction, created_xid, deleted_xid) FROM stdin;
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: public; Owner: spicedb
--

COPY public.metadata (unique_id) FROM stdin;
207c23ee-5904-4272-9f99-a20a0dac2917
\.


--
-- Data for Name: namespace_config; Type: TABLE DATA; Schema: public; Owner: spicedb
--

COPY public.namespace_config (namespace, serialized_config, created_xid, deleted_xid) FROM stdin;
user	\\x0a04757365722200	832	9223372036854775807
document	\\x0a08646f63756d656e74125f0a056f776e65721a130a110a04757365722a04080310111a032e2e2e22340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208012a04080310013a056f776e657212770a047265616412192204080510130a110a0f2a0408051013120712056f776e657222340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a040805100132056f776e65723a11253539366138363630663961306330383512780a05777269746512192204080610140a110a0f2a0408061014120712056f776e657222340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a040806100132056f776e65723a11253539366138363630663961306330383512790a0664656c65746512192204080710150a110a0f2a0408071015120712056f776e657222340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a040807100132056f776e65723a11253539366138363630663961306330383522020802	832	9223372036854775807
node	\\x0a046e6f646512610a06706172656e741a130a110a046e6f64652a04080b10121a032e2e2e22340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208012a04080b10013a06706172656e74125f0a056f776e65721a130a110a04757365722a04080c10111a032e2e2e22340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208012a04080c10013a056f776e657212610a06656469746f721a130a110a04757365722a04080d10121a032e2e2e22340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208012a04080d10013a06656469746f7212610a067669657765721a130a110a04757365722a04080e10121a032e2e2e22340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208012a04080e10013a0676696577657212a0010a046564697412492204081010130a410a102a040810101312081206656469746f720a1c2a040810101c1a140a080a06706172656e74120808011204656469740a0f2a040810102b120712056f776e657222340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081010013a11256531636232303062613534373666616612770a0675706461746512182204081110150a100a0e2a0408111015120612046564697422340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081110013204656469743a11253938343566643836386538326336306312770a0664656c65746512182204081210150a100a0e2a0408121015120612046564697422340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081210013204656469743a11253938343566643836386538326336306312760a05736861726512182204081310140a100a0e2a0408131014120612046564697422340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081310013204656469743a112539383435666438363865383263363063127b0a0a656469745f736861726512182204081410190a100a0e2a0408141019120612046564697422340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081410013204656469743a112539383435666438363865383263363063127c0a0b6c6973745f736861726573121822040815101a0a100a0e2a040815101a120612046564697422340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081510013204656469743a11253938343566643836386538326336306312780a07756e736861726512182204081610160a100a0e2a0408161016120612046564697422340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081610013204656469743a11253938343566643836386538326336306312790a086d6f76655f6f757412182204081710170a100a0e2a0408171017120612046564697422340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081710013204656469743a11253938343566643836386538326336306312780a076d6f76655f696e12182204081810160a100a0e2a0408181016120612046564697422340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081810013204656469743a112539383435666438363865383263363063129f010a047669657712482204081910130a400a102a0408191013120812067669657765720a1c2a040819101c1a140a080a06706172656e74120808011204766965770a0e2a040819102b120612046564697422340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081910013a112562303732353337336436303433346462127e0a0d6c6973745f636f6e74656e747312182204081a101c0a100a0e2a04081a101c120612047669657722340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081a10013204766965773a1125646464633635306538396137626631611285010a06736861726565122c2204081b10150a240a102a04081b1015120812067669657765720a102a04081b101e12081206656469746f7222340a320a2c747970652e676f6f676c65617069732e636f6d2f696d706c2e76312e52656c6174696f6e4d65746164617461120208022a04081b10013a1125303464346562393664376237636333662202080a	832	9223372036854775807
\.


--
-- Data for Name: relation_tuple; Type: TABLE DATA; Schema: public; Owner: spicedb
--

COPY public.relation_tuple (namespace, object_id, relation, userset_namespace, userset_object_id, userset_relation, caveat_name, caveat_context, created_xid, deleted_xid, expiration) FROM stdin;
document	c73df92c-83f0-4102-9b09-800a3f876969	owner	user	2bfeb790-acb2-4fab-beee-2db5673e47e8	...		\N	841	9223372036854775807	\N
document	0c482b3f-5cc7-40e1-bfa3-b31ff83b17ca	owner	user	2bfeb790-acb2-4fab-beee-2db5673e47e8	...		\N	842	9223372036854775807	\N
document	4fa8fede-3da3-4cf1-b653-0fd2559d5c62	owner	user	2bfeb790-acb2-4fab-beee-2db5673e47e8	...		\N	843	9223372036854775807	\N
\.


--
-- Data for Name: relation_tuple_transaction; Type: TABLE DATA; Schema: public; Owner: spicedb
--

COPY public.relation_tuple_transaction ("timestamp", xid, snapshot, metadata) FROM stdin;
1970-01-01 00:00:00	1	1:1:	{}
2026-07-16 02:07:17.046516	831	831:831:	{}
2026-07-16 02:07:17.652323	832	832:832:	{}
2026-07-16 02:07:22.046918	833	833:833:	{}
2026-07-16 02:07:27.047094	834	834:834:	{}
2026-07-16 02:07:32.04673	835	835:835:	{}
2026-07-16 02:07:37.046428	840	840:840:	{}
2026-07-16 02:07:38.933875	841	841:841:	{}
2026-07-16 02:07:40.784532	842	842:842:	{}
2026-07-16 02:07:42.105809	843	843:843:	{}
2026-07-16 02:07:47.046824	844	844:844:	{}
2026-07-16 02:07:52.04707	845	845:845:	{}
2026-07-16 02:07:57.04657	857	857:857:	{}
2026-07-16 02:08:02.046151	858	858:858:	{}
2026-07-16 02:08:07.046801	859	859:859:	{}
2026-07-16 02:08:12.046372	860	860:860:	{}
2026-07-16 02:08:17.046595	861	861:861:	{}
2026-07-16 02:08:22.046339	862	862:862:	{}
2026-07-16 02:08:27.046881	863	863:863:	{}
2026-07-16 02:08:32.04696	864	864:864:	{}
2026-07-16 02:08:37.046685	865	865:865:	{}
2026-07-16 02:08:42.047227	866	866:866:	{}
\.


--
-- Data for Name: relationship_counter; Type: TABLE DATA; Schema: public; Owner: spicedb
--

COPY public.relationship_counter (name, serialized_filter, current_count, updated_revision_snapshot, created_xid, deleted_xid) FROM stdin;
\.


--
-- Data for Name: schema; Type: TABLE DATA; Schema: public; Owner: spicedb
--

COPY public.schema (name, chunk_index, chunk_data, created_xid, deleted_xid) FROM stdin;
\.


--
-- Data for Name: schema_revision; Type: TABLE DATA; Schema: public; Owner: spicedb
--

COPY public.schema_revision (name, hash, created_xid, deleted_xid) FROM stdin;
\.


--
-- Name: metadata metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (unique_id);


--
-- Name: caveat pk_caveat_v2; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.caveat
    ADD CONSTRAINT pk_caveat_v2 PRIMARY KEY (name, deleted_xid);


--
-- Name: namespace_config pk_namespace_config; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.namespace_config
    ADD CONSTRAINT pk_namespace_config PRIMARY KEY (namespace, created_xid, deleted_xid);


--
-- Name: relation_tuple pk_relation_tuple; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.relation_tuple
    ADD CONSTRAINT pk_relation_tuple PRIMARY KEY (namespace, object_id, relation, userset_namespace, userset_object_id, userset_relation, created_xid, deleted_xid);


--
-- Name: relationship_counter pk_relationship_counter; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.relationship_counter
    ADD CONSTRAINT pk_relationship_counter PRIMARY KEY (name);


--
-- Name: relation_tuple_transaction pk_rttx; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.relation_tuple_transaction
    ADD CONSTRAINT pk_rttx PRIMARY KEY (xid);


--
-- Name: schema pk_schema; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.schema
    ADD CONSTRAINT pk_schema PRIMARY KEY (name, chunk_index, created_xid);


--
-- Name: schema_revision pk_schema_revision; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.schema_revision
    ADD CONSTRAINT pk_schema_revision PRIMARY KEY (name, created_xid);


--
-- Name: caveat uq_caveat_v2; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.caveat
    ADD CONSTRAINT uq_caveat_v2 UNIQUE (name, created_xid, deleted_xid);


--
-- Name: namespace_config uq_namespace_living_xid; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.namespace_config
    ADD CONSTRAINT uq_namespace_living_xid UNIQUE (namespace, deleted_xid);


--
-- Name: relation_tuple uq_relation_tuple_living_xid; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.relation_tuple
    ADD CONSTRAINT uq_relation_tuple_living_xid UNIQUE (namespace, object_id, relation, userset_namespace, userset_object_id, userset_relation, deleted_xid);


--
-- Name: relationship_counter uq_relationship_counter_living; Type: CONSTRAINT; Schema: public; Owner: spicedb
--

ALTER TABLE ONLY public.relationship_counter
    ADD CONSTRAINT uq_relationship_counter_living UNIQUE (name, deleted_xid);


--
-- Name: ix_gc_index; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_gc_index ON public.relation_tuple USING btree (deleted_xid DESC) WHERE (deleted_xid < '9223372036854775807'::xid8);


--
-- Name: ix_relation_tuple_alive_by_resource_rel_subject_covering; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_relation_tuple_alive_by_resource_rel_subject_covering ON public.relation_tuple USING btree (namespace, relation, userset_namespace) INCLUDE (userset_object_id, userset_relation, caveat_name, caveat_context) WHERE (deleted_xid = '9223372036854775807'::xid8);


--
-- Name: ix_relation_tuple_by_subject; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_relation_tuple_by_subject ON public.relation_tuple USING btree (userset_object_id, userset_namespace, userset_relation, namespace, relation);


--
-- Name: ix_relation_tuple_by_subject_relation; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_relation_tuple_by_subject_relation ON public.relation_tuple USING btree (userset_namespace, userset_relation, namespace, relation);


--
-- Name: ix_relation_tuple_expired; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_relation_tuple_expired ON public.relation_tuple USING btree (expiration) WHERE (expiration IS NOT NULL);


--
-- Name: ix_relation_tuple_transaction_by_timestamp; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_relation_tuple_transaction_by_timestamp ON public.relation_tuple_transaction USING btree ("timestamp");


--
-- Name: ix_relation_tuple_transaction_xid_desc_timestamp; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_relation_tuple_transaction_xid_desc_timestamp ON public.relation_tuple_transaction USING btree (xid DESC, "timestamp");


--
-- Name: ix_schema_gc; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_schema_gc ON public.schema USING btree (deleted_xid DESC) WHERE (deleted_xid < '9223372036854775807'::xid8);


--
-- Name: ix_schema_revision_gc; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_schema_revision_gc ON public.schema_revision USING btree (deleted_xid DESC) WHERE (deleted_xid < '9223372036854775807'::xid8);


--
-- Name: ix_watch_api_index; Type: INDEX; Schema: public; Owner: spicedb
--

CREATE INDEX ix_watch_api_index ON public.relation_tuple USING btree (created_xid);


--
-- PostgreSQL database dump complete
--

