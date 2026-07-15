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
-- Name: adapter; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.adapter (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    "table" character varying(100),
    use_same_db boolean,
    type character varying(100),
    database_type character varying(100),
    host character varying(100),
    port integer,
    "user" character varying(100),
    password character varying(150),
    database character varying(100)
);


ALTER TABLE public.adapter OWNER TO casdoor;

--
-- Name: agent; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.agent (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    url character varying(500),
    token character varying(500),
    application character varying(100)
);


ALTER TABLE public.agent OWNER TO casdoor;

--
-- Name: application; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.application (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    category character varying(20),
    type character varying(20),
    scopes text,
    logo character varying(200),
    title character varying(100),
    favicon character varying(200),
    "order" integer,
    homepage_url character varying(100),
    description text,
    organization character varying(100),
    cert character varying(100),
    default_group character varying(100),
    default_tag character varying(100),
    header_html text,
    page_html text,
    enable_password boolean,
    enable_sign_up boolean,
    enable_guest_signin boolean,
    disable_signin boolean,
    enable_signin_session boolean,
    enable_auto_signin boolean,
    enable_code_signin boolean,
    enable_exclusive_signin boolean,
    enable_saml_compress boolean,
    enable_saml_c14n10 boolean,
    enable_saml_post_binding boolean,
    disable_saml_attributes boolean,
    enable_saml_assertion_signature boolean,
    use_email_as_saml_name_id boolean,
    enable_web_authn boolean,
    enable_link_with_email boolean,
    org_choice_mode character varying(255),
    saml_reply_url character varying(500),
    providers text,
    signin_methods character varying(2000),
    signup_items character varying(3000),
    signin_items text,
    grant_types character varying(1000),
    tags text,
    saml_attributes character varying(1000),
    saml_hash_algorithm character varying(20),
    saml_c14n_prefix character varying(100),
    is_shared boolean,
    ip_restriction character varying(255),
    client_id character varying(100),
    client_secret character varying(100),
    client_cert character varying(100),
    redirect_uris character varying(1000),
    backchannel_logout_uri character varying(500),
    forced_redirect_origin character varying(100),
    token_format character varying(100),
    token_signing_method character varying(100),
    token_fields character varying(1000),
    token_attributes text,
    expire_in_hours double precision,
    refresh_expire_in_hours double precision,
    cookie_expire_in_hours bigint,
    signup_url character varying(200),
    signin_url character varying(200),
    forget_url character varying(200),
    affiliation_url character varying(100),
    ip_whitelist character varying(200),
    terms_of_use character varying(200),
    signup_html text,
    signin_html text,
    theme_data json,
    footer_html text,
    form_css text,
    form_css_mobile text,
    form_offset integer,
    form_side_html text,
    form_background_url character varying(200),
    form_background_url_mobile character varying(200),
    failed_signin_limit integer,
    failed_signin_frozen_time integer,
    code_resend_timeout integer,
    custom_scopes text,
    domain character varying(100),
    other_domains character varying(1000),
    upstream_host character varying(100),
    ssl_mode character varying(100),
    ssl_cert character varying(100),
    registration_access_token character varying(100)
);


ALTER TABLE public.application OWNER TO casdoor;

--
-- Name: casbin_api_rule; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.casbin_api_rule (
    id bigint NOT NULL,
    ptype character varying(100) DEFAULT ''::character varying NOT NULL,
    v0 character varying(100) DEFAULT ''::character varying NOT NULL,
    v1 character varying(100) DEFAULT ''::character varying NOT NULL,
    v2 character varying(100) DEFAULT ''::character varying NOT NULL,
    v3 character varying(100) DEFAULT ''::character varying NOT NULL,
    v4 character varying(100) DEFAULT ''::character varying NOT NULL,
    v5 character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.casbin_api_rule OWNER TO casdoor;

--
-- Name: casbin_api_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: casdoor
--

CREATE SEQUENCE public.casbin_api_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casbin_api_rule_id_seq OWNER TO casdoor;

--
-- Name: casbin_api_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: casdoor
--

ALTER SEQUENCE public.casbin_api_rule_id_seq OWNED BY public.casbin_api_rule.id;


--
-- Name: casbin_rule; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.casbin_rule (
    id bigint NOT NULL,
    ptype character varying(100) DEFAULT ''::character varying NOT NULL,
    v0 character varying(100) DEFAULT ''::character varying NOT NULL,
    v1 character varying(100) DEFAULT ''::character varying NOT NULL,
    v2 character varying(100) DEFAULT ''::character varying NOT NULL,
    v3 character varying(100) DEFAULT ''::character varying NOT NULL,
    v4 character varying(100) DEFAULT ''::character varying NOT NULL,
    v5 character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.casbin_rule OWNER TO casdoor;

--
-- Name: casbin_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: casdoor
--

CREATE SEQUENCE public.casbin_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casbin_rule_id_seq OWNER TO casdoor;

--
-- Name: casbin_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: casdoor
--

ALTER SEQUENCE public.casbin_rule_id_seq OWNED BY public.casbin_rule.id;


--
-- Name: casbin_user_rule; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.casbin_user_rule (
    id bigint NOT NULL,
    ptype character varying(100) DEFAULT ''::character varying NOT NULL,
    v0 character varying(100) DEFAULT ''::character varying NOT NULL,
    v1 character varying(100) DEFAULT ''::character varying NOT NULL,
    v2 character varying(100) DEFAULT ''::character varying NOT NULL,
    v3 character varying(100) DEFAULT ''::character varying NOT NULL,
    v4 character varying(100) DEFAULT ''::character varying NOT NULL,
    v5 character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.casbin_user_rule OWNER TO casdoor;

--
-- Name: casbin_user_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: casdoor
--

CREATE SEQUENCE public.casbin_user_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.casbin_user_rule_id_seq OWNER TO casdoor;

--
-- Name: casbin_user_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: casdoor
--

ALTER SEQUENCE public.casbin_user_rule_id_seq OWNED BY public.casbin_user_rule.id;


--
-- Name: cert; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.cert (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    scope character varying(100),
    type character varying(100),
    crypto_algorithm character varying(100),
    bit_size integer,
    expire_in_years integer,
    expire_time character varying(100),
    domain_expire_time character varying(100),
    provider character varying(100),
    account character varying(100),
    access_key character varying(100),
    access_secret character varying(100),
    certificate text,
    private_key text
);


ALTER TABLE public.cert OWNER TO casdoor;

--
-- Name: coupon; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.coupon (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description text,
    code character varying(100),
    discount_type character varying(20),
    discount double precision,
    max_discount double precision,
    scope character varying(20),
    products character varying(2000),
    users character varying(2000),
    quantity integer,
    used_count integer,
    max_usage_per_user integer,
    start_time character varying(100),
    expire_time character varying(100),
    min_order_amount double precision,
    currency character varying(100),
    state character varying(20)
);


ALTER TABLE public.coupon OWNER TO casdoor;

--
-- Name: coupon_usage; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.coupon_usage (
    id integer NOT NULL,
    owner character varying(100),
    coupon_owner character varying(100),
    coupon_name character varying(100),
    "user" character varying(100),
    "order" character varying(100),
    created_time character varying(100),
    amount double precision
);


ALTER TABLE public.coupon_usage OWNER TO casdoor;

--
-- Name: coupon_usage_id_seq; Type: SEQUENCE; Schema: public; Owner: casdoor
--

CREATE SEQUENCE public.coupon_usage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.coupon_usage_id_seq OWNER TO casdoor;

--
-- Name: coupon_usage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: casdoor
--

ALTER SEQUENCE public.coupon_usage_id_seq OWNED BY public.coupon_usage.id;


--
-- Name: enforcer; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.enforcer (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    description text,
    model character varying(100),
    adapter character varying(100),
    enforcer text
);


ALTER TABLE public.enforcer OWNER TO casdoor;

--
-- Name: entry; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.entry (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    provider character varying(100),
    application character varying(100),
    type character varying(100),
    client_ip character varying(100),
    user_agent character varying(500),
    message text
);


ALTER TABLE public.entry OWNER TO casdoor;

--
-- Name: form; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.form (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    type character varying(100),
    tag character varying(100),
    form_items character varying(5000)
);


ALTER TABLE public.form OWNER TO casdoor;

--
-- Name: group; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public."group" (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    manager character varying(100),
    contact_email character varying(100),
    type character varying(100),
    parent_id character varying(100),
    is_top_group boolean,
    title character varying(255),
    key character varying(255),
    children text,
    is_enabled boolean,
    properties text
);


ALTER TABLE public."group" OWNER TO casdoor;

--
-- Name: invitation; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.invitation (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    code character varying(100),
    is_regexp boolean,
    quota integer,
    used_count integer,
    application character varying(100),
    username character varying(100),
    email character varying(100),
    phone character varying(100),
    signup_group character varying(100),
    default_code character varying(100),
    state character varying(100)
);


ALTER TABLE public.invitation OWNER TO casdoor;

--
-- Name: key; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.key (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    type character varying(100),
    organization character varying(100),
    application character varying(100),
    "user" character varying(100),
    access_key character varying(100),
    access_secret character varying(100),
    expire_time character varying(100),
    state character varying(100)
);


ALTER TABLE public.key OWNER TO casdoor;

--
-- Name: ldap; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.ldap (
    id character varying(100) NOT NULL,
    owner character varying(100),
    created_time character varying(100),
    server_name character varying(100),
    host character varying(100),
    port integer,
    enable_ssl boolean,
    allow_self_signed_cert boolean,
    username character varying(100),
    password character varying(100),
    base_dn character varying(500),
    filter character varying(200),
    filter_fields character varying(100),
    default_group character varying(100),
    default_groups text,
    password_type character varying(100),
    custom_attributes text,
    auto_sync integer,
    last_sync character varying(100),
    enable_groups boolean
);


ALTER TABLE public.ldap OWNER TO casdoor;

--
-- Name: model; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.model (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description text,
    model_text text
);


ALTER TABLE public.model OWNER TO casdoor;

--
-- Name: order; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public."order" (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    update_time character varying(100),
    display_name character varying(100),
    products character varying(1000),
    product_infos text,
    "user" character varying(100),
    payment character varying(100),
    price double precision,
    currency character varying(100),
    state character varying(100),
    message character varying(2000),
    coupon_name character varying(100),
    coupon_discount double precision
);


ALTER TABLE public."order" OWNER TO casdoor;

--
-- Name: organization; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.organization (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    website_url character varying(100),
    logo character varying(200),
    logo_dark character varying(200),
    favicon character varying(200),
    has_privilege_consent boolean,
    password_type character varying(100),
    password_salt character varying(100),
    password_options character varying(100),
    password_obfuscator_type character varying(100),
    password_obfuscator_key character varying(100),
    password_expire_days integer,
    country_codes text,
    default_avatar character varying(200),
    use_permanent_avatar boolean,
    default_application character varying(100),
    user_types text,
    tags text,
    languages character varying(255),
    theme_data json,
    master_password character varying(200),
    default_password character varying(200),
    master_verification_code character varying(100),
    ip_whitelist character varying(200),
    init_score integer,
    enable_soft_deletion boolean,
    is_profile_public boolean,
    use_email_as_username boolean,
    enable_tour boolean,
    disable_signin boolean,
    ip_restriction character varying(255),
    nav_items text,
    user_nav_items text,
    widget_items text,
    mfa_items character varying(300),
    mfa_remember_in_hours integer,
    account_menu character varying(20),
    account_items text,
    dcr_policy character varying(100),
    ldap_attributes text,
    kerberos_realm character varying(200),
    kerberos_kdc_host character varying(200),
    kerberos_keytab text,
    kerberos_service_name character varying(100),
    org_balance double precision,
    user_balance double precision,
    balance_credit double precision,
    balance_currency character varying(100)
);


ALTER TABLE public.organization OWNER TO casdoor;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.payment (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    provider character varying(100),
    type character varying(100),
    products character varying(1000),
    products_display_name character varying(1000),
    product_name character varying(1000),
    product_display_name character varying(1000),
    detail character varying(255),
    currency character varying(100),
    price double precision,
    "user" character varying(100),
    person_name character varying(100),
    person_id_card character varying(100),
    person_email character varying(100),
    person_phone character varying(100),
    invoice_type character varying(100),
    invoice_title character varying(100),
    invoice_tax_id character varying(100),
    invoice_remark character varying(100),
    invoice_url character varying(255),
    "order" character varying(100),
    out_order_id character varying(100),
    pay_url character varying(2000),
    success_url character varying(2000),
    state character varying(100),
    message character varying(2000)
);


ALTER TABLE public.payment OWNER TO casdoor;

--
-- Name: permission; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.permission (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description text,
    users text,
    groups text,
    roles text,
    domains text,
    model character varying(100),
    adapter character varying(100),
    resource_type character varying(100),
    resources text,
    actions text,
    effect character varying(100),
    is_enabled boolean,
    submitter character varying(100),
    approver character varying(100),
    approve_time character varying(100),
    state character varying(100)
);


ALTER TABLE public.permission OWNER TO casdoor;

--
-- Name: permission_rule; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.permission_rule (
    id bigint NOT NULL,
    ptype character varying(100) DEFAULT ''::character varying NOT NULL,
    v0 character varying(100) DEFAULT ''::character varying NOT NULL,
    v1 character varying(100) DEFAULT ''::character varying NOT NULL,
    v2 character varying(100) DEFAULT ''::character varying NOT NULL,
    v3 character varying(100) DEFAULT ''::character varying NOT NULL,
    v4 character varying(100) DEFAULT ''::character varying NOT NULL,
    v5 character varying(100) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.permission_rule OWNER TO casdoor;

--
-- Name: permission_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: casdoor
--

CREATE SEQUENCE public.permission_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permission_rule_id_seq OWNER TO casdoor;

--
-- Name: permission_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: casdoor
--

ALTER SEQUENCE public.permission_rule_id_seq OWNED BY public.permission_rule.id;


--
-- Name: plan; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.plan (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description text,
    price double precision,
    currency character varying(100),
    period character varying(100),
    product character varying(100),
    payment_providers character varying(100),
    is_enabled boolean,
    is_exclusive boolean,
    role character varying(100)
);


ALTER TABLE public.plan OWNER TO casdoor;

--
-- Name: pricing; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.pricing (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description text,
    plans text,
    is_enabled boolean,
    trial_duration integer,
    application character varying(100)
);


ALTER TABLE public.pricing OWNER TO casdoor;

--
-- Name: product; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.product (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    image character varying(100),
    detail character varying(1000),
    description text,
    tag character varying(100),
    currency character varying(100),
    price double precision,
    quantity integer,
    sold integer,
    is_recharge boolean,
    recharge_options character varying(500),
    disable_custom_recharge boolean,
    providers character varying(255),
    success_url character varying(1000),
    state character varying(100)
);


ALTER TABLE public.product OWNER TO casdoor;

--
-- Name: provider; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.provider (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    category character varying(100),
    type character varying(100),
    sub_type character varying(100),
    method character varying(100),
    client_id character varying(200),
    client_secret character varying(3000),
    client_id2 character varying(100),
    client_secret2 character varying(500),
    cert character varying(100),
    custom_auth_url character varying(200),
    custom_token_url character varying(200),
    custom_user_info_url character varying(200),
    custom_logout_url character varying(200),
    custom_logo character varying(200),
    scopes character varying(100),
    user_mapping character varying(500),
    http_headers character varying(500),
    host character varying(100),
    port integer,
    disable_ssl boolean,
    ssl_mode character varying(100),
    title character varying(100),
    content character varying(2000),
    receiver character varying(100),
    region_id character varying(100),
    sign_name character varying(100),
    template_code character varying(100),
    app_id character varying(100),
    endpoint character varying(1000),
    intranet_endpoint character varying(100),
    domain character varying(100),
    bucket character varying(100),
    path_prefix character varying(100),
    metadata text,
    id_p text,
    issuer_url character varying(100),
    enable_sign_authn_request boolean,
    email_regex character varying(200),
    provider_url character varying(200),
    enable_proxy boolean,
    enable_pkce boolean,
    state character varying(100)
);


ALTER TABLE public.provider OWNER TO casdoor;

--
-- Name: radius_accounting; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.radius_accounting (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time timestamp without time zone,
    username character varying(255),
    service_type bigint,
    nas_id character varying(255),
    nas_ip_addr character varying(255),
    nas_port_id character varying(255),
    nas_port_type bigint,
    nas_port bigint,
    framed_ip_addr character varying(255),
    framed_ip_netmask character varying(255),
    acct_session_id character varying(255),
    acct_session_time bigint,
    acct_input_total bigint,
    acct_output_total bigint,
    acct_input_packets bigint,
    acct_output_packets bigint,
    acct_terminate_cause bigint,
    last_update timestamp without time zone,
    acct_start_time timestamp without time zone,
    acct_stop_time timestamp without time zone
);


ALTER TABLE public.radius_accounting OWNER TO casdoor;

--
-- Name: record; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.record (
    id integer NOT NULL,
    owner character varying(100),
    name character varying(100),
    created_time character varying(100),
    organization character varying(100),
    client_ip character varying(100),
    "user" character varying(100),
    method character varying(100),
    request_uri character varying(1000),
    action character varying(1000),
    language character varying(100),
    object text,
    response text,
    status_code integer,
    detail character varying(100),
    is_triggered boolean
);


ALTER TABLE public.record OWNER TO casdoor;

--
-- Name: record_id_seq; Type: SEQUENCE; Schema: public; Owner: casdoor
--

CREATE SEQUENCE public.record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.record_id_seq OWNER TO casdoor;

--
-- Name: record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: casdoor
--

ALTER SEQUENCE public.record_id_seq OWNED BY public.record.id;


--
-- Name: resource; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.resource (
    owner character varying(100) NOT NULL,
    name character varying(180) NOT NULL,
    created_time character varying(100),
    "user" character varying(100),
    provider character varying(100),
    application character varying(100),
    tag character varying(100),
    parent character varying(100),
    file_name character varying(255),
    file_type character varying(100),
    file_format character varying(100),
    file_size integer,
    url character varying(500),
    description text
);


ALTER TABLE public.resource OWNER TO casdoor;

--
-- Name: role; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.role (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    description text,
    users text,
    groups text,
    roles text,
    domains text,
    is_enabled boolean
);


ALTER TABLE public.role OWNER TO casdoor;

--
-- Name: rule; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.rule (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100) NOT NULL,
    updated_time character varying(100) NOT NULL,
    type character varying(100) NOT NULL,
    expressions text,
    action character varying(100) NOT NULL,
    status_code integer NOT NULL,
    reason character varying(100) NOT NULL,
    is_verbose boolean
);


ALTER TABLE public.rule OWNER TO casdoor;

--
-- Name: server; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.server (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    url character varying(500),
    token character varying(500),
    application character varying(100),
    tools text
);


ALTER TABLE public.server OWNER TO casdoor;

--
-- Name: session; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.session (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    application character varying(100) NOT NULL,
    created_time character varying(100),
    session_id text
);


ALTER TABLE public.session OWNER TO casdoor;

--
-- Name: site; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.site (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    tag character varying(100),
    domain character varying(100),
    other_domains character varying(500),
    need_redirect boolean,
    disable_verbose boolean,
    rules character varying(500),
    enable_alert boolean,
    alert_interval integer,
    alert_try_times integer,
    alert_providers character varying(500),
    challenges text,
    host character varying(100),
    port integer,
    hosts character varying(1000),
    ssl_mode character varying(100),
    public_ip character varying(100),
    node character varying(100),
    is_self boolean,
    status character varying(100),
    nodes text,
    casdoor_application character varying(100)
);


ALTER TABLE public.site OWNER TO casdoor;

--
-- Name: subscription; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.subscription (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    display_name character varying(100),
    created_time character varying(100),
    description text,
    "user" character varying(100),
    pricing character varying(100),
    plan character varying(100),
    payment character varying(100),
    start_time character varying(100),
    end_time character varying(100),
    period character varying(100),
    state character varying(100)
);


ALTER TABLE public.subscription OWNER TO casdoor;

--
-- Name: syncer; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.syncer (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    organization character varying(100),
    type character varying(100),
    database_type character varying(100),
    ssl_mode character varying(100),
    ssh_type character varying(100),
    host character varying(100),
    port integer,
    "user" character varying(100),
    password character varying(150),
    ssh_host character varying(100),
    ssh_port integer,
    ssh_user character varying(100),
    ssh_password character varying(150),
    cert character varying(100),
    database character varying(100),
    "table" character varying(100),
    table_columns text,
    affiliation_table character varying(100),
    avatar_base_url character varying(100),
    error_text text,
    sync_interval integer,
    is_read_only boolean,
    is_enabled boolean
);


ALTER TABLE public.syncer OWNER TO casdoor;

--
-- Name: third_party_link; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.third_party_link (
    owner character varying(100) NOT NULL,
    user_name character varying(100) NOT NULL,
    provider_name character varying(100) NOT NULL,
    provider_id character varying(100) NOT NULL,
    created_time character varying(100)
);


ALTER TABLE public.third_party_link OWNER TO casdoor;

--
-- Name: ticket; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.ticket (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    display_name character varying(100),
    "user" character varying(100),
    title character varying(200),
    content text,
    state character varying(50),
    messages json
);


ALTER TABLE public.ticket OWNER TO casdoor;

--
-- Name: token; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.token (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    application character varying(100),
    organization character varying(100),
    "user" character varying(100),
    code character varying(100),
    access_token text,
    refresh_token text,
    access_token_hash character varying(100),
    refresh_token_hash character varying(100),
    expires_in integer,
    scope character varying(300),
    token_type character varying(100),
    grant_type character varying(100),
    code_challenge character varying(100),
    code_is_used boolean,
    code_expire_in bigint,
    resource character varying(255),
    dpop_jkt character varying(255)
);


ALTER TABLE public.token OWNER TO casdoor;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.transaction (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    display_name character varying(100),
    application character varying(100),
    domain character varying(1000),
    category character varying(100),
    type character varying(100),
    subtype character varying(100),
    provider character varying(100),
    "user" character varying(100),
    tag character varying(100),
    amount double precision,
    currency character varying(100),
    payment character varying(100),
    state character varying(100)
);


ALTER TABLE public.transaction OWNER TO casdoor;

--
-- Name: user; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public."user" (
    owner character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    deleted_time character varying(100),
    id character varying(100),
    external_id character varying(100),
    type character varying(100),
    password character varying(150),
    password_salt character varying(100),
    password_type character varying(100),
    display_name character varying(100),
    first_name character varying(100),
    last_name character varying(100),
    avatar text,
    avatar_type character varying(100),
    permanent_avatar character varying(500),
    email character varying(100),
    email_verified boolean,
    phone character varying(100),
    country_code character varying(6),
    region character varying(100),
    location character varying(100),
    address text,
    addresses bytea,
    affiliation character varying(100),
    title character varying(100),
    id_card_type character varying(100),
    id_card character varying(100),
    real_name character varying(100),
    is_verified boolean,
    homepage character varying(100),
    bio character varying(100),
    tag character varying(100),
    language character varying(100),
    gender character varying(100),
    birthday character varying(100),
    education character varying(100),
    score integer,
    karma integer,
    ranking integer,
    balance double precision,
    balance_credit double precision,
    currency character varying(100),
    balance_currency character varying(100),
    is_default_avatar boolean,
    is_online boolean,
    is_admin boolean,
    is_forbidden boolean,
    is_deleted boolean,
    signup_application character varying(100),
    hash character varying(100),
    pre_hash character varying(100),
    register_type character varying(100),
    register_source character varying(100),
    access_token text,
    original_token text,
    original_refresh_token text,
    created_ip character varying(100),
    last_signin_time character varying(100),
    last_signin_ip character varying(100),
    github character varying(100),
    google character varying(100),
    qq character varying(100),
    wechat character varying(100),
    facebook character varying(100),
    dingtalk character varying(100),
    weibo character varying(100),
    gitee character varying(100),
    linkedin character varying(100),
    wecom character varying(100),
    lark character varying(100),
    gitlab character varying(100),
    adfs character varying(100),
    baidu character varying(100),
    alipay character varying(100),
    casdoor character varying(100),
    infoflow character varying(100),
    apple character varying(100),
    azuread character varying(100),
    azureadb2c character varying(100),
    slack character varying(100),
    steam character varying(100),
    bilibili character varying(100),
    okta character varying(100),
    douyin character varying(100),
    kwai character varying(100),
    line character varying(100),
    amazon character varying(100),
    auth0 character varying(100),
    battlenet character varying(100),
    bitbucket character varying(100),
    box character varying(100),
    cloudfoundry character varying(100),
    dailymotion character varying(100),
    deezer character varying(100),
    digitalocean character varying(100),
    discord character varying(100),
    dropbox character varying(100),
    eveonline character varying(100),
    fitbit character varying(100),
    gitea character varying(100),
    heroku character varying(100),
    influxcloud character varying(100),
    instagram character varying(100),
    intercom character varying(100),
    kakao character varying(100),
    lastfm character varying(100),
    mailru character varying(100),
    meetup character varying(100),
    microsoftonline character varying(100),
    naver character varying(100),
    nextcloud character varying(100),
    onedrive character varying(100),
    oura character varying(100),
    patreon character varying(100),
    paypal character varying(100),
    salesforce character varying(100),
    shopify character varying(100),
    soundcloud character varying(100),
    spotify character varying(100),
    strava character varying(100),
    stripe character varying(100),
    telegram character varying(100),
    tiktok character varying(100),
    tumblr character varying(100),
    twitch character varying(100),
    twitter character varying(100),
    typetalk character varying(100),
    uber character varying(100),
    vk character varying(100),
    wepay character varying(100),
    xero character varying(100),
    yahoo character varying(100),
    yammer character varying(100),
    yandex character varying(100),
    zoom character varying(100),
    metamask character varying(100),
    web3onboard character varying(100),
    custom character varying(100),
    custom2 text,
    custom3 text,
    custom4 text,
    custom5 text,
    custom6 text,
    custom7 text,
    custom8 text,
    custom9 text,
    custom10 text,
    "webauthnCredentials" bytea,
    preferred_mfa_type character varying(100),
    recovery_codes text,
    totp_secret character varying(100),
    mfa_phone_enabled boolean,
    mfa_email_enabled boolean,
    mfa_radius_enabled boolean,
    mfa_radius_username character varying(100),
    mfa_radius_provider character varying(100),
    mfa_push_enabled boolean,
    mfa_push_receiver character varying(100),
    mfa_push_provider character varying(100),
    invitation character varying(100),
    invitation_code character varying(100),
    face_ids text,
    cart text,
    ldap character varying(100),
    properties text,
    roles text,
    permissions text,
    groups text,
    last_change_password_time character varying(100),
    last_signin_wrong_time character varying(100),
    signin_wrong_times integer,
    "managedAccounts" bytea,
    "mfaAccounts" bytea,
    mfa_items character varying(300),
    mfa_remember_deadline character varying(100),
    need_update_password boolean,
    ip_whitelist character varying(200),
    application_scopes text
);


ALTER TABLE public."user" OWNER TO casdoor;

--
-- Name: verification_record; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.verification_record (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    remote_addr character varying(100),
    type character varying(10),
    "user" character varying(100) NOT NULL,
    provider character varying(100) NOT NULL,
    receiver character varying(100) NOT NULL,
    code character varying(10) NOT NULL,
    "time" bigint NOT NULL,
    is_used boolean NOT NULL
);


ALTER TABLE public.verification_record OWNER TO casdoor;

--
-- Name: webhook; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.webhook (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    organization character varying(100),
    url character varying(200),
    method character varying(100),
    content_type character varying(100),
    headers text,
    events character varying(1000),
    token_fields character varying(1000),
    object_fields character varying(1000),
    is_user_extended boolean,
    single_org_only boolean,
    is_enabled boolean,
    max_retries integer DEFAULT 3,
    retry_interval integer DEFAULT 60,
    use_exponential_backoff boolean
);


ALTER TABLE public.webhook OWNER TO casdoor;

--
-- Name: webhook_event; Type: TABLE; Schema: public; Owner: casdoor
--

CREATE TABLE public.webhook_event (
    owner character varying(100) NOT NULL,
    name character varying(100) NOT NULL,
    created_time character varying(100),
    updated_time character varying(100),
    webhook character varying(200),
    organization character varying(100),
    event_type character varying(100),
    state character varying(50),
    payload text,
    extended_user text,
    attempt_count integer DEFAULT 0,
    max_retries integer DEFAULT 3,
    next_retry_time character varying(100),
    last_status_code integer,
    last_response text,
    last_error text
);


ALTER TABLE public.webhook_event OWNER TO casdoor;

--
-- Name: casbin_api_rule id; Type: DEFAULT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.casbin_api_rule ALTER COLUMN id SET DEFAULT nextval('public.casbin_api_rule_id_seq'::regclass);


--
-- Name: casbin_rule id; Type: DEFAULT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.casbin_rule ALTER COLUMN id SET DEFAULT nextval('public.casbin_rule_id_seq'::regclass);


--
-- Name: casbin_user_rule id; Type: DEFAULT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.casbin_user_rule ALTER COLUMN id SET DEFAULT nextval('public.casbin_user_rule_id_seq'::regclass);


--
-- Name: coupon_usage id; Type: DEFAULT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.coupon_usage ALTER COLUMN id SET DEFAULT nextval('public.coupon_usage_id_seq'::regclass);


--
-- Name: permission_rule id; Type: DEFAULT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.permission_rule ALTER COLUMN id SET DEFAULT nextval('public.permission_rule_id_seq'::regclass);


--
-- Name: record id; Type: DEFAULT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.record ALTER COLUMN id SET DEFAULT nextval('public.record_id_seq'::regclass);


--
-- Data for Name: adapter; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.adapter (owner, name, created_time, "table", use_same_db, type, database_type, host, port, "user", password, database) FROM stdin;
built-in	api-adapter-built-in	2026-07-14T05:13:42Z	casbin_api_rule	t				0			
built-in	user-adapter-built-in	2026-07-14T05:13:42Z	casbin_user_rule	t				0			
\.


--
-- Data for Name: agent; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.agent (owner, name, created_time, updated_time, display_name, url, token, application) FROM stdin;
\.


--
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.application (owner, name, created_time, display_name, category, type, scopes, logo, title, favicon, "order", homepage_url, description, organization, cert, default_group, default_tag, header_html, page_html, enable_password, enable_sign_up, enable_guest_signin, disable_signin, enable_signin_session, enable_auto_signin, enable_code_signin, enable_exclusive_signin, enable_saml_compress, enable_saml_c14n10, enable_saml_post_binding, disable_saml_attributes, enable_saml_assertion_signature, use_email_as_saml_name_id, enable_web_authn, enable_link_with_email, org_choice_mode, saml_reply_url, providers, signin_methods, signup_items, signin_items, grant_types, tags, saml_attributes, saml_hash_algorithm, saml_c14n_prefix, is_shared, ip_restriction, client_id, client_secret, client_cert, redirect_uris, backchannel_logout_uri, forced_redirect_origin, token_format, token_signing_method, token_fields, token_attributes, expire_in_hours, refresh_expire_in_hours, cookie_expire_in_hours, signup_url, signin_url, forget_url, affiliation_url, ip_whitelist, terms_of_use, signup_html, signin_html, theme_data, footer_html, form_css, form_css_mobile, form_offset, form_side_html, form_background_url, form_background_url_mobile, failed_signin_limit, failed_signin_frozen_time, code_resend_timeout, custom_scopes, domain, other_domains, upstream_host, ssl_mode, ssl_cert, registration_access_token) FROM stdin;
admin	app-built-in	2026-07-14T05:13:41Z	Casdoor	Default	All	[]	https://cdn.casbin.org/img/casdoor-logo_1185x256.png			0	https://casdoor.org		built-in	cert-built-in					t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f			[{"owner":"","name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"bindingRule":null,"countryCodes":null,"prompted":false,"signupGroup":"","rule":"None","provider":null}]	[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}]	[{"name":"ID","visible":false,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Random"},{"name":"Username","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Display name","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Confirm password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Email","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Normal"},{"name":"Phone","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Agreement","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Languages","visible":true,"required":false,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"}]	[{"name":"Back button","visible":true,"label":"","customCss":".back-button {\\n      top: 65px;\\n      left: 15px;\\n      position: absolute;\\n}\\n.back-inner-button{}","placeholder":"","rule":"None","isCustom":false},{"name":"Languages","visible":true,"label":"","customCss":".login-languages {\\n    top: 55px;\\n    right: 5px;\\n    position: absolute;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Logo","visible":true,"label":"","customCss":".login-logo-box {}","placeholder":"","rule":"None","isCustom":false},{"name":"Signin methods","visible":true,"label":"","customCss":".signin-methods {}","placeholder":"","rule":"None","isCustom":false},{"name":"Username","visible":true,"label":"","customCss":".login-username {}\\n.login-username-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Password","visible":true,"label":"","customCss":".login-password {}\\n.login-password-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Verification code","visible":true,"label":"","customCss":".verification-code {}\\n.verification-code-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Agreement","visible":true,"label":"","customCss":".login-agreement {}","placeholder":"","rule":"None","isCustom":false},{"name":"Forgot password?","visible":true,"label":"","customCss":".login-forget-password {\\n    display: inline-flex;\\n    justify-content: space-between;\\n    width: 320px;\\n    margin-bottom: 25px;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Login button","visible":true,"label":"","customCss":".login-button-box {\\n    margin-bottom: 5px;\\n}\\n.login-button {\\n    width: 100%;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Signup link","visible":true,"label":"","customCss":".login-signup-link {\\n    margin-bottom: 24px;\\n    display: flex;\\n    justify-content: end;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Providers","visible":true,"label":"","customCss":".provider-img {\\n      width: 30px;\\n      margin: 5px;\\n}\\n.provider-big-img {\\n      margin-bottom: 10px;\\n}","placeholder":"","rule":"None","isCustom":false}]	null	[]	null			f		3d8bc0cee1cb336c9a73	6953e661edcfde6df24ab36d2d63571d7defd0fb		[]			JWT		[]	null	168	0	720									\N				2				0	0	0	null		null				
admin	postman	2026-07-14T02:15:24-03:00	Postman	Default	OIDC	[]	https://cdn.casbin.org/img/casdoor-logo_1185x256.png			0			my-drive	cert-built-in					t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f			[{"owner":"","name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"bindingRule":null,"countryCodes":null,"prompted":false,"signupGroup":"","rule":"","provider":null}]	[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}]	[{"name":"ID","visible":false,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Random"},{"name":"Username","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Display name","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Confirm password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Email","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Normal"},{"name":"Phone","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Agreement","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Signup button","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Providers","visible":true,"required":true,"prompted":false,"type":"","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n ","label":"","placeholder":"","options":null,"regex":"","rule":"None"}]	[{"name":"Back button","visible":true,"label":"","customCss":".back-button {\\n      top: 65px;\\n      left: 15px;\\n      position: absolute;\\n}\\n.back-inner-button{}","placeholder":"","rule":"None","isCustom":false},{"name":"Languages","visible":true,"label":"","customCss":".login-languages {\\n    top: 55px;\\n    right: 5px;\\n    position: absolute;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Logo","visible":true,"label":"","customCss":".login-logo-box {}","placeholder":"","rule":"None","isCustom":false},{"name":"Signin methods","visible":true,"label":"","customCss":".signin-methods {}","placeholder":"","rule":"None","isCustom":false},{"name":"Username","visible":true,"label":"","customCss":".login-username {}\\n.login-username-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Password","visible":true,"label":"","customCss":".login-password {}\\n.login-password-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Verification code","visible":true,"label":"","customCss":".verification-code {}\\n.verification-code-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Agreement","visible":true,"label":"","customCss":".login-agreement {}","placeholder":"","rule":"None","isCustom":false},{"name":"Forgot password?","visible":true,"label":"","customCss":".login-forget-password {\\n    display: inline-flex;\\n    justify-content: space-between;\\n    width: 320px;\\n    margin-bottom: 25px;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Login button","visible":true,"label":"","customCss":".login-button-box {\\n    margin-bottom: 5px;\\n}\\n.login-button {\\n    width: 100%;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Signup link","visible":true,"label":"","customCss":".login-signup-link {\\n    margin-bottom: 24px;\\n    display: flex;\\n    justify-content: end;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Providers","visible":true,"label":"","customCss":".provider-img {\\n      width: 30px;\\n      margin: 5px;\\n}\\n.provider-big-img {\\n      margin-bottom: 10px;\\n}","placeholder":"","rule":"None","isCustom":false}]	["authorization_code","password","client_credentials","token","id_token","refresh_token"]	[]	null			f		postman			["https://oauth.pstmn.io/v1/browser-callback","https://oauth.pstmn.io/v1/callback"]			JWT		[]	null	168	168	720									\N				2				5	15	0	[]		null				
admin	react-frontend	2026-07-14T13:52:28-03:00	React Frontend	Default	OIDC	[]	https://cdn.casbin.org/img/casdoor-logo_1185x256.png			0			my-drive	cert-built-in					t	t	f	f	f	f	f	f	f	f	f	f	f	f	f	f			[{"owner":"","name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"bindingRule":null,"countryCodes":null,"prompted":false,"signupGroup":"","rule":"","provider":null}]	[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}]	[{"name":"ID","visible":false,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Random"},{"name":"Username","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Display name","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Confirm password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Email","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Normal"},{"name":"Phone","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Agreement","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Signup button","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Providers","visible":true,"required":true,"prompted":false,"type":"","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n ","label":"","placeholder":"","options":null,"regex":"","rule":"None"}]	[{"name":"Back button","visible":true,"label":"","customCss":".back-button {\\n      top: 65px;\\n      left: 15px;\\n      position: absolute;\\n}\\n.back-inner-button{}","placeholder":"","rule":"None","isCustom":false},{"name":"Languages","visible":true,"label":"","customCss":".login-languages {\\n    top: 55px;\\n    right: 5px;\\n    position: absolute;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Logo","visible":true,"label":"","customCss":".login-logo-box {}","placeholder":"","rule":"None","isCustom":false},{"name":"Signin methods","visible":true,"label":"","customCss":".signin-methods {}","placeholder":"","rule":"None","isCustom":false},{"name":"Username","visible":true,"label":"","customCss":".login-username {}\\n.login-username-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Password","visible":true,"label":"","customCss":".login-password {}\\n.login-password-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Verification code","visible":true,"label":"","customCss":".verification-code {}\\n.verification-code-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Agreement","visible":true,"label":"","customCss":".login-agreement {}","placeholder":"","rule":"None","isCustom":false},{"name":"Forgot password?","visible":true,"label":"","customCss":".login-forget-password {\\n    display: inline-flex;\\n    justify-content: space-between;\\n    width: 320px;\\n    margin-bottom: 25px;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Login button","visible":true,"label":"","customCss":".login-button-box {\\n    margin-bottom: 5px;\\n}\\n.login-button {\\n    width: 100%;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Signup link","visible":true,"label":"","customCss":".login-signup-link {\\n    margin-bottom: 24px;\\n    display: flex;\\n    justify-content: end;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Providers","visible":true,"label":"","customCss":".provider-img {\\n      width: 30px;\\n      margin: 5px;\\n}\\n.provider-big-img {\\n      margin-bottom: 10px;\\n}","placeholder":"","rule":"None","isCustom":false}]	["authorization_code","password","client_credentials","token","id_token","refresh_token"]	[]	null			f		f3f23d070d9db967220e			["http://localhost:5173/*"]			JWT		[]	null	168	168	720									\N				2				5	15	0	[]		null				
\.


--
-- Data for Name: casbin_api_rule; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.casbin_api_rule (id, ptype, v0, v1, v2, v3, v4, v5) FROM stdin;
1	p	built-in	*	*	*	*	*
2	p	app	*	*	*	*	*
3	p	app-dcr	*	*	/api/login/oauth/*	*	*
4	p	app-dcr	*	*	/api/get-oauth-token	*	*
5	p	app-dcr	*	*	/api/userinfo	*	*
6	p	app-dcr	*	*	/api/get-application	*	*
7	p	*	*	POST	/api/signup	*	*
8	p	*	*	GET	/api/get-email-and-phone	*	*
9	p	*	*	POST	/api/login	*	*
10	p	*	*	GET	/api/get-app-login	*	*
11	p	*	*	POST	/api/logout	*	*
12	p	*	*	GET	/api/logout	*	*
13	p	*	*	POST	/api/sso-logout	*	*
14	p	*	*	GET	/api/sso-logout	*	*
15	p	*	*	POST	/api/callback	*	*
16	p	*	*	POST	/api/device-auth	*	*
17	p	*	*	POST	/api/cancel-device-auth	*	*
18	p	*	*	POST	/api/device-auth-complete	*	*
19	p	*	*	GET	/api/get-account	*	*
20	p	*	*	GET	/api/userinfo	*	*
21	p	*	*	GET	/api/user	*	*
22	p	*	*	GET	/api/health	*	*
23	p	*	*	*	/api/webhook	*	*
24	p	*	*	GET	/api/get-qrcode	*	*
25	p	*	*	GET	/api/get-webhook-event	*	*
26	p	*	*	GET	/api/get-captcha-status	*	*
27	p	*	*	*	/api/login/oauth	*	*
28	p	*	*	*	/api/oauth/register	*	*
29	p	*	*	GET	/api/get-application	*	*
30	p	*	*	GET	/api/get-organization-applications	*	*
31	p	*	*	GET	/api/get-user	*	*
32	p	*	*	GET	/api/get-user-application	*	*
33	p	*	*	POST	/api/upload-users	*	*
34	p	*	*	GET	/api/get-resources	*	*
35	p	*	*	GET	/api/get-records	*	*
36	p	*	*	GET	/api/get-product	*	*
37	p	*	*	GET	/api/get-products	*	*
38	p	*	*	POST	/api/buy-product	*	*
39	p	*	*	GET	/api/get-order	*	*
40	p	*	*	GET	/api/get-orders	*	*
41	p	*	*	GET	/api/get-user-orders	*	*
42	p	*	*	GET	/api/get-payment	*	*
43	p	*	*	POST	/api/invoice-payment	*	*
44	p	*	*	POST	/api/notify-payment	*	*
45	p	*	*	POST	/api/place-order	*	*
46	p	*	*	POST	/api/cancel-order	*	*
47	p	*	*	POST	/api/pay-order	*	*
48	p	*	*	POST	/api/validate-coupon	*	*
49	p	*	*	POST	/api/unlink	*	*
50	p	*	*	POST	/api/set-password	*	*
51	p	*	*	POST	/api/send-verification-code	*	*
52	p	*	*	GET	/api/get-captcha	*	*
53	p	*	*	POST	/api/verify-captcha	*	*
54	p	*	*	POST	/api/verify-code	*	*
55	p	*	*	POST	/api/v1/traces	*	*
56	p	*	*	POST	/api/v1/metrics	*	*
57	p	*	*	POST	/api/v1/logs	*	*
58	p	*	*	POST	/api/reset-email-or-phone	*	*
59	p	*	*	POST	/api/upload-resource	*	*
60	p	*	*	GET	/.well-known/openid-configuration	*	*
61	p	*	*	GET	/.well-known/oauth-authorization-server	*	*
62	p	*	*	GET	/.well-known/oauth-protected-resource	*	*
63	p	*	*	GET	/.well-known/webfinger	*	*
64	p	*	*	*	/.well-known/jwks	*	*
65	p	*	*	GET	/.well-known/:application/openid-configuration	*	*
66	p	*	*	GET	/.well-known/:application/oauth-authorization-server	*	*
67	p	*	*	GET	/.well-known/:application/oauth-protected-resource	*	*
68	p	*	*	GET	/.well-known/:application/webfinger	*	*
69	p	*	*	*	/.well-known/:application/jwks	*	*
70	p	*	*	GET	/api/get-saml-login	*	*
71	p	*	*	POST	/api/acs	*	*
72	p	*	*	GET	/api/saml/metadata	*	*
73	p	*	*	*	/api/saml/redirect	*	*
74	p	*	*	*	/cas	*	*
75	p	*	*	*	/scim	*	*
76	p	*	*	*	/api/webauthn	*	*
77	p	*	*	GET	/api/get-release	*	*
78	p	*	*	GET	/api/get-default-application	*	*
79	p	*	*	GET	/api/get-prometheus-info	*	*
80	p	*	*	*	/api/metrics	*	*
81	p	*	*	GET	/api/get-pricing	*	*
82	p	*	*	GET	/api/get-plan	*	*
83	p	*	*	GET	/api/get-subscription	*	*
84	p	*	*	GET	/api/get-transactions	*	*
85	p	*	*	GET	/api/get-transaction	*	*
86	p	*	*	GET	/api/get-provider	*	*
87	p	*	*	GET	/api/get-organization-names	*	*
88	p	*	*	GET	/api/get-organizations	*	*
89	p	*	*	GET	/api/get-all-objects	*	*
90	p	*	*	GET	/api/get-all-actions	*	*
91	p	*	*	GET	/api/get-all-roles	*	*
92	p	*	*	GET	/api/run-casbin-command	*	*
93	p	*	*	POST	/api/refresh-engines	*	*
94	p	*	*	GET	/api/get-invitation-info	*	*
95	p	*	*	GET	/api/faceid-signin-begin	*	*
96	p	*	*	GET	/api/kerberos-login	*	*
97	p	*	*	POST	/api/grant-consent	*	*
98	p	*	*	POST	/api/revoke-consent	*	*
\.


--
-- Data for Name: casbin_rule; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.casbin_rule (id, ptype, v0, v1, v2, v3, v4, v5) FROM stdin;
\.


--
-- Data for Name: casbin_user_rule; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.casbin_user_rule (id, ptype, v0, v1, v2, v3, v4, v5) FROM stdin;
\.


--
-- Data for Name: cert; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.cert (owner, name, created_time, display_name, scope, type, crypto_algorithm, bit_size, expire_in_years, expire_time, domain_expire_time, provider, account, access_key, access_secret, certificate, private_key) FROM stdin;
admin	cert-built-in	2026-07-14T05:13:41Z	Built-in Cert	JWT	x509	RS256	4096	20							-----BEGIN CERTIFICATE-----\nMIIE3TCCAsWgAwIBAgIDAeJAMA0GCSqGSIb3DQEBCwUAMCgxDjAMBgNVBAoTBWFk\nbWluMRYwFAYDVQQDEw1jZXJ0LWJ1aWx0LWluMB4XDTI2MDcxNDA1MTM0MloXDTQ2\nMDcxNDA1MTM0MlowKDEOMAwGA1UEChMFYWRtaW4xFjAUBgNVBAMTDWNlcnQtYnVp\nbHQtaW4wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDJdddg6ukfNBS6\nZHHRGHYUR5lWVWtjbJjhDdjocZR+Z24KMyCtYiKbzR8x5svFpkq6rLH/C237uB6s\nseQU9QUaxShrlVeoPgVlFil8VICylgbQfgGS1d81y0PLA2OgVkP9/eP0Ttg1cph6\nuFdNPsJpfshWE0Nqc1TB5MVPXqM8xYhUVS2x72bqOPAagbirZe7rDXiljDtNwakW\nedCQ4t2+qKXeZGWiz5utJGV9tv+Q7Uaitn96qN/B4qIIrId32IZm+9yEPwO/AeOS\nqph51RGyoYXGwTQLQIT3Kq+FGMWo1bDSnByqH8+jMib3cDvsYjDLT7Egcs3uWReR\nQ7LLIGsa1cff1tufc+BChxg8rf0q6+nD5nT4zmpYiStl7ziDOVhCFbqpyPaFuTga\nv9XCvz7oF8rv1sRVFyRAYWJVl8Nou8Ul/sHHoNBMIkucx/UBz17Al/kOeEG6ogg+\nPzsER/Ecq3gg9qCsfDSSWqngWXUbmy+7V+PmDNVqBd6aA0TA3kKAxvOLbBkn09q3\nU8SCb83Bm5mH+FNUT7iJr2o5EBLmiRJfqilZ8ohnhkgXLUXrYwDSRe8cwZpcjBfz\nRG/N7BEAFHaniQO2jHStewXPmFYzPHGNRMGQKfZdDF8EK0FR8U0/oSeSncUZbecl\n/9zOPV189R6QamD8Aqen8IqUguiBVwIDAQABoxAwDjAMBgNVHRMBAf8EAjAAMA0G\nCSqGSIb3DQEBCwUAA4ICAQC/2Thk7V8ugs4cdt6GvuQgztcBOeTazsMX6dw5lixC\nz8+BO1YhsshWpfU9aj7U9NcAvpEI5fP602HZwhPrDcsbHqbErCmsAkfV+iWERn76\noBaAm58B4UVVJMYdfDHr3rbXnA1Fck7WA40+ax1f9Sp70GgrZjqBllXUeLZyTlne\nxJun3asENWLtylHsTaZiDZyLyUh5snYZxClYPgbs4VjeN+Cx1Oi4MIpsUi6nC4iU\nnAmSGcqQW2sMI8Q4gkQ1p0bA7XK9b5LxZRQSXHLZmCjQ4CBJrkydU4VV5mKX9kmO\nYO3u+sVQQIY/mPm+2PGGPFA2QVoyR55d5eHQWbJSOB43G+leK/pgyeV/nY4DTMfY\n3oXta9i06EZF52wIK/O7YuWITH6oJ/fq1Bf1xfH1iJC4mIU+W8NBi7ZtYG2y/GsT\n6OJmtXPnG+7hO2im6UWJmStPrPBkRlP9W7RCcdvPxxr/MaqOLa/5/IDFN1tY7ZQv\nY3Fk8ixXQVhoOlgHu6pR/asf60zDwZWq/MoIcfIJCKYrAj0qkSqKaj8azLX8IGNy\nIs55YlxgQvcWkbbSE6nnnbWwwVfzyxmtvFGBwZxViMixTIb7MvgOLGzrnSWMQ2eK\nD+jCmLGlhimi+Botib5ZJriMX/7DzhH3A1Qz6Fxd/dmsb+rRbhBtp7QXEXer+6Um\n6g==\n-----END CERTIFICATE-----\n	-----BEGIN RSA PRIVATE KEY-----\nMIIJKAIBAAKCAgEAyXXXYOrpHzQUumRx0Rh2FEeZVlVrY2yY4Q3Y6HGUfmduCjMg\nrWIim80fMebLxaZKuqyx/wtt+7gerLHkFPUFGsUoa5VXqD4FZRYpfFSAspYG0H4B\nktXfNctDywNjoFZD/f3j9E7YNXKYerhXTT7CaX7IVhNDanNUweTFT16jPMWIVFUt\nse9m6jjwGoG4q2Xu6w14pYw7TcGpFnnQkOLdvqil3mRlos+brSRlfbb/kO1GorZ/\neqjfweKiCKyHd9iGZvvchD8DvwHjkqqYedURsqGFxsE0C0CE9yqvhRjFqNWw0pwc\nqh/PozIm93A77GIwy0+xIHLN7lkXkUOyyyBrGtXH39bbn3PgQocYPK39Kuvpw+Z0\n+M5qWIkrZe84gzlYQhW6qcj2hbk4Gr/Vwr8+6BfK79bEVRckQGFiVZfDaLvFJf7B\nx6DQTCJLnMf1Ac9ewJf5DnhBuqIIPj87BEfxHKt4IPagrHw0klqp4Fl1G5svu1fj\n5gzVagXemgNEwN5CgMbzi2wZJ9Pat1PEgm/NwZuZh/hTVE+4ia9qORAS5okSX6op\nWfKIZ4ZIFy1F62MA0kXvHMGaXIwX80RvzewRABR2p4kDtox0rXsFz5hWMzxxjUTB\nkCn2XQxfBCtBUfFNP6Enkp3FGW3nJf/czj1dfPUekGpg/AKnp/CKlILogVcCAwEA\nAQKCAgA8SrGmFjeleIM5k0UC1GTGRfVMgqzsaPxJ4kiHrDJKMC8dC1ccvLFp2lYb\nK5zRbqaPvo5Yq3WDb4NyoJyHbxrTe6zQobXFqqYXri3FQU7w43hvnj5fUPWH1mjY\nEZAX1KltkrXNkGkhecXLeG7cNcueIezX4dT7vz9e9dXdHpAQ6HcX8hQGXAT7VQX6\nkNcRKKT7oKD6PoEjELHHgbZbHiJJ5JQbfgVy19oZ07oyCPnsSC6rFJ4LOg4ZKvfe\nS7ARPHJg0MCarXc0C18trjOKxqsQwElWhczLD0ib5iD4XsUM9cMBDOqBOZr9Fs3V\noLe2U16SAiwa73DVA8HLXizcoLucmKsRdg1qm++lxaQx0Mw0RJh1FZsJGycoITjs\ntm/Ggy+vAFZevvcdNOVr9rLwqzoJb66XAoWLsZ0k5rtt26lqMHdFy8tZO/Tn9+9e\nTFYaM52coMhhnL1rkWGxftrjHMN285iWaZyLI84KO9nBWu/Qf5t0t8YnYGv38v/l\ndZrrz9i05TANcec4cTtoOQJ/+ztSmHSApHIzeZN93AuyWCPO0UNu0ino5/wy4mIa\nwp9RYfjrNWTzioJHaDrXn+3gcWN9BS+nhoP54uQDdlEntJ6tEWUErEkbebzwGLPy\nF16zBonDWejMbyWleI30PHd7hW4Hy0+pcNfeEouZBVH8JnTGYQKCAQEA1VzfsZPj\nLqxal7nazgc8iPoMpoG5L7m5Rt86m2oL7+1+DLSKPNbBFGw40ypZ15qe0s8IPBro\nA3kvQ6gYpix/MJA5rykjos9qQ9F9e+2gV8yGBypWEsknyoiE5FT9Rw5l1w04ZK2E\nvxQA5FA2PtQysgrNnBl9fBzxwFfzEqa40w31MVdZlGjp6su4SAfj0BMeSE7kgrlL\nVFrhj3mnLfBQ6MVo4XV+hvzakMZon95TNBOHZd04necUdgBPQcdUay8e4kcZXwdf\nL2KoNxm0wYSJtvdIP+5AkcmmVFgkHXiyOsN2t23cbujCXHVJhVgYBC+WefweXcvm\nQcbt8tMonbwBYQKCAQEA8bgQ2Cml3jr26/gRANhzrbJXhHJeNJC4AEWoMy0TZFqz\n2acLC2DxNeB5aDrUV5aL7k9vvnhLbr+zxlGi4xJlF1yz7/ybdxFPPF0oA2Gi7X56\nQWJwuZebmI0VqOt4du3TShOTa9gqnLxaR2UdeF+/U8tuh65o0Z/1myg9QzGe4owc\nCpkWJx2byF1cy2tD4byccyGWhM2V/p9w2sZzpLjrsRHKZF+hUBuizQTIe/PrQco9\nBChAICcHp2FKMBl02MvrpF72/aWx/lUBrZx5DZggIEn+uoWdNH1GOEViknMHWD0U\nChYkobt8cMrVo+d4wUfiZ3woILRzWiXjs1hDuKCltwKCAQEAlWwyeMGSQ9iOpV2S\nn+EvgtpjS6Tj1UmjOMAS4k6VR5UyRqGVgl//3lagQTqSqsztV8OIB9fsDqqq8B3k\nDVRySsdmroYIH/hUemRXFhhnx7VDU/dRSly30j5jmyjuK/ooVkA68z8WDV9r9Hk8\nVCn1yvyH3D95wxbeM48kezZpj91hjwmWgborv7SmPUPRRqJs/cTKgcZUvCHdf8Z5\nz1FSyIGgHu1TDCQ+yU86bGOeL4VRuIQCJ4typ+U1nGKFe38HiP60BPo7rgrQta36\nCeDRNWLepW8spyzqoH0N5dnmMAM9u95jlwTJQUkekRUN1LijEJEBjzzB5+TyNbGt\n6zGEYQKCAQBXEq8+rwIJI8R/DEVTwKUrFOth0rEMznT55B3LEZnCtMnExd+8oZdC\niTIy0b5cLucJWaQvQLYrlvLzpcS/d4ji+Yn4EU8PfTTF0ejwDuPaGY2AsC1bLbnn\nIiuDRg+HB/Ts4lBgsOXowBDlVw9epV8OmGGgjrtDiBO5aK1o3x8VDNOtHahVPt03\nOCqNPH6feooBD0BhZo15w4WryYEu/U4p4va9YZWCffIPWIG/5QYCFRAVx0oSSvz+\n1pUa7pCg6BRiibL/fAi6TXTlTVBuDTbFauJP3oHavqXk71mq17T1nErztzZK7HbP\nSsHa4S8msPZlwNvTrC1BdBSqLkl24KfRAoIBACZ2pQrAw/g672EpYKp4fgkKZsVU\nhCVXD5Zjds9iaRiBoQeF02LX8mtMTQ8DVwXSfLdqTAwi7lr8A8ZFbtcC1fFqQtZs\n7xKL0zqfP+VnOoEB8ocvttUOKcUOe36Uya8KYS7t3pqKtj6eGNLgMIaTeW2pHTSN\nVmhOUHb8E+FbRhBRO3IlPABxeekGMeAAC9zpabY8YD/QauPjErp58DQzFAF4aaBv\nVDMyVrKLG+28O+PJ/3s1CZ0W5HkO3MLpGa0/gU4olXc1lC6bRTj6Q67i1XmnpR+H\n9YE6ZQqf80yFYScpqd3jBUaqp5UTq+58tW5+SdDVQOFLlDyPZ3ZFs2zDHGI=\n-----END RSA PRIVATE KEY-----\n
\.


--
-- Data for Name: coupon; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.coupon (owner, name, created_time, display_name, description, code, discount_type, discount, max_discount, scope, products, users, quantity, used_count, max_usage_per_user, start_time, expire_time, min_order_amount, currency, state) FROM stdin;
\.


--
-- Data for Name: coupon_usage; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.coupon_usage (id, owner, coupon_owner, coupon_name, "user", "order", created_time, amount) FROM stdin;
\.


--
-- Data for Name: enforcer; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.enforcer (owner, name, created_time, updated_time, display_name, description, model, adapter, enforcer) FROM stdin;
built-in	api-enforcer-built-in	2026-07-14T05:13:42Z	2026-07-14 05:13:42	API Enforcer		built-in/api-model-built-in	built-in/api-adapter-built-in	\N
built-in	user-enforcer-built-in	2026-07-14T05:13:42Z	2026-07-14 05:13:42	User Enforcer		built-in/user-model-built-in	built-in/user-adapter-built-in	\N
\.


--
-- Data for Name: entry; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.entry (owner, name, created_time, updated_time, display_name, provider, application, type, client_ip, user_agent, message) FROM stdin;
\.


--
-- Data for Name: form; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.form (owner, name, created_time, display_name, type, tag, form_items) FROM stdin;
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public."group" (owner, name, created_time, updated_time, display_name, manager, contact_email, type, parent_id, is_top_group, title, key, children, is_enabled, properties) FROM stdin;
\.


--
-- Data for Name: invitation; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.invitation (owner, name, created_time, updated_time, display_name, code, is_regexp, quota, used_count, application, username, email, phone, signup_group, default_code, state) FROM stdin;
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.key (owner, name, created_time, updated_time, display_name, type, organization, application, "user", access_key, access_secret, expire_time, state) FROM stdin;
\.


--
-- Data for Name: ldap; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.ldap (id, owner, created_time, server_name, host, port, enable_ssl, allow_self_signed_cert, username, password, base_dn, filter, filter_fields, default_group, default_groups, password_type, custom_attributes, auto_sync, last_sync, enable_groups) FROM stdin;
ldap-built-in	built-in	2026-07-14T05:13:42Z	BuildIn LDAP Server	example.com	389	f	f	cn=buildin,dc=example,dc=com	123	ou=BuildIn,dc=example,dc=com		null		null		null	0		f
\.


--
-- Data for Name: model; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.model (owner, name, created_time, display_name, description, model_text) FROM stdin;
built-in	api-model-built-in	2026-07-14T05:13:42Z	API Model		[request_definition]\nr = subOwner, subName, method, urlPath, objOwner, objName\n\n[policy_definition]\np = subOwner, subName, method, urlPath, objOwner, objName\n\n[role_definition]\ng = _, _\n\n[policy_effect]\ne = some(where (p.eft == allow))\n\n[matchers]\nm = (r.subOwner == p.subOwner || p.subOwner == "*") && \\\n    (r.subName == p.subName || p.subName == "*" || r.subName != "anonymous" && p.subName == "!anonymous") && \\\n    (r.method == p.method || p.method == "*") && \\\n    (keyMatch2(r.urlPath, p.urlPath) || p.urlPath == "*") && \\\n    (r.objOwner == p.objOwner || p.objOwner == "*") && \\\n    (r.objName == p.objName || p.objName == "*") || \\\n    (r.subOwner == r.objOwner && r.subName == r.objName)
built-in	user-model-built-in	2026-07-14T05:13:42Z	Built-in Model		[request_definition]\nr = sub, obj, act\n\n[policy_definition]\np = sub, obj, act\n\n[role_definition]\ng = _, _\n\n[policy_effect]\ne = some(where (p.eft == allow))\n\n[matchers]\nm = g(r.sub, p.sub) && r.obj == p.obj && r.act == p.act
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public."order" (owner, name, created_time, update_time, display_name, products, product_infos, "user", payment, price, currency, state, message, coupon_name, coupon_discount) FROM stdin;
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.organization (owner, name, created_time, display_name, website_url, logo, logo_dark, favicon, has_privilege_consent, password_type, password_salt, password_options, password_obfuscator_type, password_obfuscator_key, password_expire_days, country_codes, default_avatar, use_permanent_avatar, default_application, user_types, tags, languages, theme_data, master_password, default_password, master_verification_code, ip_whitelist, init_score, enable_soft_deletion, is_profile_public, use_email_as_username, enable_tour, disable_signin, ip_restriction, nav_items, user_nav_items, widget_items, mfa_items, mfa_remember_in_hours, account_menu, account_items, dcr_policy, ldap_attributes, kerberos_realm, kerberos_kdc_host, kerberos_keytab, kerberos_service_name, org_balance, user_balance, balance_credit, balance_currency) FROM stdin;
admin	built-in	2026-07-14T05:13:41Z	Built-in Organization	https://example.com			https://cdn.casbin.org/img/casbin/favicon.ico	f	bcrypt		["AtLeast6"]			0	["US","ES","FR","DE","GB","CN","JP","KR","VN","ID","SG","IN"]	https://cdn.casbin.org/img/casbin.svg	f		[]	[]	["en","es","fr","de","ja","zh","vi","pt","tr","pl","uk"]	\N					2000	f	f	f	t	f		null	null	null	null	0		[{"name":"Organization","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"ID","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Name","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Display name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"First name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Last name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Avatar","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"User type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Password","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Email","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Phone","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country code","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Country/Region","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Location","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Address","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Addresses","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Affiliation","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Title","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card type","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card info","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Real name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID verification","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Homepage","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Bio","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Tag","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Language","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Gender","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Birthday","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Education","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Balance","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Balance credit","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Balance currency","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Cart","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Transactions","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Score","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Karma","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Ranking","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Signup application","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register source","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Roles","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Permissions","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Groups","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Consents","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"3rd-party logins","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Properties","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is online","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is admin","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is forbidden","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is deleted","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Multi-factor authentication","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA items","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"WebAuthn credentials","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Last change password time","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Managed accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Face ID","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Need update password","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"IP whitelist","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""}]	disabled	null					0	0	0	
admin	my-drive	2026-07-14T02:14:28-03:00	My Drive	https://door.casdoor.com			https://cdn.casbin.org/img/favicon.png	f	bcrypt		["AtLeast6"]	Plain		0	["US"]	https://cdn.casbin.org/img/casbin.svg	f		null	[]	["en","es","fr","de","ja","zh","vi","pt","tr","pl","uk"]	\N					0	f	t	f	t	f		null	null	null	null	12		[{"name":"Organization","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"ID","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Name","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Display name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"First name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Last name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Avatar","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"User type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Password","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Email","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Phone","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country code","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country/Region","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Location","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Address","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Addresses","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Affiliation","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Title","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card type","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card info","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Real name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID verification","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Homepage","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Bio","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Tag","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Language","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Gender","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Birthday","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Education","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Score","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Karma","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Ranking","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance credit","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance currency","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Cart","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Transactions","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Signup application","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register source","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Groups","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Roles","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Permissions","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Consents","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"3rd-party logins","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Properties","visible":false,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is online","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is admin","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is forbidden","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is deleted","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Multi-factor authentication","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA items","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"WebAuthn credentials","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Last change password time","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Managed accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Face ID","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Need update password","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"IP whitelist","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""}]		null					0	0	0	USD
\.


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.payment (owner, name, created_time, display_name, provider, type, products, products_display_name, product_name, product_display_name, detail, currency, price, "user", person_name, person_id_card, person_email, person_phone, invoice_type, invoice_title, invoice_tax_id, invoice_remark, invoice_url, "order", out_order_id, pay_url, success_url, state, message) FROM stdin;
\.


--
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.permission (owner, name, created_time, display_name, description, users, groups, roles, domains, model, adapter, resource_type, resources, actions, effect, is_enabled, submitter, approver, approve_time, state) FROM stdin;
built-in	permission-built-in	2026-07-14T05:13:41Z	Built-in Permission	Built-in Permission	["built-in/*"]	[]	[]	[]	built-in/user-model-built-in		Application	["app-built-in"]	["Read","Write","Admin"]	Allow	t	admin	admin	2026-07-14T05:13:41Z	Approved
\.


--
-- Data for Name: permission_rule; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.permission_rule (id, ptype, v0, v1, v2, v3, v4, v5) FROM stdin;
1	p	built-in/*	app-built-in	Read	allow		built-in/permission-built-in
2	p	built-in/*	app-built-in	Write	allow		built-in/permission-built-in
3	p	built-in/*	app-built-in	Admin	allow		built-in/permission-built-in
\.


--
-- Data for Name: plan; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.plan (owner, name, created_time, display_name, description, price, currency, period, product, payment_providers, is_enabled, is_exclusive, role) FROM stdin;
\.


--
-- Data for Name: pricing; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.pricing (owner, name, created_time, display_name, description, plans, is_enabled, trial_duration, application) FROM stdin;
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.product (owner, name, created_time, display_name, image, detail, description, tag, currency, price, quantity, sold, is_recharge, recharge_options, disable_custom_recharge, providers, success_url, state) FROM stdin;
\.


--
-- Data for Name: provider; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.provider (owner, name, created_time, display_name, category, type, sub_type, method, client_id, client_secret, client_id2, client_secret2, cert, custom_auth_url, custom_token_url, custom_user_info_url, custom_logout_url, custom_logo, scopes, user_mapping, http_headers, host, port, disable_ssl, ssl_mode, title, content, receiver, region_id, sign_name, template_code, app_id, endpoint, intranet_endpoint, domain, bucket, path_prefix, metadata, id_p, issuer_url, enable_sign_authn_request, email_regex, provider_url, enable_proxy, enable_pkce, state) FROM stdin;
admin	provider_captcha_default	2026-07-14T05:13:41Z	Captcha Default	Captcha	Default														null	null		0	f																	f			f	f	
admin	provider_balance	2026-07-14T05:13:41Z	Balance	Payment	Balance														null	null		0	f																	f			f	f	
admin	provider_payment_dummy	2026-07-14T05:13:41Z	Dummy Payment	Payment	Dummy														null	null		0	f																	f			f	f	
\.


--
-- Data for Name: radius_accounting; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.radius_accounting (owner, name, created_time, username, service_type, nas_id, nas_ip_addr, nas_port_id, nas_port_type, nas_port, framed_ip_addr, framed_ip_netmask, acct_session_id, acct_session_time, acct_input_total, acct_output_total, acct_input_packets, acct_output_packets, acct_terminate_cause, last_update, acct_start_time, acct_stop_time) FROM stdin;
\.


--
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.record (id, owner, name, created_time, organization, client_ip, "user", method, request_uri, action, language, object, response, status_code, detail, is_triggered) FROM stdin;
1	built-in	eeefb23d-2d8c-48db-ab2d-145a9cd9b155	2026-07-14T05:14:16Z	built-in	172.27.0.1	admin	POST	/api/login	login	en	{"application":"app-built-in","organization":"built-in","username":"admin","password":"***","autoSignin":false,"language":"","signinMethod":"Password","type":"login"}	{status:"ok", msg:""}	200		t
2	built-in	9f6992f7-a37b-4c3c-ac9f-f8c80174e459	2026-07-14T05:14:28Z	built-in	172.27.0.1	admin	POST	/api/add-organization	add-organization	en	{"owner":"admin","name":"organization_xojfy6","createdTime":"2026-07-14T02:14:28-03:00","displayName":"New Organization - xojfy6","websiteUrl":"https://door.casdoor.com","favicon":"https://cdn.casbin.org/img/favicon.png","passwordType":"bcrypt","PasswordSalt":"","passwordOptions":["AtLeast6"],"passwordObfuscatorType":"Plain","passwordObfuscatorKey":"","passwordExpireDays":0,"countryCodes":["US"],"defaultAvatar":"https://cdn.casbin.org/img/casbin.svg","defaultApplication":"","tags":[],"languages":["en","es","fr","de","ja","zh","vi","pt","tr","pl","uk"],"masterPassword":"","defaultPassword":"","enableSoftDeletion":false,"isProfilePublic":true,"enableTour":true,"disableSignin":false,"mfaRememberInHours":12,"balanceCurrency":"USD","accountItems":[{"name":"Organization","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"ID","visible":true,"viewRule":"Public","modifyRule":"Immutable"},{"name":"Name","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Display name","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"First name","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Last name","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Avatar","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"User type","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Password","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"Email","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Phone","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Country code","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Country/Region","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Location","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Address","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Addresses","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Affiliation","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Title","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"ID card type","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"ID card","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"ID card info","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Real name","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"ID verification","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"Homepage","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Bio","visible":true,"viewRule":"Public","modifyRule":"Self"},{"name":"Tag","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Language","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Gender","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Birthday","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Education","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Score","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Karma","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Ranking","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Balance","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Balance credit","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Balance currency","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Cart","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"Transactions","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"Signup application","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Register type","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Register source","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Groups","visible":true,"viewRule":"Public","modifyRule":"Admin"},{"name":"Roles","visible":true,"viewRule":"Public","modifyRule":"Immutable"},{"name":"Permissions","visible":true,"viewRule":"Public","modifyRule":"Immutable"},{"name":"Consents","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"3rd-party logins","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"Properties","visible":false,"viewRule":"Admin","modifyRule":"Admin"},{"name":"Is online","visible":true,"viewRule":"Admin","modifyRule":"Admin"},{"name":"Is admin","visible":true,"viewRule":"Admin","modifyRule":"Admin"},{"name":"Is forbidden","visible":true,"viewRule":"Admin","modifyRule":"Admin"},{"name":"Is deleted","visible":true,"viewRule":"Admin","modifyRule":"Admin"},{"name":"Multi-factor authentication","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"MFA items","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"WebAuthn credentials","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"Last change password time","visible":true,"viewRule":"Admin","modifyRule":"Admin"},{"name":"Managed accounts","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"Face ID","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"MFA accounts","visible":true,"viewRule":"Self","modifyRule":"Self"},{"name":"Need update password","visible":true,"viewRule":"Admin","modifyRule":"Admin"},{"name":"IP whitelist","visible":true,"viewRule":"Admin","modifyRule":"Admin"}]}	{status:"ok", msg:""}	200		t
3	built-in	dacc9165-00cb-4354-983e-44e555914899	2026-07-14T05:14:45Z	built-in	172.27.0.1	admin	POST	/api/update-organization?id=admin/organization_xojfy6	update-organization	en	{"owner":"admin","name":"my-drive","createdTime":"2026-07-14T02:14:28-03:00","displayName":"My Drive","websiteUrl":"https://door.casdoor.com","logo":"","logoDark":"","favicon":"https://cdn.casbin.org/img/favicon.png","hasPrivilegeConsent":false,"passwordType":"bcrypt","passwordSalt":"","passwordOptions":["AtLeast6"],"passwordObfuscatorType":"Plain","passwordObfuscatorKey":"","passwordExpireDays":0,"countryCodes":["US"],"defaultAvatar":"https://cdn.casbin.org/img/casbin.svg","usePermanentAvatar":false,"defaultApplication":"","userTypes":null,"tags":[],"languages":["en","es","fr","de","ja","zh","vi","pt","tr","pl","uk"],"themeData":null,"masterPassword":"","defaultPassword":"","masterVerificationCode":"","ipWhitelist":"","initScore":0,"enableSoftDeletion":false,"isProfilePublic":true,"useEmailAsUsername":false,"enableTour":true,"disableSignin":false,"ipRestriction":"","navItems":null,"userNavItems":null,"widgetItems":null,"mfaItems":null,"mfaRememberInHours":12,"accountMenu":"","accountItems":[{"name":"Organization","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"ID","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Name","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Display name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"First name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Last name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Avatar","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"User type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Password","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Email","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Phone","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country code","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country/Region","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Location","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Address","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Addresses","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Affiliation","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Title","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card type","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card info","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Real name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID verification","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Homepage","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Bio","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Tag","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Language","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Gender","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Birthday","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Education","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Score","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Karma","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Ranking","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance credit","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance currency","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Cart","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Transactions","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Signup application","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register source","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Groups","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Roles","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Permissions","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Consents","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"3rd-party logins","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Properties","visible":false,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is online","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is admin","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is forbidden","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is deleted","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Multi-factor authentication","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA items","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"WebAuthn credentials","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Last change password time","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Managed accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Face ID","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Need update password","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"IP whitelist","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""}],"dcrPolicy":"","ldapAttributes":null,"kerberosRealm":"","kerberosKdcHost":"","kerberosKeytab":"","kerberosServiceName":"","orgBalance":0,"userBalance":0,"balanceCredit":0,"balanceCurrency":"USD","enableDarkLogo":false}	{status:"ok", msg:""}	200		t
4	built-in	287fb43a-3554-44b8-8c5e-70be6ac86113	2026-07-14T05:14:56Z	built-in	172.27.0.1	admin	POST	/api/add-application	add-application	en	{"owner":"admin","name":"application_akoxvn","organization":"my-drive","createdTime":"2026-07-14T02:14:56-03:00","displayName":"New Application - akoxvn","category":"Default","type":"All","scopes":[],"logo":"https://cdn.casbin.org/img/casdoor-logo_1185x256.png","enablePassword":true,"enableSignUp":true,"disableSignin":false,"enableSigninSession":false,"enableCodeSignin":false,"enableSamlCompress":false,"disableSamlAttributes":false,"providers":[{"name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"prompted":false,"signupGroup":"","rule":""}],"SigninMethods":[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}],"signupItems":[{"name":"ID","visible":false,"required":true,"rule":"Random"},{"name":"Username","visible":true,"required":true,"rule":"None"},{"name":"Display name","visible":true,"required":true,"rule":"None"},{"name":"Password","visible":true,"required":true,"rule":"None"},{"name":"Confirm password","visible":true,"required":true,"rule":"None"},{"name":"Email","visible":true,"required":true,"rule":"Normal"},{"name":"Phone","visible":true,"required":true,"rule":"None"},{"name":"Agreement","visible":true,"required":true,"rule":"None"},{"name":"Signup button","visible":true,"required":true,"rule":"None"},{"name":"Providers","visible":true,"required":true,"rule":"None","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n "}],"grantTypes":["authorization_code","password","client_credentials","token","id_token","refresh_token"],"cert":"cert-built-in","redirectUris":["http://localhost:9000/callback"],"tokenFormat":"JWT","tokenFields":[],"expireInHours":168,"refreshExpireInHours":168,"cookieExpireInHours":720,"formOffset":2}	{status:"ok", msg:""}	200		t
5	built-in	85bd21c8-a07b-47cd-9ce8-c341ac812309	2026-07-14T05:15:16Z	built-in	172.27.0.1	admin	POST	/api/delete-application	delete-application	en	{"owner":"admin","name":"postman","createdTime":"2026-07-14T02:14:56-03:00","displayName":"Postman","category":"Default","type":"All","scopes":[],"logo":"https://cdn.casbin.org/img/casdoor-logo_1185x256.png","title":"","favicon":"","order":0,"homepageUrl":"","description":"","organization":"my-drive","cert":"cert-built-in","defaultGroup":"","defaultTag":"","headerHtml":"","pageHtml":"","enablePassword":true,"enableSignUp":true,"enableGuestSignin":false,"disableSignin":false,"enableSigninSession":false,"enableAutoSignin":false,"enableCodeSignin":false,"enableExclusiveSignin":false,"enableSamlCompress":false,"enableSamlC14n10":false,"enableSamlPostBinding":false,"disableSamlAttributes":false,"enableSamlAssertionSignature":false,"useEmailAsSamlNameId":false,"enableWebAuthn":false,"enableLinkWithEmail":false,"orgChoiceMode":"","samlReplyUrl":"","providers":[{"owner":"","name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"bindingRule":null,"countryCodes":null,"prompted":false,"signupGroup":"","rule":"","provider":{"owner":"admin","name":"provider_captcha_default","createdTime":"2026-07-14T05:13:41Z","displayName":"Captcha Default","category":"Captcha","type":"Default","subType":"","method":"","clientId":"","clientSecret":"","clientId2":"","clientSecret2":"","cert":"","customAuthUrl":"","customTokenUrl":"","customUserInfoUrl":"","customLogoutUrl":"","customLogo":"","scopes":"","userMapping":null,"httpHeaders":null,"host":"","port":0,"disableSsl":false,"sslMode":"","title":"","content":"","receiver":"","regionId":"","signName":"","templateCode":"","appId":"","endpoint":"","intranetEndpoint":"","domain":"","bucket":"","pathPrefix":"","metadata":"","idP":"","issuerUrl":"","enableSignAuthnRequest":false,"emailRegex":"","providerUrl":"","enableProxy":false,"enablePkce":false,"state":""}}],"signinMethods":[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}],"signupItems":[{"name":"ID","visible":false,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Random"},{"name":"Username","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Display name","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Confirm password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Email","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Normal"},{"name":"Phone","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Agreement","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Signup button","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Providers","visible":true,"required":true,"prompted":false,"type":"","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n ","label":"","placeholder":"","options":null,"regex":"","rule":"None"}],"signinItems":[{"name":"Back button","visible":true,"label":"","customCss":".back-button {\\n      top: 65px;\\n      left: 15px;\\n      position: absolute;\\n}\\n.back-inner-button{}","placeholder":"","rule":"None","isCustom":false},{"name":"Languages","visible":true,"label":"","customCss":".login-languages {\\n    top: 55px;\\n    right: 5px;\\n    position: absolute;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Logo","visible":true,"label":"","customCss":".login-logo-box {}","placeholder":"","rule":"None","isCustom":false},{"name":"Signin methods","visible":true,"label":"","customCss":".signin-methods {}","placeholder":"","rule":"None","isCustom":false},{"name":"Username","visible":true,"label":"","customCss":".login-username {}\\n.login-username-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Password","visible":true,"label":"","customCss":".login-password {}\\n.login-password-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Verification code","visible":true,"label":"","customCss":".verification-code {}\\n.verification-code-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Agreement","visible":true,"label":"","customCss":".login-agreement {}","placeholder":"","rule":"None","isCustom":false},{"name":"Forgot password?","visible":true,"label":"","customCss":".login-forget-password {\\n    display: inline-flex;\\n    justify-content: space-between;\\n    width: 320px;\\n    margin-bottom: 25px;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Login button","visible":true,"label":"","customCss":".login-button-box {\\n    margin-bottom: 5px;\\n}\\n.login-button {\\n    width: 100%;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Signup link","visible":true,"label":"","customCss":".login-signup-link {\\n    margin-bottom: 24px;\\n    display: flex;\\n    justify-content: end;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Providers","visible":true,"label":"","customCss":".provider-img {\\n      width: 30px;\\n      margin: 5px;\\n}\\n.provider-big-img {\\n      margin-bottom: 10px;\\n}","placeholder":"","rule":"None","isCustom":false}],"grantTypes":["authorization_code","password","client_credentials","token","id_token","refresh_token"],"organizationObj":{"owner":"admin","name":"my-drive","createdTime":"2026-07-14T02:14:28-03:00","displayName":"My Drive","websiteUrl":"https://door.casdoor.com","logo":"","logoDark":"","favicon":"https://cdn.casbin.org/img/favicon.png","hasPrivilegeConsent":false,"passwordType":"bcrypt","passwordSalt":"","passwordOptions":["AtLeast6"],"passwordObfuscatorType":"Plain","passwordObfuscatorKey":"","passwordExpireDays":0,"countryCodes":["US"],"defaultAvatar":"https://cdn.casbin.org/img/casbin.svg","usePermanentAvatar":false,"defaultApplication":"","userTypes":null,"tags":[],"languages":["en","es","fr","de","ja","zh","vi","pt","tr","pl","uk"],"themeData":null,"masterPassword":"","defaultPassword":"","masterVerificationCode":"","ipWhitelist":"","initScore":0,"enableSoftDeletion":false,"isProfilePublic":true,"useEmailAsUsername":false,"enableTour":true,"disableSignin":false,"ipRestriction":"","navItems":null,"userNavItems":null,"widgetItems":null,"mfaItems":null,"mfaRememberInHours":12,"accountMenu":"","accountItems":[{"name":"Organization","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"ID","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Name","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Display name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"First name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Last name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Avatar","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"User type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Password","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Email","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Phone","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country code","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country/Region","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Location","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Address","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Addresses","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Affiliation","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Title","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card type","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card info","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Real name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID verification","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Homepage","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Bio","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Tag","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Language","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Gender","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Birthday","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Education","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Score","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Karma","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Ranking","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance credit","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance currency","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Cart","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Transactions","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Signup application","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register source","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Groups","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Roles","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Permissions","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Consents","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"3rd-party logins","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Properties","visible":false,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is online","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is admin","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is forbidden","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is deleted","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Multi-factor authentication","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA items","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"WebAuthn credentials","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Last change password time","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Managed accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Face ID","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Need update password","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"IP whitelist","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""}],"dcrPolicy":"","ldapAttributes":null,"kerberosRealm":"","kerberosKdcHost":"","kerberosKeytab":"","kerberosServiceName":"","orgBalance":0,"userBalance":0,"balanceCredit":0,"balanceCurrency":"USD"},"certPublicKey":"","tags":[],"samlAttributes":null,"samlHashAlgorithm":"","samlC14nPrefix":"","isShared":false,"ipRestriction":"","clientId":"18089dd06f77324629e5","clientSecret":"5fa37a80ee95bd0a265e8bede00a5fec55d947af","clientCert":"","redirectUris":["http://localhost:9000/callback"],"backchannelLogoutUri":"","forcedRedirectOrigin":"","tokenFormat":"JWT","tokenSigningMethod":"","tokenFields":[],"tokenAttributes":null,"expireInHours":168,"refreshExpireInHours":168,"cookieExpireInHours":720,"signupUrl":"","signinUrl":"","forgetUrl":"","affiliationUrl":"","ipWhitelist":"","termsOfUse":"","signupHtml":"","signinHtml":"","themeData":null,"footerHtml":"","formCss":"","formCssMobile":"","formOffset":2,"formSideHtml":"","formBackgroundUrl":"","formBackgroundUrlMobile":"","failedSigninLimit":5,"failedSigninFrozenTime":15,"codeResendTimeout":0,"customScopes":null,"domain":"","otherDomains":null,"upstreamHost":"","sslMode":"","sslCert":"","CertObj":null,"registrationAccessToken":""}	{status:"ok", msg:""}	200		t
6	built-in	012bfa39-e7be-4f11-8a3c-c0f77718d380	2026-07-14T05:15:23Z	built-in	172.27.0.1	admin	POST	/api/delete-application	delete-application	en	{"owner":"admin","name":"application_akoxvn","createdTime":"2026-07-14T02:14:56-03:00","displayName":"New Application - akoxvn","category":"Default","type":"All","scopes":[],"logo":"https://cdn.casbin.org/img/casdoor-logo_1185x256.png","title":"","favicon":"","order":0,"homepageUrl":"","description":"","organization":"my-drive","cert":"cert-built-in","defaultGroup":"","defaultTag":"","headerHtml":"","pageHtml":"","enablePassword":true,"enableSignUp":true,"enableGuestSignin":false,"disableSignin":false,"enableSigninSession":false,"enableAutoSignin":false,"enableCodeSignin":false,"enableExclusiveSignin":false,"enableSamlCompress":false,"enableSamlC14n10":false,"enableSamlPostBinding":false,"disableSamlAttributes":false,"enableSamlAssertionSignature":false,"useEmailAsSamlNameId":false,"enableWebAuthn":false,"enableLinkWithEmail":false,"orgChoiceMode":"","samlReplyUrl":"","providers":[{"owner":"","name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"bindingRule":null,"countryCodes":null,"prompted":false,"signupGroup":"","rule":"","provider":null}],"signinMethods":[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}],"signupItems":[{"name":"ID","visible":false,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Random"},{"name":"Username","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Display name","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Confirm password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Email","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Normal"},{"name":"Phone","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Agreement","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Signup button","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Providers","visible":true,"required":true,"prompted":false,"type":"","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n ","label":"","placeholder":"","options":null,"regex":"","rule":"None"}],"signinItems":[{"name":"Back button","visible":true,"label":"","customCss":".back-button {\\n      top: 65px;\\n      left: 15px;\\n      position: absolute;\\n}\\n.back-inner-button{}","placeholder":"","rule":"None","isCustom":false},{"name":"Languages","visible":true,"label":"","customCss":".login-languages {\\n    top: 55px;\\n    right: 5px;\\n    position: absolute;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Logo","visible":true,"label":"","customCss":".login-logo-box {}","placeholder":"","rule":"None","isCustom":false},{"name":"Signin methods","visible":true,"label":"","customCss":".signin-methods {}","placeholder":"","rule":"None","isCustom":false},{"name":"Username","visible":true,"label":"","customCss":".login-username {}\\n.login-username-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Password","visible":true,"label":"","customCss":".login-password {}\\n.login-password-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Verification code","visible":true,"label":"","customCss":".verification-code {}\\n.verification-code-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Agreement","visible":true,"label":"","customCss":".login-agreement {}","placeholder":"","rule":"None","isCustom":false},{"name":"Forgot password?","visible":true,"label":"","customCss":".login-forget-password {\\n    display: inline-flex;\\n    justify-content: space-between;\\n    width: 320px;\\n    margin-bottom: 25px;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Login button","visible":true,"label":"","customCss":".login-button-box {\\n    margin-bottom: 5px;\\n}\\n.login-button {\\n    width: 100%;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Signup link","visible":true,"label":"","customCss":".login-signup-link {\\n    margin-bottom: 24px;\\n    display: flex;\\n    justify-content: end;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Providers","visible":true,"label":"","customCss":".provider-img {\\n      width: 30px;\\n      margin: 5px;\\n}\\n.provider-big-img {\\n      margin-bottom: 10px;\\n}","placeholder":"","rule":"None","isCustom":false}],"grantTypes":["authorization_code","password","client_credentials","token","id_token","refresh_token"],"organizationObj":null,"certPublicKey":"","tags":[],"samlAttributes":null,"samlHashAlgorithm":"","samlC14nPrefix":"","isShared":false,"ipRestriction":"","clientId":"18089dd06f77324629e5","clientSecret":"5fa37a80ee95bd0a265e8bede00a5fec55d947af","clientCert":"","redirectUris":["http://localhost:9000/callback"],"backchannelLogoutUri":"","forcedRedirectOrigin":"","tokenFormat":"JWT","tokenSigningMethod":"","tokenFields":[],"tokenAttributes":null,"expireInHours":168,"refreshExpireInHours":168,"cookieExpireInHours":720,"signupUrl":"","signinUrl":"","forgetUrl":"","affiliationUrl":"","ipWhitelist":"","termsOfUse":"","signupHtml":"","signinHtml":"","themeData":null,"footerHtml":"","formCss":"","formCssMobile":"","formOffset":2,"formSideHtml":"","formBackgroundUrl":"","formBackgroundUrlMobile":"","failedSigninLimit":0,"failedSigninFrozenTime":0,"codeResendTimeout":0,"customScopes":null,"domain":"","otherDomains":null,"upstreamHost":"","sslMode":"","sslCert":"","CertObj":null,"registrationAccessToken":""}	{status:"ok", msg:""}	200		t
7	built-in	76dcba05-070f-4f44-afb4-1c43910f03fd	2026-07-14T05:15:24Z	built-in	172.27.0.1	admin	POST	/api/add-application	add-application	en	{"owner":"admin","name":"application_jy689n","organization":"my-drive","createdTime":"2026-07-14T02:15:24-03:00","displayName":"New Application - jy689n","category":"Default","type":"All","scopes":[],"logo":"https://cdn.casbin.org/img/casdoor-logo_1185x256.png","enablePassword":true,"enableSignUp":true,"disableSignin":false,"enableSigninSession":false,"enableCodeSignin":false,"enableSamlCompress":false,"disableSamlAttributes":false,"providers":[{"name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"prompted":false,"signupGroup":"","rule":""}],"SigninMethods":[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}],"signupItems":[{"name":"ID","visible":false,"required":true,"rule":"Random"},{"name":"Username","visible":true,"required":true,"rule":"None"},{"name":"Display name","visible":true,"required":true,"rule":"None"},{"name":"Password","visible":true,"required":true,"rule":"None"},{"name":"Confirm password","visible":true,"required":true,"rule":"None"},{"name":"Email","visible":true,"required":true,"rule":"Normal"},{"name":"Phone","visible":true,"required":true,"rule":"None"},{"name":"Agreement","visible":true,"required":true,"rule":"None"},{"name":"Signup button","visible":true,"required":true,"rule":"None"},{"name":"Providers","visible":true,"required":true,"rule":"None","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n "}],"grantTypes":["authorization_code","password","client_credentials","token","id_token","refresh_token"],"cert":"cert-built-in","redirectUris":["http://localhost:9000/callback"],"tokenFormat":"JWT","tokenFields":[],"expireInHours":168,"refreshExpireInHours":168,"cookieExpireInHours":720,"formOffset":2}	{status:"ok", msg:""}	200		t
8	built-in	8f2ccfa7-f71d-4e50-8613-242937bfe65b	2026-07-14T05:16:33Z	built-in	172.27.0.1	admin	POST	/api/update-application?id=admin/application_jy689n	update-application	en	{"owner":"admin","name":"postman","createdTime":"2026-07-14T02:15:24-03:00","displayName":"Postman","category":"Default","type":"OIDC","scopes":[],"logo":"https://cdn.casbin.org/img/casdoor-logo_1185x256.png","title":"","favicon":"","order":0,"homepageUrl":"","description":"","organization":"my-drive","cert":"cert-built-in","defaultGroup":"","defaultTag":"","headerHtml":"","pageHtml":"","enablePassword":true,"enableSignUp":true,"enableGuestSignin":false,"disableSignin":false,"enableSigninSession":false,"enableAutoSignin":false,"enableCodeSignin":false,"enableExclusiveSignin":false,"enableSamlCompress":false,"enableSamlC14n10":false,"enableSamlPostBinding":false,"disableSamlAttributes":false,"enableSamlAssertionSignature":false,"useEmailAsSamlNameId":false,"enableWebAuthn":false,"enableLinkWithEmail":false,"orgChoiceMode":"","samlReplyUrl":"","providers":[{"owner":"","name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"bindingRule":null,"countryCodes":null,"prompted":false,"signupGroup":"","rule":"","provider":{"owner":"admin","name":"provider_captcha_default","createdTime":"2026-07-14T05:13:41Z","displayName":"Captcha Default","category":"Captcha","type":"Default","subType":"","method":"","clientId":"","clientSecret":"","clientId2":"","clientSecret2":"","cert":"","customAuthUrl":"","customTokenUrl":"","customUserInfoUrl":"","customLogoutUrl":"","customLogo":"","scopes":"","userMapping":null,"httpHeaders":null,"host":"","port":0,"disableSsl":false,"sslMode":"","title":"","content":"","receiver":"","regionId":"","signName":"","templateCode":"","appId":"","endpoint":"","intranetEndpoint":"","domain":"","bucket":"","pathPrefix":"","metadata":"","idP":"","issuerUrl":"","enableSignAuthnRequest":false,"emailRegex":"","providerUrl":"","enableProxy":false,"enablePkce":false,"state":""}}],"signinMethods":[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}],"signupItems":[{"name":"ID","visible":false,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Random"},{"name":"Username","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Display name","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Confirm password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Email","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Normal"},{"name":"Phone","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Agreement","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Signup button","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Providers","visible":true,"required":true,"prompted":false,"type":"","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n ","label":"","placeholder":"","options":null,"regex":"","rule":"None"}],"signinItems":[{"name":"Back button","visible":true,"label":"","customCss":".back-button {\\n      top: 65px;\\n      left: 15px;\\n      position: absolute;\\n}\\n.back-inner-button{}","placeholder":"","rule":"None","isCustom":false},{"name":"Languages","visible":true,"label":"","customCss":".login-languages {\\n    top: 55px;\\n    right: 5px;\\n    position: absolute;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Logo","visible":true,"label":"","customCss":".login-logo-box {}","placeholder":"","rule":"None","isCustom":false},{"name":"Signin methods","visible":true,"label":"","customCss":".signin-methods {}","placeholder":"","rule":"None","isCustom":false},{"name":"Username","visible":true,"label":"","customCss":".login-username {}\\n.login-username-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Password","visible":true,"label":"","customCss":".login-password {}\\n.login-password-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Verification code","visible":true,"label":"","customCss":".verification-code {}\\n.verification-code-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Agreement","visible":true,"label":"","customCss":".login-agreement {}","placeholder":"","rule":"None","isCustom":false},{"name":"Forgot password?","visible":true,"label":"","customCss":".login-forget-password {\\n    display: inline-flex;\\n    justify-content: space-between;\\n    width: 320px;\\n    margin-bottom: 25px;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Login button","visible":true,"label":"","customCss":".login-button-box {\\n    margin-bottom: 5px;\\n}\\n.login-button {\\n    width: 100%;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Signup link","visible":true,"label":"","customCss":".login-signup-link {\\n    margin-bottom: 24px;\\n    display: flex;\\n    justify-content: end;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Providers","visible":true,"label":"","customCss":".provider-img {\\n      width: 30px;\\n      margin: 5px;\\n}\\n.provider-big-img {\\n      margin-bottom: 10px;\\n}","placeholder":"","rule":"None","isCustom":false}],"grantTypes":["authorization_code","password","client_credentials","token","id_token","refresh_token"],"organizationObj":{"owner":"admin","name":"my-drive","createdTime":"2026-07-14T02:14:28-03:00","displayName":"My Drive","websiteUrl":"https://door.casdoor.com","logo":"","logoDark":"","favicon":"https://cdn.casbin.org/img/favicon.png","hasPrivilegeConsent":false,"passwordType":"bcrypt","passwordSalt":"","passwordOptions":["AtLeast6"],"passwordObfuscatorType":"Plain","passwordObfuscatorKey":"","passwordExpireDays":0,"countryCodes":["US"],"defaultAvatar":"https://cdn.casbin.org/img/casbin.svg","usePermanentAvatar":false,"defaultApplication":"","userTypes":null,"tags":[],"languages":["en","es","fr","de","ja","zh","vi","pt","tr","pl","uk"],"themeData":null,"masterPassword":"","defaultPassword":"","masterVerificationCode":"","ipWhitelist":"","initScore":0,"enableSoftDeletion":false,"isProfilePublic":true,"useEmailAsUsername":false,"enableTour":true,"disableSignin":false,"ipRestriction":"","navItems":null,"userNavItems":null,"widgetItems":null,"mfaItems":null,"mfaRememberInHours":12,"accountMenu":"","accountItems":[{"name":"Organization","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"ID","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Name","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Display name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"First name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Last name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Avatar","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"User type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Password","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Email","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Phone","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country code","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country/Region","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Location","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Address","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Addresses","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Affiliation","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Title","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card type","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card info","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Real name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID verification","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Homepage","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Bio","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Tag","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Language","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Gender","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Birthday","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Education","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Score","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Karma","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Ranking","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance credit","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance currency","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Cart","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Transactions","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Signup application","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register source","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Groups","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Roles","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Permissions","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Consents","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"3rd-party logins","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Properties","visible":false,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is online","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is admin","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is forbidden","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is deleted","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Multi-factor authentication","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA items","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"WebAuthn credentials","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Last change password time","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Managed accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Face ID","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Need update password","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"IP whitelist","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""}],"dcrPolicy":"","ldapAttributes":null,"kerberosRealm":"","kerberosKdcHost":"","kerberosKeytab":"","kerberosServiceName":"","orgBalance":0,"userBalance":0,"balanceCredit":0,"balanceCurrency":"USD"},"certPublicKey":"","tags":[],"samlAttributes":null,"samlHashAlgorithm":"","samlC14nPrefix":"","isShared":false,"ipRestriction":"","clientId":"postman","clientSecret":"","clientCert":"","redirectUris":["https://oauth.pstmn.io/v1/browser-callback","https://oauth.pstmn.io/v1/callback"],"backchannelLogoutUri":"","forcedRedirectOrigin":"","tokenFormat":"JWT","tokenSigningMethod":"","tokenFields":[],"tokenAttributes":null,"expireInHours":168,"refreshExpireInHours":168,"cookieExpireInHours":720,"signupUrl":"","signinUrl":"","forgetUrl":"","affiliationUrl":"","ipWhitelist":"","termsOfUse":"","signupHtml":"","signinHtml":"","themeData":null,"footerHtml":"","formCss":"","formCssMobile":"","formOffset":2,"formSideHtml":"","formBackgroundUrl":"","formBackgroundUrlMobile":"","failedSigninLimit":5,"failedSigninFrozenTime":15,"codeResendTimeout":0,"customScopes":[],"domain":"","otherDomains":null,"upstreamHost":"","sslMode":"","sslCert":"","CertObj":null,"registrationAccessToken":""}	{status:"ok", msg:""}	200		t
9	built-in	94738475-a1e7-4511-b5d2-84d9bf4ab314	2026-07-14T05:17:23Z	built-in	172.27.0.1	admin	POST	/api/add-user	add-user	en	{"owner":"my-drive","name":"user_976x7w","createdTime":"2026-07-14T02:17:23-03:00","type":"normal-user","password":"***","passwordSalt":"","displayName":"New User - 976x7w","avatar":"https://cdn.casbin.org/img/casbin.svg","email":"976x7w@example.com","phone":"12380752488","countryCode":"US","address":[],"groups":[],"affiliation":"Example Inc.","tag":"staff","region":"","realName":"","isVerified":false,"isAdmin":false,"IsForbidden":false,"score":0,"isDeleted":false,"properties":{},"signupApplication":"","registerType":"Add User","registerSource":"built-in/admin","balanceCurrency":"USD"}	{status:"ok", msg:""}	200		t
43	my-drive	6a983f4f-db9a-4de4-8546-806811ed8583	2026-07-14T17:51:21Z	my-drive	172.27.0.1	alice	POST	/api/login?clientId=postman&code_challenge=VNIBkjXb1S_d_tuwnL4EHxIZaD43bhnPnxGMq5tuyTE&code_challenge_method=S256&nonce=&redirectUri=https%3A//oauth.pstmn.io/v1/browser-callback&responseType=code&scope=openid&state=&type=code	login	en	{"application":"postman","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"ok", msg:""}	200		t
10	built-in	71bf7a41-cede-4fd2-b372-e034c5f10db2	2026-07-14T05:17:35Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/user_976x7w	update-user	en	{"owner":"my-drive","name":"alice","createdTime":"2026-07-14T02:17:23-03:00","updatedTime":"2026-07-14T02:17:23-03:00","deletedTime":"","id":"63359f63-acb6-430b-833c-9bb3441176df","externalId":"","type":"normal-user","password":"***","passwordSalt":"95f14f0d42387bdefabf","passwordType":"bcrypt","displayName":"Alice","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"976x7w@example.com","emailVerified":false,"phone":"12380752488","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":1,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
12	built-in	c84e5ceb-eb2f-4906-9ac5-d8dfe4da75e6	2026-07-14T05:17:45Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/alice	update-user	en	{"owner":"my-drive","name":"alice","createdTime":"2026-07-14T02:17:23-03:00","updatedTime":"2026-07-14T02:17:23-03:00","deletedTime":"","id":"63359f63-acb6-430b-833c-9bb3441176df","externalId":"","type":"normal-user","password":"***","passwordSalt":"95f14f0d42387bdefabf","passwordType":"bcrypt","displayName":"Alice","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"976x7w@example.com","emailVerified":false,"phone":"12380752488","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":1,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
14	built-in	8c81be94-404e-40f9-933a-9b6cea25e6ef	2026-07-14T05:17:58Z	built-in	172.27.0.1	admin	POST	/api/add-user	add-user	en	{"owner":"my-drive","name":"user_18v80x","createdTime":"2026-07-14T02:17:58-03:00","type":"normal-user","password":"***","passwordSalt":"","displayName":"New User - 18v80x","avatar":"https://cdn.casbin.org/img/casbin.svg","email":"18v80x@example.com","phone":"14366148445","countryCode":"US","address":[],"groups":[],"affiliation":"Example Inc.","tag":"staff","region":"","realName":"","isVerified":false,"isAdmin":false,"IsForbidden":false,"score":0,"isDeleted":false,"properties":{},"signupApplication":"","registerType":"Add User","registerSource":"built-in/admin","balanceCurrency":"USD"}	{status:"ok", msg:""}	200		t
17	built-in	dd0f020c-c54a-4e99-9782-fdc5a70bac71	2026-07-14T05:18:21Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/alice	update-user	en	{"owner":"my-drive","name":"alice","createdTime":"2026-07-14T02:17:58-03:00","updatedTime":"2026-07-14T02:17:58-03:00","deletedTime":"","id":"2bfeb790-acb2-4fab-beee-2db5673e47e8","externalId":"","type":"normal-user","password":"***","passwordSalt":"508141a03f35fb377618","passwordType":"bcrypt","displayName":"Alice","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"18v80x@example.com","emailVerified":false,"phone":"14366148445","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":1,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
20	my-drive	4e6b52e8-118b-48a1-bee4-c41c0b2fe442	2026-07-14T05:20:29Z	my-drive	172.27.0.1	bob	POST	/api/set-password	set-password	en	------WebKitFormBoundaryyAtn3LUp5z6qANax\r\nContent-Disposition: form-data; name="userOwner"\r\n\r\nmy-drive\r\n------WebKitFormBoundaryyAtn3LUp5z6qANax\r\nContent-Disposition: form-data; name="userName"\r\n\r\nbob\r\n------WebKitFormBoundaryyAtn3LUp5z6qANax\r\nContent-Disposition: form-data; name="oldPassword"\r\n\r\n\r\n------WebKitFormBoundaryyAtn3LUp5z6qANax\r\nContent-Disposition: form-data; name="newPassword"\r\n\r\nsecret\r\n------WebKitFormBoundaryyAtn3LUp5z6qANax--\r\n	{status:"ok", msg:""}	200		t
44		1abf5b29-2a5b-41ab-a360-630225a6bca6	2026-07-14T17:51:22Z		172.27.0.1		POST	/api/login/oauth/access_token	login/oauth/access_token	en	grant_type=authorization_code&code=b24c152197463f8f523c&redirect_uri=https%3A%2F%2Foauth.pstmn.io%2Fv1%2Fbrowser-callback&code_verifier=8fCotEWGe1X7FgaSocDxFHcW-dIEVmy0oxs1bzpKAyE	{status:"", msg:""}	200		t
11	my-drive	be350374-31b5-4425-be73-18d92b8315ef	2026-07-14T05:17:44Z	my-drive	172.27.0.1	alice	POST	/api/set-password	set-password	en	------WebKitFormBoundaryaIuhoGwaTIktIAqL\r\nContent-Disposition: form-data; name="userOwner"\r\n\r\nmy-drive\r\n------WebKitFormBoundaryaIuhoGwaTIktIAqL\r\nContent-Disposition: form-data; name="userName"\r\n\r\nalice\r\n------WebKitFormBoundaryaIuhoGwaTIktIAqL\r\nContent-Disposition: form-data; name="oldPassword"\r\n\r\n\r\n------WebKitFormBoundaryaIuhoGwaTIktIAqL\r\nContent-Disposition: form-data; name="newPassword"\r\n\r\nsecret\r\n------WebKitFormBoundaryaIuhoGwaTIktIAqL--\r\n	{status:"ok", msg:""}	200		t
13	built-in	08473936-7a8d-4c4e-8d18-b712fb451f54	2026-07-14T05:17:52Z	built-in	172.27.0.1	admin	POST	/api/delete-user	delete-user	en	{"owner":"my-drive","name":"alice","createdTime":"2026-07-14T02:17:23-03:00","updatedTime":"2026-07-14T02:17:23-03:00","deletedTime":"","id":"63359f63-acb6-430b-833c-9bb3441176df","externalId":"","type":"normal-user","password":"***","passwordSalt":"95f14f0d42387bdefabf","passwordType":"bcrypt","displayName":"Alice","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"976x7w@example.com","emailVerified":false,"phone":"12380752488","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":1,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
15	built-in	cefc7d4c-86fe-4d00-8618-1233274cd700	2026-07-14T05:18:05Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/user_18v80x	update-user	en	{"owner":"my-drive","name":"alice","createdTime":"2026-07-14T02:17:58-03:00","updatedTime":"2026-07-14T02:17:58-03:00","deletedTime":"","id":"2bfeb790-acb2-4fab-beee-2db5673e47e8","externalId":"","type":"normal-user","password":"***","passwordSalt":"508141a03f35fb377618","passwordType":"bcrypt","displayName":"Alice","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"18v80x@example.com","emailVerified":false,"phone":"14366148445","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":1,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
16	my-drive	fdcd6133-a40b-486d-9809-c5d7f4836c9c	2026-07-14T05:18:16Z	my-drive	172.27.0.1	alice	POST	/api/set-password	set-password	en	------WebKitFormBoundarykBsIuQAGdnaB2Bse\r\nContent-Disposition: form-data; name="userOwner"\r\n\r\nmy-drive\r\n------WebKitFormBoundarykBsIuQAGdnaB2Bse\r\nContent-Disposition: form-data; name="userName"\r\n\r\nalice\r\n------WebKitFormBoundarykBsIuQAGdnaB2Bse\r\nContent-Disposition: form-data; name="oldPassword"\r\n\r\n\r\n------WebKitFormBoundarykBsIuQAGdnaB2Bse\r\nContent-Disposition: form-data; name="newPassword"\r\n\r\nsecret\r\n------WebKitFormBoundarykBsIuQAGdnaB2Bse--\r\n	{status:"ok", msg:""}	200		t
18	built-in	8dcd1045-b9dd-4189-8e1e-d508a11f2209	2026-07-14T05:20:09Z	built-in	172.27.0.1	admin	POST	/api/add-user	add-user	en	{"owner":"my-drive","name":"user_104v0d","createdTime":"2026-07-14T02:20:09-03:00","type":"normal-user","password":"***","passwordSalt":"","displayName":"New User - 104v0d","avatar":"https://cdn.casbin.org/img/casbin.svg","email":"104v0d@example.com","phone":"98377058717","countryCode":"US","address":[],"groups":[],"affiliation":"Example Inc.","tag":"staff","region":"","realName":"","isVerified":false,"isAdmin":false,"IsForbidden":false,"score":0,"isDeleted":false,"properties":{},"signupApplication":"","registerType":"Add User","registerSource":"built-in/admin","balanceCurrency":"USD"}	{status:"ok", msg:""}	200		t
19	built-in	d3daba4b-4713-4b05-a42b-654f566aff75	2026-07-14T05:20:23Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/user_104v0d	update-user	en	{"owner":"my-drive","name":"bob","createdTime":"2026-07-14T02:20:09-03:00","updatedTime":"2026-07-14T02:20:09-03:00","deletedTime":"","id":"4b8decb7-ee03-4e88-a6a6-bcf9e9283626","externalId":"","type":"normal-user","password":"***","passwordSalt":"f45ad28b67471f007ab5","passwordType":"bcrypt","displayName":"Bob","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"104v0d@example.com","emailVerified":false,"phone":"98377058717","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":2,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
21	built-in	47c9f8d3-776a-4a6e-863d-773e3eb4cf1f	2026-07-14T05:20:30Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/bob	update-user	en	{"owner":"my-drive","name":"bob","createdTime":"2026-07-14T02:20:09-03:00","updatedTime":"2026-07-14T02:20:09-03:00","deletedTime":"","id":"4b8decb7-ee03-4e88-a6a6-bcf9e9283626","externalId":"","type":"normal-user","password":"***","passwordSalt":"f45ad28b67471f007ab5","passwordType":"bcrypt","displayName":"Bob","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"104v0d@example.com","emailVerified":false,"phone":"98377058717","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":2,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
24	built-in	98f57e86-461d-4eb4-943c-7186f2a81cd0	2026-07-14T05:20:43Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/user_zdd8j5	update-user	en	{"owner":"my-drive","name":"charlie","createdTime":"2026-07-14T02:20:36-03:00","updatedTime":"2026-07-14T02:20:36-03:00","deletedTime":"","id":"4663efe5-99ee-4051-a825-9f0dd570dd56","externalId":"","type":"normal-user","password":"***","passwordSalt":"50ffbe43bebad2a968fc","passwordType":"bcrypt","displayName":"Charlie","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"zdd8j5@example.com","emailVerified":false,"phone":"09396541619","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":3,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
25	my-drive	b92e4345-e8b0-4cc5-b6b6-536eab6268b2	2026-07-14T05:20:50Z	my-drive	172.27.0.1	charlie	POST	/api/set-password	set-password	en	------WebKitFormBoundaryyfqbijoEiKT2PXvw\r\nContent-Disposition: form-data; name="userOwner"\r\n\r\nmy-drive\r\n------WebKitFormBoundaryyfqbijoEiKT2PXvw\r\nContent-Disposition: form-data; name="userName"\r\n\r\ncharlie\r\n------WebKitFormBoundaryyfqbijoEiKT2PXvw\r\nContent-Disposition: form-data; name="oldPassword"\r\n\r\n\r\n------WebKitFormBoundaryyfqbijoEiKT2PXvw\r\nContent-Disposition: form-data; name="newPassword"\r\n\r\nsecret\r\n------WebKitFormBoundaryyfqbijoEiKT2PXvw--\r\n	{status:"ok", msg:""}	200		t
27	built-in	b1f9aaf9-b4fa-41ea-887b-c730cc7b0013	2026-07-14T05:20:53Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/charlie	update-user	en	{"owner":"my-drive","name":"charlie","createdTime":"2026-07-14T02:20:36-03:00","updatedTime":"2026-07-14T02:20:36-03:00","deletedTime":"","id":"4663efe5-99ee-4051-a825-9f0dd570dd56","externalId":"","type":"normal-user","password":"***","passwordSalt":"50ffbe43bebad2a968fc","passwordType":"bcrypt","displayName":"Charlie","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"zdd8j5@example.com","emailVerified":false,"phone":"09396541619","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":3,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
45	my-drive	6f4e3965-f428-4793-b5f3-a62556f6f593	2026-07-14T18:19:10Z	my-drive	172.27.0.1	alice	POST	/api/login?clientId=f3f23d070d9db967220e&code_challenge=dKA2lu976eXhKhe93geA7fj6K0XYYu7YWMLtosVLrIE&code_challenge_method=S256&nonce=&redirectUri=http%3A//localhost%3A5173&responseType=code&scope=openid&state=7dfd6cae522946d89c308f27318459b5&type=code	login	en	{"application":"react-frontend","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"ok", msg:""}	200		t
47	my-drive	1841d3bd-7830-441c-84e8-a5bb975ebca3	2026-07-14T18:27:04Z	my-drive	172.27.0.1	alice	POST	/api/login?clientId=f3f23d070d9db967220e&code_challenge=xGESXP5UWwa7awfX1vvd7LwZojXOL1c0jvUsoSfsDso&code_challenge_method=S256&nonce=&redirectUri=http%3A//localhost%3A5173&responseType=code&scope=openid&state=2109f7f02f5d4f8180690fbbe623def3&type=code	login	en	{"application":"react-frontend","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"ok", msg:""}	200		t
22	built-in	a5211ac6-cef2-40bc-913a-2af0e61a11d5	2026-07-14T05:20:32Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/bob	update-user	en	{"owner":"my-drive","name":"bob","createdTime":"2026-07-14T02:20:09-03:00","updatedTime":"2026-07-14T02:20:09-03:00","deletedTime":"","id":"4b8decb7-ee03-4e88-a6a6-bcf9e9283626","externalId":"","type":"normal-user","password":"***","passwordSalt":"f45ad28b67471f007ab5","passwordType":"bcrypt","displayName":"Bob","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"104v0d@example.com","emailVerified":false,"phone":"98377058717","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":2,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
23	built-in	f996ccca-94fb-44ea-baca-cfe8bcb8e774	2026-07-14T05:20:36Z	built-in	172.27.0.1	admin	POST	/api/add-user	add-user	en	{"owner":"my-drive","name":"user_zdd8j5","createdTime":"2026-07-14T02:20:36-03:00","type":"normal-user","password":"***","passwordSalt":"","displayName":"New User - zdd8j5","avatar":"https://cdn.casbin.org/img/casbin.svg","email":"zdd8j5@example.com","phone":"09396541619","countryCode":"US","address":[],"groups":[],"affiliation":"Example Inc.","tag":"staff","region":"","realName":"","isVerified":false,"isAdmin":false,"IsForbidden":false,"score":0,"isDeleted":false,"properties":{},"signupApplication":"","registerType":"Add User","registerSource":"built-in/admin","balanceCurrency":"USD"}	{status:"ok", msg:""}	200		t
26	built-in	38744d93-8637-4d26-9235-0131674c397e	2026-07-14T05:20:52Z	built-in	172.27.0.1	admin	POST	/api/update-user?id=my-drive/charlie	update-user	en	{"owner":"my-drive","name":"charlie","createdTime":"2026-07-14T02:20:36-03:00","updatedTime":"2026-07-14T02:20:36-03:00","deletedTime":"","id":"4663efe5-99ee-4051-a825-9f0dd570dd56","externalId":"","type":"normal-user","password":"***","passwordSalt":"50ffbe43bebad2a968fc","passwordType":"bcrypt","displayName":"Charlie","firstName":"","lastName":"","avatar":"https://cdn.casbin.org/img/casbin.svg","avatarType":"","permanentAvatar":"","email":"zdd8j5@example.com","emailVerified":false,"phone":"09396541619","countryCode":"US","region":"","location":"","address":[],"addresses":null,"affiliation":"Example Inc.","title":"","idCardType":"","idCard":"","realName":"","isVerified":false,"homepage":"","bio":"","tag":"staff","language":"","gender":"","birthday":"","education":"","score":0,"karma":0,"ranking":3,"balance":0,"balanceCredit":0,"currency":"","balanceCurrency":"USD","isDefaultAvatar":false,"isOnline":false,"isAdmin":false,"isForbidden":false,"isDeleted":false,"signupApplication":"postman","hash":"","preHash":"","registerType":"Add User","registerSource":"built-in/admin","accessToken":"","originalToken":"","originalRefreshToken":"","createdIp":"","lastSigninTime":"","lastSigninIp":"","github":"","google":"","qq":"","wechat":"","facebook":"","dingtalk":"","weibo":"","gitee":"","linkedin":"","wecom":"","lark":"","gitlab":"","adfs":"","baidu":"","alipay":"","casdoor":"","infoflow":"","apple":"","azuread":"","azureadb2c":"","slack":"","steam":"","bilibili":"","okta":"","douyin":"","kwai":"","line":"","amazon":"","auth0":"","battlenet":"","bitbucket":"","box":"","cloudfoundry":"","dailymotion":"","deezer":"","digitalocean":"","discord":"","dropbox":"","eveonline":"","fitbit":"","gitea":"","heroku":"","influxcloud":"","instagram":"","intercom":"","kakao":"","lastfm":"","mailru":"","meetup":"","microsoftonline":"","naver":"","nextcloud":"","onedrive":"","oura":"","patreon":"","paypal":"","salesforce":"","shopify":"","soundcloud":"","spotify":"","strava":"","stripe":"","telegram":"","tiktok":"","tumblr":"","twitch":"","twitter":"","typetalk":"","uber":"","vk":"","wepay":"","xero":"","yahoo":"","yammer":"","yandex":"","zoom":"","metamask":"","web3onboard":"","custom":"","custom2":"","custom3":"","custom4":"","custom5":"","custom6":"","custom7":"","custom8":"","custom9":"","custom10":"","webauthnCredentials":null,"preferredMfaType":"","recoveryCodes":null,"totpSecret":"","mfaPhoneEnabled":false,"mfaEmailEnabled":false,"mfaRadiusEnabled":false,"mfaRadiusUsername":"","mfaRadiusProvider":"","mfaPushEnabled":false,"mfaPushReceiver":"","mfaPushProvider":"","multiFactorAuths":[{"enabled":false,"isPreferred":false,"mfaType":"sms","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"email","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"app","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"radius","mfaRememberInHours":0},{"enabled":false,"isPreferred":false,"mfaType":"push","mfaRememberInHours":0}],"invitation":"","invitationCode":"","faceIds":null,"cart":null,"ldap":"","properties":{},"roles":[],"permissions":[],"groups":[],"lastChangePasswordTime":"","lastSigninWrongTime":"","signinWrongTimes":0,"managedAccounts":null,"mfaAccounts":null,"mfaItems":null,"mfaRememberDeadline":"","needUpdatePassword":false,"ipWhitelist":"","applicationScopes":null}	{status:"ok", msg:""}	200		t
28	built-in	73c6baeb-70e3-4e3c-b051-a9061f349825	2026-07-14T16:52:04Z	built-in	172.27.0.1	admin	POST	/api/login	login	en	{"application":"app-built-in","organization":"built-in","username":"admin","password":"***","autoSignin":true,"language":"","signinMethod":"Password","type":"login"}	{status:"ok", msg:""}	200		t
29	built-in	a0f89484-daf1-4fef-a256-9df7ce81efb8	2026-07-14T16:52:28Z	built-in	172.27.0.1	admin	POST	/api/add-application	add-application	en	{"owner":"admin","name":"application_vcmtbw","organization":"my-drive","createdTime":"2026-07-14T13:52:28-03:00","displayName":"New Application - vcmtbw","category":"Default","type":"All","scopes":[],"logo":"https://cdn.casbin.org/img/casdoor-logo_1185x256.png","enablePassword":true,"enableSignUp":true,"disableSignin":false,"enableSigninSession":false,"enableCodeSignin":false,"enableSamlCompress":false,"disableSamlAttributes":false,"providers":[{"name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"prompted":false,"signupGroup":"","rule":""}],"SigninMethods":[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}],"signupItems":[{"name":"ID","visible":false,"required":true,"rule":"Random"},{"name":"Username","visible":true,"required":true,"rule":"None"},{"name":"Display name","visible":true,"required":true,"rule":"None"},{"name":"Password","visible":true,"required":true,"rule":"None"},{"name":"Confirm password","visible":true,"required":true,"rule":"None"},{"name":"Email","visible":true,"required":true,"rule":"Normal"},{"name":"Phone","visible":true,"required":true,"rule":"None"},{"name":"Agreement","visible":true,"required":true,"rule":"None"},{"name":"Signup button","visible":true,"required":true,"rule":"None"},{"name":"Providers","visible":true,"required":true,"rule":"None","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n "}],"grantTypes":["authorization_code","password","client_credentials","token","id_token","refresh_token"],"cert":"cert-built-in","redirectUris":["http://localhost:9000/callback"],"tokenFormat":"JWT","tokenFields":[],"expireInHours":168,"refreshExpireInHours":168,"cookieExpireInHours":720,"formOffset":2}	{status:"ok", msg:""}	200		t
30	built-in	cf3b577d-0dad-44d3-be59-0f21868255ea	2026-07-14T16:52:52Z	built-in	172.27.0.1	admin	POST	/api/update-application?id=admin/application_vcmtbw	update-application	en	{"owner":"admin","name":"react-frontend","createdTime":"2026-07-14T13:52:28-03:00","displayName":"React Frontend","category":"Default","type":"OIDC","scopes":[],"logo":"https://cdn.casbin.org/img/casdoor-logo_1185x256.png","title":"","favicon":"","order":0,"homepageUrl":"","description":"","organization":"my-drive","cert":"cert-built-in","defaultGroup":"","defaultTag":"","headerHtml":"","pageHtml":"","enablePassword":true,"enableSignUp":true,"enableGuestSignin":false,"disableSignin":false,"enableSigninSession":false,"enableAutoSignin":false,"enableCodeSignin":false,"enableExclusiveSignin":false,"enableSamlCompress":false,"enableSamlC14n10":false,"enableSamlPostBinding":false,"disableSamlAttributes":false,"enableSamlAssertionSignature":false,"useEmailAsSamlNameId":false,"enableWebAuthn":false,"enableLinkWithEmail":false,"orgChoiceMode":"","samlReplyUrl":"","providers":[{"owner":"","name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"bindingRule":null,"countryCodes":null,"prompted":false,"signupGroup":"","rule":"","provider":{"owner":"admin","name":"provider_captcha_default","createdTime":"2026-07-14T05:13:41Z","displayName":"Captcha Default","category":"Captcha","type":"Default","subType":"","method":"","clientId":"","clientSecret":"","clientId2":"","clientSecret2":"","cert":"","customAuthUrl":"","customTokenUrl":"","customUserInfoUrl":"","customLogoutUrl":"","customLogo":"","scopes":"","userMapping":null,"httpHeaders":null,"host":"","port":0,"disableSsl":false,"sslMode":"","title":"","content":"","receiver":"","regionId":"","signName":"","templateCode":"","appId":"","endpoint":"","intranetEndpoint":"","domain":"","bucket":"","pathPrefix":"","metadata":"","idP":"","issuerUrl":"","enableSignAuthnRequest":false,"emailRegex":"","providerUrl":"","enableProxy":false,"enablePkce":false,"state":""}}],"signinMethods":[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}],"signupItems":[{"name":"ID","visible":false,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Random"},{"name":"Username","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Display name","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Confirm password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Email","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Normal"},{"name":"Phone","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Agreement","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Signup button","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Providers","visible":true,"required":true,"prompted":false,"type":"","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n ","label":"","placeholder":"","options":null,"regex":"","rule":"None"}],"signinItems":[{"name":"Back button","visible":true,"label":"","customCss":".back-button {\\n      top: 65px;\\n      left: 15px;\\n      position: absolute;\\n}\\n.back-inner-button{}","placeholder":"","rule":"None","isCustom":false},{"name":"Languages","visible":true,"label":"","customCss":".login-languages {\\n    top: 55px;\\n    right: 5px;\\n    position: absolute;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Logo","visible":true,"label":"","customCss":".login-logo-box {}","placeholder":"","rule":"None","isCustom":false},{"name":"Signin methods","visible":true,"label":"","customCss":".signin-methods {}","placeholder":"","rule":"None","isCustom":false},{"name":"Username","visible":true,"label":"","customCss":".login-username {}\\n.login-username-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Password","visible":true,"label":"","customCss":".login-password {}\\n.login-password-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Verification code","visible":true,"label":"","customCss":".verification-code {}\\n.verification-code-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Agreement","visible":true,"label":"","customCss":".login-agreement {}","placeholder":"","rule":"None","isCustom":false},{"name":"Forgot password?","visible":true,"label":"","customCss":".login-forget-password {\\n    display: inline-flex;\\n    justify-content: space-between;\\n    width: 320px;\\n    margin-bottom: 25px;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Login button","visible":true,"label":"","customCss":".login-button-box {\\n    margin-bottom: 5px;\\n}\\n.login-button {\\n    width: 100%;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Signup link","visible":true,"label":"","customCss":".login-signup-link {\\n    margin-bottom: 24px;\\n    display: flex;\\n    justify-content: end;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Providers","visible":true,"label":"","customCss":".provider-img {\\n      width: 30px;\\n      margin: 5px;\\n}\\n.provider-big-img {\\n      margin-bottom: 10px;\\n}","placeholder":"","rule":"None","isCustom":false}],"grantTypes":["authorization_code","password","client_credentials","token","id_token","refresh_token"],"organizationObj":{"owner":"admin","name":"my-drive","createdTime":"2026-07-14T02:14:28-03:00","displayName":"My Drive","websiteUrl":"https://door.casdoor.com","logo":"","logoDark":"","favicon":"https://cdn.casbin.org/img/favicon.png","hasPrivilegeConsent":false,"passwordType":"bcrypt","passwordSalt":"","passwordOptions":["AtLeast6"],"passwordObfuscatorType":"Plain","passwordObfuscatorKey":"","passwordExpireDays":0,"countryCodes":["US"],"defaultAvatar":"https://cdn.casbin.org/img/casbin.svg","usePermanentAvatar":false,"defaultApplication":"","userTypes":null,"tags":[],"languages":["en","es","fr","de","ja","zh","vi","pt","tr","pl","uk"],"themeData":null,"masterPassword":"","defaultPassword":"","masterVerificationCode":"","ipWhitelist":"","initScore":0,"enableSoftDeletion":false,"isProfilePublic":true,"useEmailAsUsername":false,"enableTour":true,"disableSignin":false,"ipRestriction":"","navItems":null,"userNavItems":null,"widgetItems":null,"mfaItems":null,"mfaRememberInHours":12,"accountMenu":"","accountItems":[{"name":"Organization","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"ID","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Name","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Display name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"First name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Last name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Avatar","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"User type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Password","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Email","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Phone","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country code","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country/Region","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Location","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Address","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Addresses","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Affiliation","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Title","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card type","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card info","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Real name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID verification","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Homepage","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Bio","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Tag","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Language","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Gender","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Birthday","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Education","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Score","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Karma","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Ranking","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance credit","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance currency","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Cart","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Transactions","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Signup application","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register source","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Groups","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Roles","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Permissions","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Consents","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"3rd-party logins","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Properties","visible":false,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is online","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is admin","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is forbidden","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is deleted","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Multi-factor authentication","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA items","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"WebAuthn credentials","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Last change password time","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Managed accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Face ID","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Need update password","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"IP whitelist","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""}],"dcrPolicy":"","ldapAttributes":null,"kerberosRealm":"","kerberosKdcHost":"","kerberosKeytab":"","kerberosServiceName":"","orgBalance":0,"userBalance":0,"balanceCredit":0,"balanceCurrency":"USD"},"certPublicKey":"","tags":[],"samlAttributes":null,"samlHashAlgorithm":"","samlC14nPrefix":"","isShared":false,"ipRestriction":"","clientId":"f3f23d070d9db967220e","clientSecret":"8ccf45abf0c97d6e1d6b393bb79cabcb405ce07c","clientCert":"","redirectUris":["http://localhost:9000/callback"],"backchannelLogoutUri":"","forcedRedirectOrigin":"","tokenFormat":"JWT","tokenSigningMethod":"","tokenFields":[],"tokenAttributes":null,"expireInHours":168,"refreshExpireInHours":168,"cookieExpireInHours":720,"signupUrl":"","signinUrl":"","forgetUrl":"","affiliationUrl":"","ipWhitelist":"","termsOfUse":"","signupHtml":"","signinHtml":"","themeData":null,"footerHtml":"","formCss":"","formCssMobile":"","formOffset":2,"formSideHtml":"","formBackgroundUrl":"","formBackgroundUrlMobile":"","failedSigninLimit":5,"failedSigninFrozenTime":15,"codeResendTimeout":0,"customScopes":[],"domain":"","otherDomains":null,"upstreamHost":"","sslMode":"","sslCert":"","CertObj":null,"registrationAccessToken":""}	{status:"ok", msg:""}	200		t
31	built-in	ca280206-2c46-4ad5-9dcd-4252051e5d76	2026-07-14T16:53:27Z	built-in	172.27.0.1	admin	POST	/api/update-application?id=admin/react-frontend	update-application	en	{"owner":"admin","name":"react-frontend","createdTime":"2026-07-14T13:52:28-03:00","displayName":"React Frontend","category":"Default","type":"OIDC","scopes":[],"logo":"https://cdn.casbin.org/img/casdoor-logo_1185x256.png","title":"","favicon":"","order":0,"homepageUrl":"","description":"","organization":"my-drive","cert":"cert-built-in","defaultGroup":"","defaultTag":"","headerHtml":"","pageHtml":"","enablePassword":true,"enableSignUp":true,"enableGuestSignin":false,"disableSignin":false,"enableSigninSession":false,"enableAutoSignin":false,"enableCodeSignin":false,"enableExclusiveSignin":false,"enableSamlCompress":false,"enableSamlC14n10":false,"enableSamlPostBinding":false,"disableSamlAttributes":false,"enableSamlAssertionSignature":false,"useEmailAsSamlNameId":false,"enableWebAuthn":false,"enableLinkWithEmail":false,"orgChoiceMode":"","samlReplyUrl":"","providers":[{"owner":"","name":"provider_captcha_default","canSignUp":false,"canSignIn":false,"canUnlink":false,"bindingRule":null,"countryCodes":null,"prompted":false,"signupGroup":"","rule":"","provider":{"owner":"admin","name":"provider_captcha_default","createdTime":"2026-07-14T05:13:41Z","displayName":"Captcha Default","category":"Captcha","type":"Default","subType":"","method":"","clientId":"","clientSecret":"","clientId2":"","clientSecret2":"","cert":"","customAuthUrl":"","customTokenUrl":"","customUserInfoUrl":"","customLogoutUrl":"","customLogo":"","scopes":"","userMapping":null,"httpHeaders":null,"host":"","port":0,"disableSsl":false,"sslMode":"","title":"","content":"","receiver":"","regionId":"","signName":"","templateCode":"","appId":"","endpoint":"","intranetEndpoint":"","domain":"","bucket":"","pathPrefix":"","metadata":"","idP":"","issuerUrl":"","enableSignAuthnRequest":false,"emailRegex":"","providerUrl":"","enableProxy":false,"enablePkce":false,"state":""}}],"signinMethods":[{"name":"Password","displayName":"Password","rule":"All"},{"name":"Verification code","displayName":"Verification code","rule":"All"},{"name":"WebAuthn","displayName":"WebAuthn","rule":"None"},{"name":"Face ID","displayName":"Face ID","rule":"None"}],"signupItems":[{"name":"ID","visible":false,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Random"},{"name":"Username","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Display name","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Confirm password","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Email","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"Normal"},{"name":"Phone","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Agreement","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Signup button","visible":true,"required":true,"prompted":false,"type":"","customCss":"","label":"","placeholder":"","options":null,"regex":"","rule":"None"},{"name":"Providers","visible":true,"required":true,"prompted":false,"type":"","customCss":".provider-img {\\n width: 30px;\\n margin: 5px;\\n }\\n .provider-big-img {\\n margin-bottom: 10px;\\n }\\n ","label":"","placeholder":"","options":null,"regex":"","rule":"None"}],"signinItems":[{"name":"Back button","visible":true,"label":"","customCss":".back-button {\\n      top: 65px;\\n      left: 15px;\\n      position: absolute;\\n}\\n.back-inner-button{}","placeholder":"","rule":"None","isCustom":false},{"name":"Languages","visible":true,"label":"","customCss":".login-languages {\\n    top: 55px;\\n    right: 5px;\\n    position: absolute;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Logo","visible":true,"label":"","customCss":".login-logo-box {}","placeholder":"","rule":"None","isCustom":false},{"name":"Signin methods","visible":true,"label":"","customCss":".signin-methods {}","placeholder":"","rule":"None","isCustom":false},{"name":"Username","visible":true,"label":"","customCss":".login-username {}\\n.login-username-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Password","visible":true,"label":"","customCss":".login-password {}\\n.login-password-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Verification code","visible":true,"label":"","customCss":".verification-code {}\\n.verification-code-input{}","placeholder":"","rule":"None","isCustom":false},{"name":"Agreement","visible":true,"label":"","customCss":".login-agreement {}","placeholder":"","rule":"None","isCustom":false},{"name":"Forgot password?","visible":true,"label":"","customCss":".login-forget-password {\\n    display: inline-flex;\\n    justify-content: space-between;\\n    width: 320px;\\n    margin-bottom: 25px;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Login button","visible":true,"label":"","customCss":".login-button-box {\\n    margin-bottom: 5px;\\n}\\n.login-button {\\n    width: 100%;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Signup link","visible":true,"label":"","customCss":".login-signup-link {\\n    margin-bottom: 24px;\\n    display: flex;\\n    justify-content: end;\\n}","placeholder":"","rule":"None","isCustom":false},{"name":"Providers","visible":true,"label":"","customCss":".provider-img {\\n      width: 30px;\\n      margin: 5px;\\n}\\n.provider-big-img {\\n      margin-bottom: 10px;\\n}","placeholder":"","rule":"None","isCustom":false}],"grantTypes":["authorization_code","password","client_credentials","token","id_token","refresh_token"],"organizationObj":{"owner":"admin","name":"my-drive","createdTime":"2026-07-14T02:14:28-03:00","displayName":"My Drive","websiteUrl":"https://door.casdoor.com","logo":"","logoDark":"","favicon":"https://cdn.casbin.org/img/favicon.png","hasPrivilegeConsent":false,"passwordType":"bcrypt","passwordSalt":"","passwordOptions":["AtLeast6"],"passwordObfuscatorType":"Plain","passwordObfuscatorKey":"","passwordExpireDays":0,"countryCodes":["US"],"defaultAvatar":"https://cdn.casbin.org/img/casbin.svg","usePermanentAvatar":false,"defaultApplication":"","userTypes":null,"tags":[],"languages":["en","es","fr","de","ja","zh","vi","pt","tr","pl","uk"],"themeData":null,"masterPassword":"","defaultPassword":"","masterVerificationCode":"","ipWhitelist":"","initScore":0,"enableSoftDeletion":false,"isProfilePublic":true,"useEmailAsUsername":false,"enableTour":true,"disableSignin":false,"ipRestriction":"","navItems":null,"userNavItems":null,"widgetItems":null,"mfaItems":null,"mfaRememberInHours":12,"accountMenu":"","accountItems":[{"name":"Organization","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"ID","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Name","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Display name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"First name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Last name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Avatar","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"User type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Password","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Email","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Phone","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country code","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Country/Region","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Location","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Address","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Addresses","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Affiliation","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Title","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card type","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID card info","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Real name","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"ID verification","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Homepage","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Bio","visible":true,"viewRule":"Public","modifyRule":"Self","regex":"","tab":""},{"name":"Tag","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Language","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Gender","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Birthday","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Education","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Score","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Karma","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Ranking","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance credit","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Balance currency","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Cart","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Transactions","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Signup application","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register type","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Register source","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Groups","visible":true,"viewRule":"Public","modifyRule":"Admin","regex":"","tab":""},{"name":"Roles","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Permissions","visible":true,"viewRule":"Public","modifyRule":"Immutable","regex":"","tab":""},{"name":"Consents","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"3rd-party logins","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Properties","visible":false,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is online","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is admin","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is forbidden","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Is deleted","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Multi-factor authentication","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA items","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"WebAuthn credentials","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Last change password time","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"Managed accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Face ID","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"MFA accounts","visible":true,"viewRule":"Self","modifyRule":"Self","regex":"","tab":""},{"name":"Need update password","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""},{"name":"IP whitelist","visible":true,"viewRule":"Admin","modifyRule":"Admin","regex":"","tab":""}],"dcrPolicy":"","ldapAttributes":null,"kerberosRealm":"","kerberosKdcHost":"","kerberosKeytab":"","kerberosServiceName":"","orgBalance":0,"userBalance":0,"balanceCredit":0,"balanceCurrency":"USD"},"certPublicKey":"","tags":[],"samlAttributes":null,"samlHashAlgorithm":"","samlC14nPrefix":"","isShared":false,"ipRestriction":"","clientId":"f3f23d070d9db967220e","clientSecret":"","clientCert":"","redirectUris":["http://localhost:5173/*"],"backchannelLogoutUri":"","forcedRedirectOrigin":"","tokenFormat":"JWT","tokenSigningMethod":"","tokenFields":[],"tokenAttributes":null,"expireInHours":168,"refreshExpireInHours":168,"cookieExpireInHours":720,"signupUrl":"","signinUrl":"","forgetUrl":"","affiliationUrl":"","ipWhitelist":"","termsOfUse":"","signupHtml":"","signinHtml":"","themeData":null,"footerHtml":"","formCss":"","formCssMobile":"","formOffset":2,"formSideHtml":"","formBackgroundUrl":"","formBackgroundUrlMobile":"","failedSigninLimit":5,"failedSigninFrozenTime":15,"codeResendTimeout":0,"customScopes":[],"domain":"","otherDomains":null,"upstreamHost":"","sslMode":"","sslCert":"","CertObj":null,"registrationAccessToken":""}	{status:"ok", msg:""}	200		t
32		97bb3732-2442-4baf-8e58-8ab706a97167	2026-07-14T16:53:51Z		172.27.0.1		POST	/api/login?clientId=f3f23d070d9db967220e&code_challenge=y0QwBDrrCbdV4Gl3SQKztXkym2JkyuiblWqXHE1oGXM&code_challenge_method=S256&nonce=&redirectUri=http%3A//localhost%3A5173&responseType=code&scope=openid&state=687c21123b5447a7949c9da3ad7a5f4c&type=code	login	en	{"application":"react-frontend","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"error", msg:"password or code is incorrect, you have 4 remaining chances"}	200		t
33	my-drive	430f5d03-9dec-444f-b03f-b5893df21735	2026-07-14T16:53:56Z	my-drive	172.27.0.1	alice	POST	/api/login?clientId=f3f23d070d9db967220e&code_challenge=y0QwBDrrCbdV4Gl3SQKztXkym2JkyuiblWqXHE1oGXM&code_challenge_method=S256&nonce=&redirectUri=http%3A//localhost%3A5173&responseType=code&scope=openid&state=687c21123b5447a7949c9da3ad7a5f4c&type=code	login	en	{"application":"react-frontend","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"ok", msg:""}	200		t
34		b9b68c11-45ed-43f7-8304-1889918fe4d2	2026-07-14T16:53:57Z		172.27.0.1		POST	/api/login/oauth/access_token	login/oauth/access_token	en	grant_type=authorization_code&redirect_uri=http%3A%2F%2Flocalhost%3A5173&code=59ba9f5bf31fad1c8b78&code_verifier=201842ccbc81487da15ac04995e7b451646ddf410c9b45169791450fd68f8297977b1f48d7564fb4ae48ce4f3f737c83&client_id=f3f23d070d9db967220e	{status:"", msg:""}	200		t
35	my-drive	dca43440-cbfd-4e14-951a-d1adfbe75757	2026-07-14T16:57:49Z	my-drive	172.27.0.1	alice	POST	/api/login?clientId=f3f23d070d9db967220e&code_challenge=u_xuetOdLrb4w6gOqMhfNUgZG-TCcLMYx_jq-b-i244&code_challenge_method=S256&nonce=&redirectUri=http%3A//localhost%3A5173&responseType=code&scope=openid&state=2f2953e58cdb4b9ea01d9256f45bba48&type=code	login	en	{"application":"react-frontend","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"ok", msg:""}	200		t
36		a33ed631-6e99-466f-9f06-9d3bdf39ca81	2026-07-14T16:57:49Z		172.27.0.1		POST	/api/login/oauth/access_token	login/oauth/access_token	en	grant_type=authorization_code&redirect_uri=http%3A%2F%2Flocalhost%3A5173&code=f4a684871a759d4b3f8a&code_verifier=efb996c5683f44259edb09d2b1645f1a01ecf0b069b14520a005cdba4ba8e4a350c5985f42974887a845f9d367f106a3&client_id=f3f23d070d9db967220e	{status:"", msg:""}	200		t
37	my-drive	cf28aa22-2ceb-44af-891d-b476623b3e80	2026-07-14T17:00:35Z	my-drive	172.27.0.1	alice	POST	/api/login?clientId=f3f23d070d9db967220e&code_challenge=scVmgZigRjEKhvT7fx_OnvVe1ZYZB_FpAIbsIQ53duo&code_challenge_method=S256&nonce=&redirectUri=http%3A//localhost%3A5173&responseType=code&scope=openid&state=82288ddac80d4d0b878c5b7fc8f4c40f&type=code	login	en	{"application":"react-frontend","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"ok", msg:""}	200		t
38		f6337ac3-0eb4-42c3-be1c-b31bc6f8ac53	2026-07-14T17:00:35Z		172.27.0.1		POST	/api/login/oauth/access_token	login/oauth/access_token	en	grant_type=authorization_code&redirect_uri=http%3A%2F%2Flocalhost%3A5173&code=cb233b7b561e52b1b0ce&code_verifier=64eff721f36b4c20907a6c8e881912975e0328bbc1a54edea093bd8c114e11aa3e776819103e44c19b5a20f7be9b1a0e&client_id=f3f23d070d9db967220e	{status:"", msg:""}	200		t
39	my-drive	7fac4955-290a-4e55-8095-a3acbd6ed446	2026-07-14T17:49:24Z	my-drive	172.27.0.1	alice	POST	/api/login?clientId=f3f23d070d9db967220e&code_challenge=8_O_anCB7IGkOFgpmWPLqDRVJoWXUr3JtIKEQvRzRZo&code_challenge_method=S256&nonce=&redirectUri=http%3A//localhost%3A5173&responseType=code&scope=openid&state=210ed1a8d326420892af6b3647e8a8ee&type=code	login	en	{"application":"react-frontend","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"ok", msg:""}	200		t
40		03d7f1d4-fa76-4803-a796-65f2941a6444	2026-07-14T17:49:25Z		172.27.0.1		POST	/api/login/oauth/access_token	login/oauth/access_token	en	grant_type=authorization_code&redirect_uri=http%3A%2F%2Flocalhost%3A5173&code=3e461627a56f7df5b26c&code_verifier=0a054155fdb14c90910059fd49e834719453e88ba42048458297e495359d8353291e4167e9ea4382908aa55e630f99fa&client_id=f3f23d070d9db967220e	{status:"", msg:""}	200		t
41	my-drive	2e3f7554-fd9d-4422-ad31-ab099b109fdf	2026-07-14T17:50:58Z	my-drive	172.27.0.1	alice	POST	/api/login?clientId=postman&code_challenge=&code_challenge_method=&nonce=&redirectUri=https%3A//oauth.pstmn.io/v1/browser-callback&responseType=code&scope=&state=&type=code	login	en	{"application":"postman","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"ok", msg:""}	200		t
42		749ea67f-c790-4ec8-935f-6a477eb51c6c	2026-07-14T17:50:59Z		172.27.0.1		POST	/api/login/oauth/access_token	login/oauth/access_token	en	grant_type=authorization_code&code=5e68fe8cb350fa00843c&redirect_uri=https%3A%2F%2Foauth.pstmn.io%2Fv1%2Fbrowser-callback	{status:"", msg:""}	200		t
46		1f0f25c5-9272-4634-adce-97bb1a8aa0bd	2026-07-14T18:19:10Z		172.27.0.1		POST	/api/login/oauth/access_token	login/oauth/access_token	en	grant_type=authorization_code&redirect_uri=http%3A%2F%2Flocalhost%3A5173&code=41b58c42e7cb84e13d37&code_verifier=0c8648adefbd492c8ef76f8b5f1c8a6d48ab532851784dca9dbcfe7c2ee486ba7b94e20a3c3745798196c060b044bee0&client_id=f3f23d070d9db967220e	{status:"", msg:""}	200		t
48		ba6cff22-11b3-4f77-afe2-965a1e2d52d7	2026-07-14T18:27:04Z		172.27.0.1		POST	/api/login/oauth/access_token	login/oauth/access_token	en	grant_type=authorization_code&redirect_uri=http%3A%2F%2Flocalhost%3A5173&code=7934da7679d07ca37e4c&code_verifier=f02578e5f3f64cb9b260cd55577140ac246b32e47cc9437ea502ebfb7fa62daa7adba33f1e64450fbcd085eb3860423f&client_id=f3f23d070d9db967220e	{status:"", msg:""}	200		t
49	my-drive	9a7763c5-f7a3-428d-8eb2-f086f71c7881	2026-07-14T18:27:36Z	my-drive	172.27.0.1	alice	POST	/api/login?clientId=f3f23d070d9db967220e&code_challenge=vfd43lrnEhGIBd5LovGYDA3GDC2M-ssQGIHeZEG2wI4&code_challenge_method=S256&nonce=&redirectUri=http%3A//localhost%3A5173&responseType=code&scope=openid&state=2357da89e6ac4a7db5833be1ff43b109&type=code	login	en	{"application":"react-frontend","organization":"my-drive","username":"alice","autoSignin":true,"password":"***","language":"","signinMethod":"Password","type":"code"}	{status:"ok", msg:""}	200		t
50		d9d40b2f-2e4d-43ea-b3c8-2a6eac8c3728	2026-07-14T18:27:36Z		172.27.0.1		POST	/api/login/oauth/access_token	login/oauth/access_token	en	grant_type=authorization_code&redirect_uri=http%3A%2F%2Flocalhost%3A5173&code=6e0b692c921297c3fffd&code_verifier=9605962f61e14d1495931e539e3c2d93eb67b426142541548302a0b6a84c4b6207b7d9597171425c81e6ef87fa74f0e7&client_id=f3f23d070d9db967220e	{status:"", msg:""}	200		t
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.resource (owner, name, created_time, "user", provider, application, tag, parent, file_name, file_type, file_format, file_size, url, description) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.role (owner, name, created_time, display_name, description, users, groups, roles, domains, is_enabled) FROM stdin;
\.


--
-- Data for Name: rule; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.rule (owner, name, created_time, updated_time, type, expressions, action, status_code, reason, is_verbose) FROM stdin;
\.


--
-- Data for Name: server; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.server (owner, name, created_time, updated_time, display_name, url, token, application, tools) FROM stdin;
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.session (owner, name, application, created_time, session_id) FROM stdin;
built-in	admin	app-built-in	2026-07-14T05:14:16Z	["17fdaadd4e966c79f5ab78bdaf111520","2f03c78bb766cb802111a7f908af7737"]
my-drive	alice	postman	2026-07-14T17:50:58Z	["503497aa2549676d9fda544c2965ec3e","5a5b293c2ef410b4ab410fbbed1b49e7"]
my-drive	alice	react-frontend	2026-07-14T16:53:56Z	["2f03c78bb766cb802111a7f908af7737","b2c326479b68dbb5d1b42788bffcf438","53ab324bf3464fff695bbc68cb1547ec","5c094fd9905c255098566be66c00c88a","169761795dde9203e3244301675d2900"]
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.site (owner, name, created_time, updated_time, display_name, tag, domain, other_domains, need_redirect, disable_verbose, rules, enable_alert, alert_interval, alert_try_times, alert_providers, challenges, host, port, hosts, ssl_mode, public_ip, node, is_self, status, nodes, casdoor_application) FROM stdin;
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.subscription (owner, name, display_name, created_time, description, "user", pricing, plan, payment, start_time, end_time, period, state) FROM stdin;
\.


--
-- Data for Name: syncer; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.syncer (owner, name, created_time, organization, type, database_type, ssl_mode, ssh_type, host, port, "user", password, ssh_host, ssh_port, ssh_user, ssh_password, cert, database, "table", table_columns, affiliation_table, avatar_base_url, error_text, sync_interval, is_read_only, is_enabled) FROM stdin;
\.


--
-- Data for Name: third_party_link; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.third_party_link (owner, user_name, provider_name, provider_id, created_time) FROM stdin;
\.


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.ticket (owner, name, created_time, updated_time, display_name, "user", title, content, state, messages) FROM stdin;
\.


--
-- Data for Name: token; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.token (owner, name, created_time, application, organization, "user", code, access_token, refresh_token, access_token_hash, refresh_token_hash, expires_in, scope, token_type, grant_type, code_challenge, code_is_used, code_expire_in, resource, dpop_jkt) FROM stdin;
admin	17ea6afb-22d3-447a-a903-940151fce62a	2026-07-14T05:14:16Z	app-built-in	built-in	admin	bf9aadf8db7bec7755b6	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6ImJ1aWx0LWluIiwibmFtZSI6ImFkbWluIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDA1OjEzOjQxWiIsInVwZGF0ZWRUaW1lIjoiMjAyNi0wNy0xNFQwNToxMzo0MVoiLCJkZWxldGVkVGltZSI6IiIsImlkIjoiMzhjODBkZTEtZTk3My00ZGIxLTk2YTEtODQ3MzQ2MDA5ZDZlIiwidHlwZSI6Im5vcm1hbC11c2VyIiwicGFzc3dvcmQiOiIiLCJwYXNzd29yZFNhbHQiOiI0YjNiYjI1ZjE2NDM3NjFjM2Q5NSIsInBhc3N3b3JkVHlwZSI6ImJjcnlwdCIsImRpc3BsYXlOYW1lIjoiQWRtaW4iLCJmaXJzdE5hbWUiOiIiLCJsYXN0TmFtZSI6IiIsImF2YXRhciI6Imh0dHBzOi8vY2RuLmNhc2Jpbi5vcmcvaW1nL2Nhc2Jpbi5zdmciLCJhdmF0YXJUeXBlIjoiIiwicGVybWFuZW50QXZhdGFyIjoiIiwiZW1haWwiOiJhZG1pbkBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxMjM0NTY3ODkxMCIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjoyMDAwLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjp0cnVlLCJpc0ZvcmJpZGRlbiI6ZmFsc2UsImlzRGVsZXRlZCI6ZmFsc2UsInNpZ251cEFwcGxpY2F0aW9uIjoiYXBwLWJ1aWx0LWluIiwiaGFzaCI6IiIsInByZUhhc2giOiIiLCJyZWdpc3RlclR5cGUiOiJBZGQgVXNlciIsInJlZ2lzdGVyU291cmNlIjoiYnVpbHQtaW4vYWRtaW4iLCJnaXRodWIiOiIiLCJnb29nbGUiOiIiLCJxcSI6IiIsIndlY2hhdCI6IiIsImZhY2Vib29rIjoiIiwiZGluZ3RhbGsiOiIiLCJ3ZWlibyI6IiIsImdpdGVlIjoiIiwibGlua2VkaW4iOiIiLCJ3ZWNvbSI6IiIsImxhcmsiOiIiLCJnaXRsYWIiOiIiLCJjcmVhdGVkSXAiOiIxMjcuMC4wLjEiLCJsYXN0U2lnbmluVGltZSI6IiIsImxhc3RTaWduaW5JcCI6IiIsInByZWZlcnJlZE1mYVR5cGUiOiIiLCJyZWNvdmVyeUNvZGVzIjpudWxsLCJ0b3RwU2VjcmV0IjoiIiwibWZhUGhvbmVFbmFibGVkIjpmYWxzZSwibWZhRW1haWxFbmFibGVkIjpmYWxzZSwibGRhcCI6IiIsInByb3BlcnRpZXMiOnt9LCJyb2xlcyI6W10sInBlcm1pc3Npb25zIjpbXSwiZ3JvdXBzIjpbXSwibGFzdFNpZ25pbldyb25nVGltZSI6IiIsInNpZ25pbldyb25nVGltZXMiOjAsIm1hbmFnZWRBY2NvdW50cyI6bnVsbCwidG9rZW5UeXBlIjoiYWNjZXNzLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6InByb2ZpbGUiLCJhenAiOiIzZDhiYzBjZWUxY2IzMzZjOWE3MyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjM4YzgwZGUxLWU5NzMtNGRiMS05NmExLTg0NzM0NjAwOWQ2ZSIsImF1ZCI6WyIzZDhiYzBjZWUxY2IzMzZjOWE3MyJdLCJleHAiOjE3ODQ2MTA4NTYsIm5iZiI6MTc4NDAwNjA1NiwiaWF0IjoxNzg0MDA2MDU2LCJqdGkiOiJhZG1pbi8xN2VhNmFmYi0yMmQzLTQ0N2EtYTkwMy05NDAxNTFmY2U2MmEifQ.uCW_5kYIZAhKUWmdyVvkeJT93khpoMx7XSb_U5p1Ijq9H375GqPHU1P4SCgrpNsU4GplO_MOeWxDpJ6RELcPR5ywghCSZzCEuWFdZFhW-GvlhPTLiE72yly04j_yn_GAnYyzqamjTduzK7F8XuDKFF2BJ2yWg2tpKHcSPEx1725Ga4Bn89opTLWjY_EMXGeZhz3AX5E3T9d5x13ZyGpAqwBnlL1VZU6NW_qjSEmorPLD6MO0c5mNA3vKOFbUU_dPYToKA3GIGfBpjpsOPdWUrD-MraaZg6bjkRkjX0uUnf3Fxvb6ggDp2WXo8UxSgyJtVvkzN5E1YzO-xRccLDKPzbBj_Xs1SZyVK8LVSceYFEE1XmfCJIyEEtZw_DzM_AOddkTEqgo-_J3_z6u1xc44oMWo6OfJZVmjzqKFP9M-PE4GXy3gn4IuNdFDBEM-2hFXnF6qyksYpGbaArk8VRJW_nqha85xqb3XqtaqDFEarWPY8B6bT57gL3h-SDiQaDIMzn1UIIG4tkgwJ_rbhPSBF8-5aHqYaZHcPuClIl5t_tLN6G6atySm7CnibLfiQFHQ454GUdhdPl-bqpSIjwNAtolEIKSzbVyKRXed_cFMO1lBUNRY_8jseQ_DClQBMbGxm_8liE2T7oppbtjwnj63Nc9YtWu5z3NiDaUb_mInogk	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6ImJ1aWx0LWluIiwibmFtZSI6ImFkbWluIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDA1OjEzOjQxWiIsInVwZGF0ZWRUaW1lIjoiMjAyNi0wNy0xNFQwNToxMzo0MVoiLCJkZWxldGVkVGltZSI6IiIsImlkIjoiMzhjODBkZTEtZTk3My00ZGIxLTk2YTEtODQ3MzQ2MDA5ZDZlIiwidHlwZSI6Im5vcm1hbC11c2VyIiwicGFzc3dvcmQiOiIiLCJwYXNzd29yZFNhbHQiOiI0YjNiYjI1ZjE2NDM3NjFjM2Q5NSIsInBhc3N3b3JkVHlwZSI6ImJjcnlwdCIsImRpc3BsYXlOYW1lIjoiQWRtaW4iLCJmaXJzdE5hbWUiOiIiLCJsYXN0TmFtZSI6IiIsImF2YXRhciI6Imh0dHBzOi8vY2RuLmNhc2Jpbi5vcmcvaW1nL2Nhc2Jpbi5zdmciLCJhdmF0YXJUeXBlIjoiIiwicGVybWFuZW50QXZhdGFyIjoiIiwiZW1haWwiOiJhZG1pbkBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxMjM0NTY3ODkxMCIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjoyMDAwLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjp0cnVlLCJpc0ZvcmJpZGRlbiI6ZmFsc2UsImlzRGVsZXRlZCI6ZmFsc2UsInNpZ251cEFwcGxpY2F0aW9uIjoiYXBwLWJ1aWx0LWluIiwiaGFzaCI6IiIsInByZUhhc2giOiIiLCJyZWdpc3RlclR5cGUiOiJBZGQgVXNlciIsInJlZ2lzdGVyU291cmNlIjoiYnVpbHQtaW4vYWRtaW4iLCJnaXRodWIiOiIiLCJnb29nbGUiOiIiLCJxcSI6IiIsIndlY2hhdCI6IiIsImZhY2Vib29rIjoiIiwiZGluZ3RhbGsiOiIiLCJ3ZWlibyI6IiIsImdpdGVlIjoiIiwibGlua2VkaW4iOiIiLCJ3ZWNvbSI6IiIsImxhcmsiOiIiLCJnaXRsYWIiOiIiLCJjcmVhdGVkSXAiOiIxMjcuMC4wLjEiLCJsYXN0U2lnbmluVGltZSI6IiIsImxhc3RTaWduaW5JcCI6IiIsInByZWZlcnJlZE1mYVR5cGUiOiIiLCJyZWNvdmVyeUNvZGVzIjpudWxsLCJ0b3RwU2VjcmV0IjoiIiwibWZhUGhvbmVFbmFibGVkIjpmYWxzZSwibWZhRW1haWxFbmFibGVkIjpmYWxzZSwibGRhcCI6IiIsInByb3BlcnRpZXMiOnt9LCJyb2xlcyI6W10sInBlcm1pc3Npb25zIjpbXSwiZ3JvdXBzIjpbXSwibGFzdFNpZ25pbldyb25nVGltZSI6IiIsInNpZ25pbldyb25nVGltZXMiOjAsIm1hbmFnZWRBY2NvdW50cyI6bnVsbCwidG9rZW5UeXBlIjoicmVmcmVzaC10b2tlbiIsInRhZyI6InN0YWZmIiwic2NvcGUiOiJwcm9maWxlIiwiYXpwIjoiM2Q4YmMwY2VlMWNiMzM2YzlhNzMiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIzOGM4MGRlMS1lOTczLTRkYjEtOTZhMS04NDczNDYwMDlkNmUiLCJhdWQiOlsiM2Q4YmMwY2VlMWNiMzM2YzlhNzMiXSwiZXhwIjoxNzg0NjEwODU2LCJuYmYiOjE3ODQwMDYwNTYsImlhdCI6MTc4NDAwNjA1NiwianRpIjoiYWRtaW4vMTdlYTZhZmItMjJkMy00NDdhLWE5MDMtOTQwMTUxZmNlNjJhIn0.R9A8Axh-OMUTU-JDobBma4QnCE8G9lrXCLOqkrR-_OgGQaCJU6WO48G0fjly7nPAjdYOW2yHAbH1vf_IMguUATbnmmFIjHVXm_Lz8D1KLJO8c7MKoqczTy2RMO9IGEQC_aZprRdavXUKiXeZ9VRBMqa3BVvJVM2oZTtQ1m5uCKVMioWOJW4cyqXZKue1nzbBXwtdsw1-Unf-fTVOk54AhmQ1O0wKPbrcl-VAw5Qlee2v0p1xa3XLLj53ws1zku20v0WRCtId_YcicKAY3IIhfTBJZfBqulWzITeOdrHuH4JZDHw65TXnKBpAj9gQRtj-9bTY3JWLXWqvgY8weRKHNKiqhBMs_TQUY0eHZy8J1dENiCmsvttaYN4Zletu9R52_0wCKMw6KonZPzM8b8UQTUc6Vy5BlTuqNA6DPKz3a2vA--KrGG2ZRLHnUgu7d8iMqXiisUIsADyZkD1aVgCeHWgBdoWDUgS2C2t-j23_eacZJDXlC-TAfd1kHitvckHHMpcm5Q6MK-0sFHTJ4pwh4wYDcynz6DHyy5c_vm17rQdMYAGj53cpu8nAOYPm8muIJMkvdIOFYGJW_AWEP1fDaytmgLnFG_iVayxGVcFqkYCQWgC4c05fsmBPqz7MyhWUTegaL4s3t1dXMdddzY0wePl2AXUv9lABcSqdsFkKU50	c266e54c6f8d8936beeca3aef520a43d8f50d16075a46d51ce6dfe059000f182	6d894919e6c17071d00877baa91c71029f47f09b6698c3a604d770e04ec7cf8d	604800	profile	Bearer			t	0		
admin	ed932e0e-98b0-40ac-a4fa-a74c039e62e3	2026-07-14T16:52:04Z	app-built-in	built-in	admin	289b18d26f0a99f0317d	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6ImJ1aWx0LWluIiwibmFtZSI6ImFkbWluIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDA1OjEzOjQxWiIsInVwZGF0ZWRUaW1lIjoiMjAyNi0wNy0xNFQwNToxMzo0MVoiLCJkZWxldGVkVGltZSI6IiIsImlkIjoiMzhjODBkZTEtZTk3My00ZGIxLTk2YTEtODQ3MzQ2MDA5ZDZlIiwidHlwZSI6Im5vcm1hbC11c2VyIiwicGFzc3dvcmQiOiIiLCJwYXNzd29yZFNhbHQiOiI0YjNiYjI1ZjE2NDM3NjFjM2Q5NSIsInBhc3N3b3JkVHlwZSI6ImJjcnlwdCIsImRpc3BsYXlOYW1lIjoiQWRtaW4iLCJmaXJzdE5hbWUiOiIiLCJsYXN0TmFtZSI6IiIsImF2YXRhciI6Imh0dHBzOi8vY2RuLmNhc2Jpbi5vcmcvaW1nL2Nhc2Jpbi5zdmciLCJhdmF0YXJUeXBlIjoiIiwicGVybWFuZW50QXZhdGFyIjoiIiwiZW1haWwiOiJhZG1pbkBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxMjM0NTY3ODkxMCIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjoyMDAwLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjp0cnVlLCJpc0ZvcmJpZGRlbiI6ZmFsc2UsImlzRGVsZXRlZCI6ZmFsc2UsInNpZ251cEFwcGxpY2F0aW9uIjoiYXBwLWJ1aWx0LWluIiwiaGFzaCI6IiIsInByZUhhc2giOiIiLCJyZWdpc3RlclR5cGUiOiJBZGQgVXNlciIsInJlZ2lzdGVyU291cmNlIjoiYnVpbHQtaW4vYWRtaW4iLCJnaXRodWIiOiIiLCJnb29nbGUiOiIiLCJxcSI6IiIsIndlY2hhdCI6IiIsImZhY2Vib29rIjoiIiwiZGluZ3RhbGsiOiIiLCJ3ZWlibyI6IiIsImdpdGVlIjoiIiwibGlua2VkaW4iOiIiLCJ3ZWNvbSI6IiIsImxhcmsiOiIiLCJnaXRsYWIiOiIiLCJjcmVhdGVkSXAiOiIxMjcuMC4wLjEiLCJsYXN0U2lnbmluVGltZSI6IiIsImxhc3RTaWduaW5JcCI6IiIsInByZWZlcnJlZE1mYVR5cGUiOiIiLCJyZWNvdmVyeUNvZGVzIjpudWxsLCJ0b3RwU2VjcmV0IjoiIiwibWZhUGhvbmVFbmFibGVkIjpmYWxzZSwibWZhRW1haWxFbmFibGVkIjpmYWxzZSwibGRhcCI6IiIsInByb3BlcnRpZXMiOnt9LCJyb2xlcyI6W10sInBlcm1pc3Npb25zIjpbXSwiZ3JvdXBzIjpbXSwibGFzdFNpZ25pbldyb25nVGltZSI6IiIsInNpZ25pbldyb25nVGltZXMiOjAsIm1hbmFnZWRBY2NvdW50cyI6bnVsbCwidG9rZW5UeXBlIjoiYWNjZXNzLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6InByb2ZpbGUiLCJhenAiOiIzZDhiYzBjZWUxY2IzMzZjOWE3MyIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjM4YzgwZGUxLWU5NzMtNGRiMS05NmExLTg0NzM0NjAwOWQ2ZSIsImF1ZCI6WyIzZDhiYzBjZWUxY2IzMzZjOWE3MyJdLCJleHAiOjE3ODQ2NTI3MjQsIm5iZiI6MTc4NDA0NzkyNCwiaWF0IjoxNzg0MDQ3OTI0LCJqdGkiOiJhZG1pbi9lZDkzMmUwZS05OGIwLTQwYWMtYTRmYS1hNzRjMDM5ZTYyZTMifQ.gaWVeG7x2EBAXVDCnuxub28wk8IiTgZ9huUkuBQD2bTGjGb1S6DKjKYwBJTmLuNzBUd-mjvNogwR6R5CEwYXLov7-2FcRCF3Mgo5TC3HPLpEhE0uXhyf5oW4B6HLWClb-xuPnApbvXjCHYUBaZmSUqvvO15BhOT_psHx-UwnO-8SDqguBa00Byb09fFOr81HpLRb0w6DcWIR3gu-csoyE5A1WvnE22QKjWJeL2JBiOYOowLmuebBCoIAJpqvKEkCgyvlmAWxgGB34lDk7r4vai3Q-jwPlbeovulwcZlxsohdBDWFEPV8Sls0et8GPyV6ePJ8ZFlQVkfK7zqARumwdFfiYQeEy33CMvXkg1EtDqG7REgwbJ9L9cqbvreGOA8m7yacenxVbF0nN21Huzs4sJ0NK8X8otxLaGO5UpQXmALJRbUwiMeUxl0tY_t2OpPGdLlFUDKr7G5BvNSZ3ptGhRJM96zzLljAGKbW5rbrHeMYexr2aCTo26LWjFvT1avzGz0VDOHfcSruc69B1LuqWk-6rNTeDM234MGVkQ24OpdKFXcZb1stfebMxhgn1bdrIOuIt_HfxVQb75wUYCcERC6yFCEf-1nETEQ0Q4XN4G_Ti-jdDq2R9igEbwf_RkE704xf-gCitq3romJihL0LhbUYEUUWB8_adIf9VbhEY-I	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6ImJ1aWx0LWluIiwibmFtZSI6ImFkbWluIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDA1OjEzOjQxWiIsInVwZGF0ZWRUaW1lIjoiMjAyNi0wNy0xNFQwNToxMzo0MVoiLCJkZWxldGVkVGltZSI6IiIsImlkIjoiMzhjODBkZTEtZTk3My00ZGIxLTk2YTEtODQ3MzQ2MDA5ZDZlIiwidHlwZSI6Im5vcm1hbC11c2VyIiwicGFzc3dvcmQiOiIiLCJwYXNzd29yZFNhbHQiOiI0YjNiYjI1ZjE2NDM3NjFjM2Q5NSIsInBhc3N3b3JkVHlwZSI6ImJjcnlwdCIsImRpc3BsYXlOYW1lIjoiQWRtaW4iLCJmaXJzdE5hbWUiOiIiLCJsYXN0TmFtZSI6IiIsImF2YXRhciI6Imh0dHBzOi8vY2RuLmNhc2Jpbi5vcmcvaW1nL2Nhc2Jpbi5zdmciLCJhdmF0YXJUeXBlIjoiIiwicGVybWFuZW50QXZhdGFyIjoiIiwiZW1haWwiOiJhZG1pbkBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxMjM0NTY3ODkxMCIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjoyMDAwLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjp0cnVlLCJpc0ZvcmJpZGRlbiI6ZmFsc2UsImlzRGVsZXRlZCI6ZmFsc2UsInNpZ251cEFwcGxpY2F0aW9uIjoiYXBwLWJ1aWx0LWluIiwiaGFzaCI6IiIsInByZUhhc2giOiIiLCJyZWdpc3RlclR5cGUiOiJBZGQgVXNlciIsInJlZ2lzdGVyU291cmNlIjoiYnVpbHQtaW4vYWRtaW4iLCJnaXRodWIiOiIiLCJnb29nbGUiOiIiLCJxcSI6IiIsIndlY2hhdCI6IiIsImZhY2Vib29rIjoiIiwiZGluZ3RhbGsiOiIiLCJ3ZWlibyI6IiIsImdpdGVlIjoiIiwibGlua2VkaW4iOiIiLCJ3ZWNvbSI6IiIsImxhcmsiOiIiLCJnaXRsYWIiOiIiLCJjcmVhdGVkSXAiOiIxMjcuMC4wLjEiLCJsYXN0U2lnbmluVGltZSI6IiIsImxhc3RTaWduaW5JcCI6IiIsInByZWZlcnJlZE1mYVR5cGUiOiIiLCJyZWNvdmVyeUNvZGVzIjpudWxsLCJ0b3RwU2VjcmV0IjoiIiwibWZhUGhvbmVFbmFibGVkIjpmYWxzZSwibWZhRW1haWxFbmFibGVkIjpmYWxzZSwibGRhcCI6IiIsInByb3BlcnRpZXMiOnt9LCJyb2xlcyI6W10sInBlcm1pc3Npb25zIjpbXSwiZ3JvdXBzIjpbXSwibGFzdFNpZ25pbldyb25nVGltZSI6IiIsInNpZ25pbldyb25nVGltZXMiOjAsIm1hbmFnZWRBY2NvdW50cyI6bnVsbCwidG9rZW5UeXBlIjoicmVmcmVzaC10b2tlbiIsInRhZyI6InN0YWZmIiwic2NvcGUiOiJwcm9maWxlIiwiYXpwIjoiM2Q4YmMwY2VlMWNiMzM2YzlhNzMiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIzOGM4MGRlMS1lOTczLTRkYjEtOTZhMS04NDczNDYwMDlkNmUiLCJhdWQiOlsiM2Q4YmMwY2VlMWNiMzM2YzlhNzMiXSwiZXhwIjoxNzg0NjUyNzI0LCJuYmYiOjE3ODQwNDc5MjQsImlhdCI6MTc4NDA0NzkyNCwianRpIjoiYWRtaW4vZWQ5MzJlMGUtOThiMC00MGFjLWE0ZmEtYTc0YzAzOWU2MmUzIn0.fFD_hAoB9Bv2T9Y-lV18uMZkVaiAqptCdg_7hbjIZTTibuNq1gyIevlvQs4A3do2ue3ybrC6_VOXeCps-aSHOtK2ej6AKY02S4gSJ126eRHqPNr6uLQLoRULxYrJY7H6Gz34Q-fAP9WKIQ4MT2L_J_xLhyUublrKXyu85yrbHJ8-d8SyLWrKjmK6FtDi73emEl3kn9XUNmgt_ulrD-NyPlPqdUJi-O2JMYnw2NJh8zqCnByYOEbfpt0kSNXxcKVhbmR9-wLJhx0htvh9tUcArjjhTOjcHUBu9GzKbzXmpdBDC2wbyr7dH8UDQQf3f4bY8H9AE_y421l5apKscd21xwMFeveUwn0VpBc4Js05hbUB6rhPYNozbYIdZNzpfk3RPTMOJ577ru21ath5QMvUaEMLZNY-xvyJsZF5nlxHkxmcatlBdcY5Yng3VFyqe-ttvBPhsr_4OzZjJ9nuY0mHOzWmw__ud1ZgnXDlyefX0S-j_oflKPpxP-uStRr0UxdCZLvUfz-iy9sQkQUs5Hpkgb89STY0qsLIvX8d4B5ewYedQXA392v2N39HGcQDOXy_KEP8cO6A0FwDvefIRLMT2kXsvv-_f8Kg1jyAqYm0uc6DTxLFL5AZLXe8iyRj8ZrfyYjZ2WLLx-MkAeT-LzSBbDh0wPJkJHeI1UqKlUFVoaQ	136a24bf7e1894d874c96136c2e6d4839b2f742c38210d4778b17ff233c251fd	345d00922a34532e390203179d9fd49dcedbf026e3bebe73b46250f8d19bd828	604800	profile	Bearer			t	0		
admin	fbfb87db-4639-4c29-9231-9c5b03ff3517	2026-07-14T16:53:56Z	react-frontend	my-drive	alice	59ba9f5bf31fad1c8b78	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJhY2Nlc3MtdG9rZW4iLCJ0YWciOiJzdGFmZiIsInNjb3BlIjoib3BlbmlkIiwiYXpwIjoiZjNmMjNkMDcwZDlkYjk2NzIyMGUiLCJzaWduaW5NZXRob2QiOiJQYXNzd29yZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjJiZmViNzkwLWFjYjItNGZhYi1iZWVlLTJkYjU2NzNlNDdlOCIsImF1ZCI6WyJmM2YyM2QwNzBkOWRiOTY3MjIwZSJdLCJleHAiOjE3ODQ2NTI4MzYsIm5iZiI6MTc4NDA0ODAzNiwiaWF0IjoxNzg0MDQ4MDM2LCJqdGkiOiJhZG1pbi9mYmZiODdkYi00NjM5LTRjMjktOTIzMS05YzViMDNmZjM1MTcifQ.q8aW1fMR3myyi5M_b7uLPOourWSo0ei23L8NImYRvWUyS8p-yW3tPkLH84_9_XgTuTPmYBaTcjiuiSqSDlx8VeLw_qpqvephMxgLwnyE19ILF4Slxci_ygpbeF1FyGiRAyfoq7RqxomkrndcQcvo8wwS--dWo0ANa-K83d7N8cMMfUm0-l2dGVswr1dw7oSD9CDV9JRKOfxxXsBXKo3_BxZpk6cPWdSoGBMTUWKAxB5jGrfiX9fgLknGFRQOWIOpRQIq1I7y_55nA3fskMRNhVHmiJ6RDOhylRCkTIFNeJ1_1pvO6DULD2eM7q6NGch3TWkozUfdufh5Oks_6DAfuhVpOUoeZtZbmOC1IK_7X8ovLqVz_PDL15k_dr9TZ9PmaOOMalc4KBCClZAzdF9TnpMuL9Yy5AKJE5UKIURyF4F8RUy-zCJhCPsNR_BqYdAooqKmmlfYW-3uW8btn-ne30aKx5slSDLhpujYk7NRt3MGxuZLs__Fgv9WJ34wCZWUHfuT2_SoScdxgRjEzlSFRnMIyz33A2CT_Bbl2It07TEgoMGf2_QrqMjVFtkd0BTdMZEZ-1HAEWHRMryn5y50jP7hD2GNsfKW40ncDs3OnAonDEBvJKkm_aUtNF6gGELH6IKqp5EeOIafCReTPINFfF4BchP1TqW1IK5OlX2Y5tc	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJyZWZyZXNoLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6Im9wZW5pZCIsImF6cCI6ImYzZjIzZDA3MGQ5ZGI5NjcyMjBlIiwic2lnbmluTWV0aG9kIjoiUGFzc3dvcmQiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJhdWQiOlsiZjNmMjNkMDcwZDlkYjk2NzIyMGUiXSwiZXhwIjoxNzg0NjUyODM2LCJuYmYiOjE3ODQwNDgwMzYsImlhdCI6MTc4NDA0ODAzNiwianRpIjoiYWRtaW4vZmJmYjg3ZGItNDYzOS00YzI5LTkyMzEtOWM1YjAzZmYzNTE3In0.KjNSdvJbe0CMuirNrDy-TdRHudeqVIZw6afFHO-YXKBo--mn9s80ZM07O0CjnFPzV6dZwCur-g1aRgcpjqQVAx3Dl_cdC333Zz81ae_9xDziffUS8_iHASDfEOKRlgnbj0_7RkUTo9bqUYcMhG_qb2ItkjVbupt32ecWzVmA8mzxSam0s8Zc5ra_SOw-EREzfQe73lI9SYghYjwBp2QLCNU3ezJwDvqKEhJ094sP4aXJ_TMEZhmmokAb5xSY7CA3ERETht84o7bDLeIDeJov4ZomV9nqaOr8eeOnmO3PdSEmP_dMoh1NKeSZeCA_JsxZn6e1cEQ5_lJ2yLM0eootIYfPMBA9cJNTJvFSWn2eMNROithgdUQT4ym73FVbTj5Vi-J2mP7oa43s3wZ2_EO8rxz5pe_TOrsb3HBQHIzBzkxRWqTlnTaV_WzrJ7He36DOdUMNufeJoExUyZwoNke1fycEDAsVTht_Jdf173NVEbCFjVXXxijynt0xspxuyAPC0HyN2ZHFoStUAHunbW6DbppRaGkkzNTEBtmG7v9o5htEdrK3KPKivYcs4fHJ92MtXykTNJIvwH5_qeGablrCPd9DPkqbSkrEGRhTaHKfYt1n79sUPHS7Yc2La8pzUyphVPXtCro0GiDiuEm2Rra2bpZijuzcrzs4zEZk0Y_MyQw	90045d5d13c650b6a6b6b177c3d414aac5bcbdd64e6673089d668103a06f6596	f12e4bb82a4e31753d62837c608a08cd10fcfcc40068be76feba28b35c3907ca	604800	openid	Bearer		y0QwBDrrCbdV4Gl3SQKztXkym2JkyuiblWqXHE1oGXM	t	1784048336		
admin	2659ef5a-c987-4683-b6c9-376fde8ec6d0	2026-07-14T16:57:49Z	react-frontend	my-drive	alice	f4a684871a759d4b3f8a	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJhY2Nlc3MtdG9rZW4iLCJ0YWciOiJzdGFmZiIsInNjb3BlIjoib3BlbmlkIiwiYXpwIjoiZjNmMjNkMDcwZDlkYjk2NzIyMGUiLCJzaWduaW5NZXRob2QiOiJQYXNzd29yZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjJiZmViNzkwLWFjYjItNGZhYi1iZWVlLTJkYjU2NzNlNDdlOCIsImF1ZCI6WyJmM2YyM2QwNzBkOWRiOTY3MjIwZSJdLCJleHAiOjE3ODQ2NTMwNjksIm5iZiI6MTc4NDA0ODI2OSwiaWF0IjoxNzg0MDQ4MjY5LCJqdGkiOiJhZG1pbi8yNjU5ZWY1YS1jOTg3LTQ2ODMtYjZjOS0zNzZmZGU4ZWM2ZDAifQ.rrWyJgwnsTMhlVRk6btLiowCuxx9bx4DVy7mtO5D1HLDKp0QqlhchLXA7LVzMQHI3MFhy4ZTfzExz1iUu-SRXyRoQyr7Vv4BB9w2m5eH_is-encKBvrtRylOmxTbcR0wAc7elIh_zjbC4dFcLXeQdOZH7gZtlK6pDToMbvMUmSmFSGd8YgBwbcz61E-8tQVQuLdrhrkB5HLCvyExVWfu9nA92H9-2VCDNY5YFpRZnhdiL4qbzylILVQ3RERoLMtHQxau7TT6eA_rWOurniU_95tXvm95ATX3b7attgJ6TEs_cgR1jTvsZxvYSdB2L2Km9shEg5le3iAl_ElZY4T5LTenVNO1LkDfvqsTcvYaMCARZoQyMLmDOrC1qCbisVa3iRzBgeU1Ce08RYZL7oNM9Au07oPwVO-gBO8l7e3FmWTjkWONe9967WcujBrapgyTpd4YeKVT-A11d41EuwLwu9t8zDo4LcTT87_SxiPzjmqRLcpL0WTI8N0dzWZVafUPE8anIdvFZcyo-6MHPB9gi-SMYgvAfN9rjNSblp8BClPa2b-sXtgREJcT24VFOnyuwzet6GlUekVJimwVL82Y7pppxItaeJvD6Dub53q-9I8H1De3Qzo2OCVuYSTzkBbCgL87GjauNRg8b79GNmxqTCciQz9xDCDf1n2LEUdTM7Y	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJyZWZyZXNoLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6Im9wZW5pZCIsImF6cCI6ImYzZjIzZDA3MGQ5ZGI5NjcyMjBlIiwic2lnbmluTWV0aG9kIjoiUGFzc3dvcmQiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJhdWQiOlsiZjNmMjNkMDcwZDlkYjk2NzIyMGUiXSwiZXhwIjoxNzg0NjUzMDY5LCJuYmYiOjE3ODQwNDgyNjksImlhdCI6MTc4NDA0ODI2OSwianRpIjoiYWRtaW4vMjY1OWVmNWEtYzk4Ny00NjgzLWI2YzktMzc2ZmRlOGVjNmQwIn0.glZUjxvmRkmw9QIkZrbkIQx_EDJ-2vj2tGXTu0KxCAPdsMsy-2jZHG13y0cdxOCmlYxKrQtQxdSFu3T56V7tPrf2OeekPKzSk2BjiVeXYmcDMEIcM_K5ZilMGdJtemuYf9_b1cBry8jEjf6Zj7cbPJs4cnTIQvoVhV4Cp7pFn3iCbR9ll9z2Xm7RpVhS2dwVhvjd92I7vM4-MS0An3xHhnMAZCE4f0fLRlTP54kg5_owxoucl7gA4q0UkYI5bQbnqiuN7RRiuc0JlmQy7sfCK-oPw45uye6V7tC3N4rUPrc7QMLAATVDy8edD5-dcrVxfjv2QvVO-dEjJ_hi9-wRExt-YHaAeoChah034wgTE4x8ZvGd-fw-hHdmfR5DPzQyCjH8tMBYwXXwE9mHlwd3Sw33-NI9hgVtq1ryOKWB2kr7Gic1DzeTjwCOxDXDhq5LMxdhDwO2klM_tviBKhuBs_Pf5C8WavWHo4MPKdridjVwwR77sQPxool76EyAwSE_zNhqmx6bxTzRZFYXPBmvFOjp-GQJyRQXV7jQO8pQWbnb_mhjn5nbypoMWnzhkV3y0XuDRZtr5ZdcQ3oYfYslFDu1zukssYCNG7vxQkqUyPsgrmOqW3KtwGSwV6KkR4G_Mdx00BUmVe7w4c5owD22DI1-HP3crAsi7E0x4Jz1SuU	4df1461045f622de82f78b501ecd424c030c87cc01800bfab9b97cd371ec3a01	7da0bc852aceb24ed90ed2de35e3fbf6623dde70ff5c3311458e367c8b9e291e	604800	openid	Bearer		u_xuetOdLrb4w6gOqMhfNUgZG-TCcLMYx_jq-b-i244	t	1784048569		
admin	aa23feb5-1ed7-4ab3-ac90-eee91c2dd2c8	2026-07-14T17:00:35Z	react-frontend	my-drive	alice	cb233b7b561e52b1b0ce	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJhY2Nlc3MtdG9rZW4iLCJ0YWciOiJzdGFmZiIsInNjb3BlIjoib3BlbmlkIiwiYXpwIjoiZjNmMjNkMDcwZDlkYjk2NzIyMGUiLCJzaWduaW5NZXRob2QiOiJQYXNzd29yZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjJiZmViNzkwLWFjYjItNGZhYi1iZWVlLTJkYjU2NzNlNDdlOCIsImF1ZCI6WyJmM2YyM2QwNzBkOWRiOTY3MjIwZSJdLCJleHAiOjE3ODQ2NTMyMzUsIm5iZiI6MTc4NDA0ODQzNSwiaWF0IjoxNzg0MDQ4NDM1LCJqdGkiOiJhZG1pbi9hYTIzZmViNS0xZWQ3LTRhYjMtYWM5MC1lZWU5MWMyZGQyYzgifQ.wpboXlAb3-Rrm3Vj-hCriWVN9BReV0EbslP4i-LN39xzbGg6PcRSdxeMx55gFGt867l3RdQN2WOuUcdiRY8M1O8u4ixaDnxr8pv0_dH9Mg8Ybou9DQL8Vu7x1jN-5NP2NbZu1o0uPJDlVDPjn8u9PI1G3dntuaCo7JPAUsWJU9pIP9VzC2DlqOZXzQD3sBmySKlkiD3mdh4jrn_PI3EC4YxTY7pDp4buctbRixKWS-kMs33xd16FKVw2UjMNbKH2bE5oEXGF_So7uQ6HjJVitkBtdf0TPjfw1SVucZm_o0XvhVWw9nLCJgg8MOWnptYMkicrWzinOq-Ii4YFmWorLpFxHg44oVZrfcOFvqLM_XWKl5u9a-66YaVZ83RGeKFIetJVYFWbMGak9bwe167QjJmE6Ek7ZGNGycBgkDRXtaD8PAHx7xyvjXstABTI_K03DsqJhN1N-oTrxc3A3Ae95eLQeyTbDyQxsA6518_1tBhg8T77NGf9oAd60LHiRqhvlyYADOTVbcyv9QlgAk5yycTJMFSbF9UivxI1M0O8riMub3eqRjTqH9R4VKT3ItpvLeGXxfWak0KiDgJABQzKHFbZOtXTpc4jWoRn1PZxqEuP_9tjSEkFV1rvUOW39XtGl5a9h0LYrkIhwsnLlmUKTGlgDyZmzoM6EzpRmiGR5ao	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJyZWZyZXNoLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6Im9wZW5pZCIsImF6cCI6ImYzZjIzZDA3MGQ5ZGI5NjcyMjBlIiwic2lnbmluTWV0aG9kIjoiUGFzc3dvcmQiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJhdWQiOlsiZjNmMjNkMDcwZDlkYjk2NzIyMGUiXSwiZXhwIjoxNzg0NjUzMjM1LCJuYmYiOjE3ODQwNDg0MzUsImlhdCI6MTc4NDA0ODQzNSwianRpIjoiYWRtaW4vYWEyM2ZlYjUtMWVkNy00YWIzLWFjOTAtZWVlOTFjMmRkMmM4In0.cW_gHBzPRMwh5wdJ8sO0PFs5VYbrbWPfKlLY-VIIy5TVx0BMKfKa9FL9NmGP7vzSNR8QKHB6Siw-mkWPubaKlJ_5rLNu24iLMVBuZauePucaM35Uk__J2HY6eNQdeTKgQPGhqYN068cNw6nWyYqIOYKxF2hMJoH3R2KAkQGmSIW4GmPakkBTGQ5NfjRkkv4D7VBdsloqjMfopKFR5o3FjVK5tATh0PDpupUzoIUioAC3zOMaTXI9hu7wS3WiVWvdeEZ6csi4IjIgiQS_UoIbqi8uUDWjVtqi15f_AU3AjKaSAjaUD_Mw_ZjOshJCAT-DTp-4Aa-KEkA9lNA5rOO_KkJUcT8G713KdvOgam5q1KXSiL531pNUtWeNQv6wRkG6zYLFKl68tKac_znwsfJVmPEQ6qCm-dNeth9k-32GI-0t5H3-RxA2el8UKz56wQXATncQENXoEfQud2kLFep4NLCR_lDulBUcOzQM9neQBb4FQw0d8qZdTBsZz48eXSOrFAoDN-7D_wsb4wnaDa3EdbPoXk5HzgbcO4TCWuTF6RErSplUt6aPXEJFAfR-3DykGmb4DeO8cigXLemUL1GwJayqwQ4NpDj6xjhzTXdDaRijiMh7TZvziM6PqBvO5V7b9MopliVQEqbpEmL7qIfKi5zote-do8lpyvYqt2z6MLM	02a7284ddb29913015cc87f5417f3f2e5ec2280ad12debce5af0b37bcb01341c	a4ba36771d35965d2d3f857af3ea5e578ad2c1c72ed83ad8bacddc6abb670df2	0	openid	Bearer		scVmgZigRjEKhvT7fx_OnvVe1ZYZB_FpAIbsIQ53duo	t	1784048735		
admin	571308b4-a5ce-4bf5-91e9-e8a46cca9276	2026-07-14T18:27:04Z	react-frontend	my-drive	alice	7934da7679d07ca37e4c	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJhY2Nlc3MtdG9rZW4iLCJ0YWciOiJzdGFmZiIsInNjb3BlIjoib3BlbmlkIiwiYXpwIjoiZjNmMjNkMDcwZDlkYjk2NzIyMGUiLCJzaWduaW5NZXRob2QiOiJQYXNzd29yZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjJiZmViNzkwLWFjYjItNGZhYi1iZWVlLTJkYjU2NzNlNDdlOCIsImF1ZCI6WyJmM2YyM2QwNzBkOWRiOTY3MjIwZSJdLCJleHAiOjE3ODQ2NTg0MjQsIm5iZiI6MTc4NDA1MzYyNCwiaWF0IjoxNzg0MDUzNjI0LCJqdGkiOiJhZG1pbi81NzEzMDhiNC1hNWNlLTRiZjUtOTFlOS1lOGE0NmNjYTkyNzYifQ.YfWC54VL2GZHSkX0RFNztC8PfwtxTUj-SyFW-ccrsPslL61JYf9TQ_yXwSUs2-6hQ18IoiS0DF8DbSnx-M139pJi7Su5yVHtfAAC3yQMTBedGr_PTUVO9YhVm43EXKmmw5J4-FIsuAGt8_PvDQ1MRIObrKkrHSiXP6TPFjLXz-djDpas10P4RQvgRs5-JHpia_RAfRSKj10tt776ECGttOyD2NYx64yfA_xLMjcUHaE5wy4r5cgF9IO9S_MjTS9MXJ1MCZIJjH9Ke6YoFCBACEMihDCCkURARUgy5CSz2u3aWMmby6tBsbwX8tu37XTcUaWRMI28vMyOZdBXuO4fHsVn4CaffP25OVftkj3xyoxaOPLGsEo2KoYAYlt8Im49M_JfkA5hRfFLScfMNK9H0Yj00R-pXWu7jQHha3k-hkRD-2VlgZTuBklj8lE76zR3PLajVIEhuYGlePipOwQEJgabnzhEQDlgxBbBZc1whPTuKl5AtzlcZyzQvVCdpzLt6PvOF8DSKJcvUXV5oIhHeLe-sKhg6BB_Cyf8sPLtITyS4sHdadCL3S_rrw78ebF56Nx6e6meEID8QTOcQwfKWXSB-XB0GNEZrAObjj_H8HNXzRe8_jo-6lnAoYlYQJoelJv-V6cXFJpIBXMFczoiW5NYSLv9fCEGMXboFgs4_ic	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJyZWZyZXNoLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6Im9wZW5pZCIsImF6cCI6ImYzZjIzZDA3MGQ5ZGI5NjcyMjBlIiwic2lnbmluTWV0aG9kIjoiUGFzc3dvcmQiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJhdWQiOlsiZjNmMjNkMDcwZDlkYjk2NzIyMGUiXSwiZXhwIjoxNzg0NjU4NDI0LCJuYmYiOjE3ODQwNTM2MjQsImlhdCI6MTc4NDA1MzYyNCwianRpIjoiYWRtaW4vNTcxMzA4YjQtYTVjZS00YmY1LTkxZTktZThhNDZjY2E5Mjc2In0.JrxlDq36kc92R_E41lfNq0xUvmG_-j6Aox6bJgtnA9J4mwp82xGaU-vKMshOtJcQldKOs9TYY1_AoLuT7BHY4Mz3gFH3owWCCYw2iu2eW1pGNhpWcSJjywSJPXHzW3T_l3GeYXCR4oHQn9dD5D0zD6qwFxojGRkaPWTOup1ABz1C4DLCEe5D_TdJtxAt55LKXSUTR3PLJIgGpDdarSew-SzApDE5m6R1Fxkgo4Mh-nGPc-9gipYdnocNwm1hTK8ZWLaHqHFYzWm76LNAefbY4R0d4RG_z9_SmV6BUHigXmfhMfzT6i4ReJKSTWiF0469zCl4IChgwMn-OnVNuQE_YbqKaiWW2iiAdVLu6n9V0uQC2j1SFGg2HtSSMZPXBX212qcKWgI_5qwLL05rHgjXbq8Jcq_HF1oi2K9CAwv5CjbhIvfdHJqceEnmqVBQChpbJqNsUUCctX3hO60v2QRKRCUi2Oyrfz7gVE-9yRou98-YF_DRC1QgKnH-nio8r8zowt3a2kaiPCES_Ln2kJwRG378jAmSKPAQw4nvLl6ig4DV1akVpaXfasx6zPkAYn47NbjXAJw8a-e_LbUuIZIjXBvH8ULF9mhOKIW5qbLqz5glpp8trReDR0hCjfs14faRI1noxh5Tzsbfv9Te3qdDUXeRLzYkZZffK8hnaxKZd2Y	d454eff9c2b3f39f90d51d6802af6877dc095a69ee3f58cc1e58a29d1b219b82	4c2da9753a4f0663098cc1acf8d5958451dadee5a837f736d1a0fd856457e465	0	openid	Bearer		xGESXP5UWwa7awfX1vvd7LwZojXOL1c0jvUsoSfsDso	t	1784053924		
admin	7f4a4446-f2c7-450e-b9f0-3b28cbac5038	2026-07-14T17:49:24Z	react-frontend	my-drive	alice	3e461627a56f7df5b26c	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJhY2Nlc3MtdG9rZW4iLCJ0YWciOiJzdGFmZiIsInNjb3BlIjoib3BlbmlkIiwiYXpwIjoiZjNmMjNkMDcwZDlkYjk2NzIyMGUiLCJzaWduaW5NZXRob2QiOiJQYXNzd29yZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjJiZmViNzkwLWFjYjItNGZhYi1iZWVlLTJkYjU2NzNlNDdlOCIsImF1ZCI6WyJmM2YyM2QwNzBkOWRiOTY3MjIwZSJdLCJleHAiOjE3ODQ2NTYxNjQsIm5iZiI6MTc4NDA1MTM2NCwiaWF0IjoxNzg0MDUxMzY0LCJqdGkiOiJhZG1pbi83ZjRhNDQ0Ni1mMmM3LTQ1MGUtYjlmMC0zYjI4Y2JhYzUwMzgifQ.XWb2loYgIEViHqWG1Wa7lc3TccgdC9nM0C94BoMWmmIk0_A3lRntasGqWxk--9_9ndodu1Vb0tDRF2dyZ5nogGm7NP701yoLvIdAJ7j-92344bt0u3x3hx9_P4gwbYTdMeItQLpgR38I7tX8wJx0xxE0j6sF92ufSSaZNQXoxpzz9Bt2EdNP-lo73W4osXeQCeNnHDY5d6eNwy4v7FrgkriY9aYyzy-SThsP69WxTtG--H-thZQdTmmsvVxFRB5_3liIlsMe0Ij1Ym9vlBUPtxUtVDhm7NYV9nZBUupbrDbx12D8BY_59KzHoLHbE0EWpDbUGTI2GoWm6vt3WGL7Nern1yReljG8EnKKxmj8oBXt-vxKjWhB3Lz1QLl9ZxAFRJ6peaj1BYqkAxqzRXbTi9cjJhwF8RWi3v69yLgn_1KGEcQ82odCz6gQ-012wbiHKC5jxmWnMwOEg6knUb7jpG63u8UWp53Y8rl_54o8e6-rnBU-etdaDd_2AiCLRGUe8uO274PGFCBzsQGWzw-HjEypk8N7v6xpKJViSOyuCla8c-pzhOAhx3IaTQduA29Y6kHYT7LxybW0EthEvGudQgL9SZyGZayyjjyPkCqDucj5frHA_WLElNzz5BAPoJM8TVnb3CuONmG-WWR_JOgpN2hH-bRzVTF0G1UoB_cdYl0	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJyZWZyZXNoLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6Im9wZW5pZCIsImF6cCI6ImYzZjIzZDA3MGQ5ZGI5NjcyMjBlIiwic2lnbmluTWV0aG9kIjoiUGFzc3dvcmQiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJhdWQiOlsiZjNmMjNkMDcwZDlkYjk2NzIyMGUiXSwiZXhwIjoxNzg0NjU2MTY0LCJuYmYiOjE3ODQwNTEzNjQsImlhdCI6MTc4NDA1MTM2NCwianRpIjoiYWRtaW4vN2Y0YTQ0NDYtZjJjNy00NTBlLWI5ZjAtM2IyOGNiYWM1MDM4In0.h5hgJyc9xEsIhYp15neiCmOkWxUpJZ06-XE1Mg4o2ttOdcomorQbZm2IXsYTvBB7PhzPQediLlBiTmO-QHd43LiEe6UrV4lr7QfowUP423Vxhmk8SkiFUxjdLIgXp9e96OJwIt49YMH8tRgM5N9m0PMvtQSacNPsueeyRobFxdAVhhjgVyBIfEqNXqyVU3LGdoL5F3Z6_ooI9-8A-qGFIGp3K96cxHzeNt_3B_zuOD2ec4f9Qu1zy_0X3Vw_tGjMXZn9y4Ib0ViIzz5CUR_A009cPmCpToMcchztDDEx_zbR0UUkfbwFZkgvHaDkS3YsiGfz22Sk1EwNYpqA-GO6z03XZeZw8xldED6yw8iWWtXnDZ-GS5t6kZjedugmpf1qV1ZC7Q5iz36wS7nsnAlgI9vhTG5MxOVUv3y0Swb8FSvOuG08jMy7F9-DhmhyFc05jUoFePxbuHe7kei8CXXsLxdOlOhUibbef9UsTiZuY5m1LqmkS9Oi8i4g_bI223IgBbO3d1qjVb5dUQj1CEQ5jFMybZhwONn9k7ogG21J483L7oVi1z6lVwgGqPfnL9LWOiFLWguOhRW8GZS7VP-XNa6L-2UW046soOAYZkoOs2uzOe0x_IOVDpdYyZYRNAMwk3B5Z4ztT0OVymkfuv5IEnpslQY1BEl-wq7nRMvmDj0	dde9ad8b69c1b54ec187e0609d4191d60d092cf691dca96e84a21b03aec9c07f	8de6d3562ed26b5b4b5f4916e0474003a7fc60ba801a3cd38d4c3d66913025c5	0	openid	Bearer		8_O_anCB7IGkOFgpmWPLqDRVJoWXUr3JtIKEQvRzRZo	t	1784051664		
admin	bf1a2b4d-d0a6-4d40-910f-35a959a08377	2026-07-14T17:50:58Z	postman	my-drive	alice	5e68fe8cb350fa00843c	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJhY2Nlc3MtdG9rZW4iLCJ0YWciOiJzdGFmZiIsImF6cCI6InBvc3RtYW4iLCJzaWduaW5NZXRob2QiOiJQYXNzd29yZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjJiZmViNzkwLWFjYjItNGZhYi1iZWVlLTJkYjU2NzNlNDdlOCIsImF1ZCI6WyJwb3N0bWFuIl0sImV4cCI6MTc4NDY1NjI1OCwibmJmIjoxNzg0MDUxNDU4LCJpYXQiOjE3ODQwNTE0NTgsImp0aSI6ImFkbWluL2JmMWEyYjRkLWQwYTYtNGQ0MC05MTBmLTM1YTk1OWEwODM3NyJ9.pMrsMzCxCJ_neJF5BurUBjj_hszMHP4z_5_h1CxgZPHyXtHPFAh8SHf9qtSmFAGXuUyOmQdZAix8fTJjCXnhZFVuv223oYnMFhM5N5_e6ZleXfArR6y5k4uGgDaC9C4mN40TUbR_8n6PTZ1FBHAysKGVXKC8llYDlAtd9aJibJNZErZbDsrRpslK3kEoVL5oBZ7styIPSseOBh5bXDHsaICmq-aTgT-rvGjh2IWul_fsi-uzAU0gqwt17kbulDD970rxNmEwuBkf4lP3kBS9D7esrhGebLQvvDTU7mtNvV3p_Ih9PJj01xf6px0GHYMXlkIYQ3iYcle03g0Idl1XqvgI2vE4F_-g_gO14_zPblI3RUZ3uo7ptELILTVnagB1lSKgbceCkCqLkMFm3eTamOcghih7tBvIC1K0dX5epvm-3rWnwyIjmX4ZmCAlyBvdRFqeYo7pqCWkC-NL_3NkgkCWgy3ExthAjMpCNsJ_UUaVl0fMiYanrIeIhMfx-FSebXY2Wbu1GKt44ulJ65WwPcOxhJCDb8DSOBemhaBW61t0_bUA_uVzfz0RxHcmiLv5civjN1QjaGJRRqrEMKXkwXG0UlxQW_EU673kLHHUCRscCF41GezP2N8g5cQONkklYmrWzFVQ00r6w6h41lmWdfom_ER569MeNIXFKhZRhQM	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJyZWZyZXNoLXRva2VuIiwidGFnIjoic3RhZmYiLCJhenAiOiJwb3N0bWFuIiwic2lnbmluTWV0aG9kIjoiUGFzc3dvcmQiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJhdWQiOlsicG9zdG1hbiJdLCJleHAiOjE3ODQ2NTYyNTgsIm5iZiI6MTc4NDA1MTQ1OCwiaWF0IjoxNzg0MDUxNDU4LCJqdGkiOiJhZG1pbi9iZjFhMmI0ZC1kMGE2LTRkNDAtOTEwZi0zNWE5NTlhMDgzNzcifQ.qXo9wX3fXwWwXjPfziKD7I6dS8jmeLJx4f_XMMX_Q1oQ14XoZGOC3WW3_T1n5Z10GQcDR3rO0Z4jB9UDuFuY0J4XZ9VY9e5KxqdRQBXp8-YIaC8agC0SX_M3EgLdK5W-HAJ-RONNgDuBTqQeQsjMSevo0a6KWwHye05OkDTfBbY5Z5hCEtRwP8BZSlH039X0WvE-aN_8By52a7CclZSenuPsdKZoETe42Zhe9KOwK3e6BcvRvoyNZIO8QwFUBmEraWztkt2m2CGTtKdo46Bk7SlDJqSEBFhCanldw-b_wnzHl3vnZFSZp9pTjvZ0HTBSODEuwl3XviaSRX6IzzCRBRpWqOz4I0xNT8Z3ZljD34II_7qZb21cy58B5ni3q_p5bCST-wQivHEfL9CxuMOLNmfnsgzhZKgTiYLTkoOQvFsNloE2-98jat2z_Q1O_aDD1cKp2as0IQwZlduqkZNDlb6fiXgYRIHGRame2z-mSXsmfb8EczpRUz1czSf9aLh4B4qrh4WG55ABLkeyOKdRBYzl9L9TMuPcdneckoF7y96tN7cQr5nRSs1PVoYBjy2YUr8CBACZlY2kyM8WH-gLXpKFTaNr9WvOKrwByUXrI1CKLl2f3yp5Pc7mqfEVPB2QVciE-0lA91oAbDhsn-W9W8E3J3eCMFMtT1kR1jc4j5w	799164f4496a6bd62d5bde579e1e5e8b52e00774acb2eaecb08c6f21ad9f8187	180edf1353530d03962baf9869285b070beba3dbc1ce64c2bdf75613591d0b1b	604800		Bearer			t	1784051758		
admin	011813b9-67af-4d37-be72-ac88a7809db6	2026-07-14T17:51:21Z	postman	my-drive	alice	b24c152197463f8f523c	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJhY2Nlc3MtdG9rZW4iLCJ0YWciOiJzdGFmZiIsInNjb3BlIjoib3BlbmlkIiwiYXpwIjoicG9zdG1hbiIsInNpZ25pbk1ldGhvZCI6IlBhc3N3b3JkIiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwIiwic3ViIjoiMmJmZWI3OTAtYWNiMi00ZmFiLWJlZWUtMmRiNTY3M2U0N2U4IiwiYXVkIjpbInBvc3RtYW4iXSwiZXhwIjoxNzg0NjU2MjgxLCJuYmYiOjE3ODQwNTE0ODEsImlhdCI6MTc4NDA1MTQ4MSwianRpIjoiYWRtaW4vMDExODEzYjktNjdhZi00ZDM3LWJlNzItYWM4OGE3ODA5ZGI2In0.m-LHYNXxzz6IMmUVV06yKYtqowNjfPCXeD60uLj6QDOSEZzoDThp8PbNGHaHlnjH7hILMi2aB6DjwsM5loFbBLOywk-RNwffVBTtDQxKiTXUJ3GLcnUNoMaqrYJVIJTN0aU9UGguZBU9uRmJmJCQjtSJ3CHfxwrK-OafY_ZCEtLrTjjhy7fOZFzVnndqZhnw-CPWBtP2I8b95R4IsMLFpt4pXd8ipQleLw9LvgBNfb6RCEzbWc2fbhvVbwR5YRwraHna2cNwcODfD5irErG37KxmAtmsWPITqz5dWbwwKza2Elm34_fzIDqoFHqIxTrpDznYLzayFeU88bxJ7EJDoCoXHfJUjmw4I4qQcb1pn1_BTihh9C2C2qJGGZAYCsfNmym6OXXA0LHqFCIyL_ye05nJgwmxLKJT8svF5zwnhJ2xaN2LOpppVC3i3AIlIxN1lmUcysgZ6k0t_nU-QQ6Wu9NPQYXutgk5MXyAcIHcyy_GQk8tR36p7xKxHVgv7yaSiELj58JLgQf7TeCf7WgnZNjcIP8TnOU1cRlnZrTCLMVck-kVyDCBzVz1K8JbSPc1eir2pEwUOxRgRKc9PJ9ggRaaFN7eKoTSQPRSLj4jYp0C-Vhhdot3k5XoEkxn3E7JPgT2OkTKV9cJb7x8R8egoak-ZvLeGHAiBbq2yBv9Oes	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJyZWZyZXNoLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6Im9wZW5pZCIsImF6cCI6InBvc3RtYW4iLCJzaWduaW5NZXRob2QiOiJQYXNzd29yZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjJiZmViNzkwLWFjYjItNGZhYi1iZWVlLTJkYjU2NzNlNDdlOCIsImF1ZCI6WyJwb3N0bWFuIl0sImV4cCI6MTc4NDY1NjI4MSwibmJmIjoxNzg0MDUxNDgxLCJpYXQiOjE3ODQwNTE0ODEsImp0aSI6ImFkbWluLzAxMTgxM2I5LTY3YWYtNGQzNy1iZTcyLWFjODhhNzgwOWRiNiJ9.ZzUZ6Ied6KUI6OCuReuL5mpvDoInqSNXINQjcYaSVZT8FD1PePymgMozePdeM5etMvvxQkN6kD34tUiwTFPaj4SoefPl4vRVMbF5MksjK_FJLgqITfEyvZOc_WgWr0RRnsajgfFCFuG1MG5A2QF55-kBjeOuU_1DZp4fD4qF6VkaW5RYoOFBb_DRFgNbJcUHZ08Jj9-ifMp9knkA6kljmTnRr6umcqXm2-dC28_Jo_MlXDRmp_NA7feGcfLq8TB9LYwWu84zGTAoVS0kQ-LoLZxwVxNEanrrwtObuETIcWVnkC_-ngtglyaLp6E_S5NkqE81hzt7IJKqiN0QYmtDFIt5Nh7URf8pH7GZXfTIR8u3dlcVdRgkO_bMFSGyX8Ln9a7gTEOryvWiHfMXOllcss1SP3c6MITQ7e_VWRz8Gc99IDkA9FBq35P1qtM4poG0L5-_5towYiAn-K7QrkvipWsZ_-yavymcnsKZblLi8K_aXeqxsavFkDWnkH1elmHdR_3987c48IwEEuBrKMm0UpAiqvrGI2OdElTSgPEXAZF0SlX2Z8tehvZTqrVhyKBrtNO7lYnaJqnOpjGtmWzaM84Cm7lNJMeov0hsiOGaEoHpCOILjjL56-KiIieywsPvjxschSyb4wmOYz_s93EYZE5rvLWPeNnJOJbBJrY2a1o	48180ad5c1200a950581fadc06a6eac2ffd3537f9f507fd963c4c57bec150ab6	3efb0401f78f664f548d5876531aa76a1127a40c2ab2ba115578fa792268d1b6	604800	openid	Bearer		VNIBkjXb1S_d_tuwnL4EHxIZaD43bhnPnxGMq5tuyTE	t	1784051781		
admin	bd8b8ff2-7750-41cf-a1fd-d08e828674d9	2026-07-14T18:19:10Z	react-frontend	my-drive	alice	41b58c42e7cb84e13d37	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJhY2Nlc3MtdG9rZW4iLCJ0YWciOiJzdGFmZiIsInNjb3BlIjoib3BlbmlkIiwiYXpwIjoiZjNmMjNkMDcwZDlkYjk2NzIyMGUiLCJzaWduaW5NZXRob2QiOiJQYXNzd29yZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjJiZmViNzkwLWFjYjItNGZhYi1iZWVlLTJkYjU2NzNlNDdlOCIsImF1ZCI6WyJmM2YyM2QwNzBkOWRiOTY3MjIwZSJdLCJleHAiOjE3ODQ2NTc5NTAsIm5iZiI6MTc4NDA1MzE1MCwiaWF0IjoxNzg0MDUzMTUwLCJqdGkiOiJhZG1pbi9iZDhiOGZmMi03NzUwLTQxY2YtYTFmZC1kMDhlODI4Njc0ZDkifQ.fco8I1pOUYppnXQfb5d4kAq8wRNl5zIrijZtq32R2FVpwZfUcjcKHdsP5i5n6krHXrv0MQt4Vlj23QFC3mxVZZlIIJg8D5l70m_w4CsTRff70YjRQn3T7taGBCRev2u2LHidHnvxnNwH4R-eUb4TkJhOgE2JQJFAYPWWROPEHTd_XfHT71he86oIvZUpT3FU9jbmgzBpW0jh00QS2LCfoMDl_x7f773ucD5QNtpDENhF2AXc9VfLZHUyGSjnQpEZL0sSpfFBV5sabXvDzQrhxig1HSIZp7Ozn-5GUorhMmyhBkkqyry9rMvw4n2r4sVBnPAW8AkeNgxwBCiVGKnXpRPH9yoLr79qg_1JjRFB33qXyxo7O1GB0tKGs3b2oo89LXlIoxYXlG5VTlmBZLQxJz-S3_z24aFNZMk_Czsw0rL51w03WVHLHNTzE2NbZgy8mQ-kmNSzF9BHNVtHen9j9r1Lni590vez5i9KbWScAq7w6I6cN25qs1iGneGCCAKrH_VgsPzp9Patf89PHSE5fV6VzROPJvtQroZyzSFbt8oIcGaFw7VuDKBW6ckGAXHvG1gKvWd6WRnWRCuMinQ2auLmobSgkE90JcS71Xe2BYh2Wr6ODOEscnk7UxBVHhI3cZ6uuByTP33o6oGkMUXWuJJP1y6GkjR7HnI325ZTHFo	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJyZWZyZXNoLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6Im9wZW5pZCIsImF6cCI6ImYzZjIzZDA3MGQ5ZGI5NjcyMjBlIiwic2lnbmluTWV0aG9kIjoiUGFzc3dvcmQiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJhdWQiOlsiZjNmMjNkMDcwZDlkYjk2NzIyMGUiXSwiZXhwIjoxNzg0NjU3OTUwLCJuYmYiOjE3ODQwNTMxNTAsImlhdCI6MTc4NDA1MzE1MCwianRpIjoiYWRtaW4vYmQ4YjhmZjItNzc1MC00MWNmLWExZmQtZDA4ZTgyODY3NGQ5In0.Tn-dWzJRNw_CEiahoxEVm0jNsCk6NwbW93TvMnRnY4sGCRCGCz3U79sdUmB51L1DI3sDFilslZ3F4LUVyxrc2JDOS98ZFh8nhsrAOehGvZ8f60fSr-ZOEpxstscPwR3_yxeNRw6GdiDMGPUQ8YSpZBBbipRtyWb7Lzlms5UZqO9V_MK6K1QMeCLXdiPet8kJjDD6E0LkCWaVpAFcyLf1ZylS9aLP0nQ0p0wzHX0UcnVKVw4s4cXlzP2ylIniuuArG6fUFhAY9lfRKuhe_DsWLkOAq_aebOeaeNIVnJ1soLeXjn1GHez6O8NPBgAKJNTCC2Qy0qIu8Q-b8q0ciKzPyoJan7pExiHWDCj45Z3zMG6sZhHJUd-yVbJJKmgcXCD9KwM6PgAKdrkWFuy7d423vsO1W12HGpFtbgHOW3Kq4o8wGV2GRiXVfxjFdxc9IZnr66iCyBedseLpLG-IEeZGYkFCBvLTSVzSb8fiid1nW3kZkT95UeB6ESl0iu5P6mNYfknDdN8KlZb9b0b85BIZg2yiAHRo10FOfJObaZY17l306QBrkJmCumONCQ0LnWhQOcWBJkBza74QRM600i-_KaAfTTtPTSFCpcrayWiKUW8JdhPsSOdjjxnS3y9zCHj4CSgEuB8SLSVrsmE18AIjgGFyJD1lxkVlzN4ptK6CoOY	745e5fdd831089f549194571592d8cd0342c7fb74653dc97f67e535606ba7213	11bcee1e9e33d39983dd3b36f64eba18be0cfe74ab849c98fe8569901214a81d	0	openid	Bearer		dKA2lu976eXhKhe93geA7fj6K0XYYu7YWMLtosVLrIE	t	1784053450		
admin	ee500014-4cf7-4d9f-864e-3affbc72f41d	2026-07-14T18:27:36Z	react-frontend	my-drive	alice	6e0b692c921297c3fffd	eyJhbGciOiJSUzI1NiIsImtpZCI6ImNlcnQtYnVpbHQtaW4iLCJ0eXAiOiJKV1QifQ.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJhY2Nlc3MtdG9rZW4iLCJ0YWciOiJzdGFmZiIsInNjb3BlIjoib3BlbmlkIiwiYXpwIjoiZjNmMjNkMDcwZDlkYjk2NzIyMGUiLCJzaWduaW5NZXRob2QiOiJQYXNzd29yZCIsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCIsInN1YiI6IjJiZmViNzkwLWFjYjItNGZhYi1iZWVlLTJkYjU2NzNlNDdlOCIsImF1ZCI6WyJmM2YyM2QwNzBkOWRiOTY3MjIwZSJdLCJleHAiOjE3ODQ2NTg0NTYsIm5iZiI6MTc4NDA1MzY1NiwiaWF0IjoxNzg0MDUzNjU2LCJqdGkiOiJhZG1pbi9lZTUwMDAxNC00Y2Y3LTRkOWYtODY0ZS0zYWZmYmM3MmY0MWQifQ.NJNCq69GyBM9nvWqg0yySyXpWACjeoWZGPwv-MNvn96acSburOdqFR6nqtHhdJyBmoL7pL3zCGjZIRck4cK5E9ziUXTkkHDsJTlJAtA3civRSHEvPL2bM-RdJgTKBffwK1pnB5IsjAcG307oTz9xjoj-25jQ5oKLRxd8VV3Yk0e1_4J5Fr12FwGZ0htj-tOJLiDEEyiFQWRsk9JCdWuBb4HWYA93oBRf0vhWG79L3PAtM48YsZSDUZliyUAHgddT_FO4YQPmU0vCpUvjDBfsuyMpJU0EzdQz08EkQNp6Yi-W2AUGbkfJJJIr00ge7z1dyo3nwdOVx0gry30GvnzhoxUWWMAw5faNhHj448CX7j4PJTTMbX0L3Y0jSqL4yjGx38p5qupCc2Czcwos36bvh4V5DT10Vm94XDHsWfzNis4PqfuY9_SZr8hd3rrD2lND2z0C09GwfRUtGLJU-YcvDxGrn_9iF6FmPWp27HCcB1kFEoFaBzilTt9EvQGu7PJpJHyQ0hi5oeYT-p02kaZtRCt3Hs9guIx6w3Tz_s_xfqtjCh9hOWiU2wIr_dRCT7AKAUw9nVAIk_85qKU1hSODSx719pHhmLIrSkN0DIts01369GfvQztd7yq398jm_NBAKSOGvAy4Lcxe_yjXnW80HlMY0TVVu0R-xCaDQGTLX2I	eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJvd25lciI6Im15LWRyaXZlIiwibmFtZSI6ImFsaWNlIiwiY3JlYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDAyOjE3OjU4LTAzOjAwIiwidXBkYXRlZFRpbWUiOiIyMDI2LTA3LTE0VDE2OjUzOjU2WiIsImRlbGV0ZWRUaW1lIjoiIiwiaWQiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJ0eXBlIjoibm9ybWFsLXVzZXIiLCJwYXNzd29yZCI6IiIsInBhc3N3b3JkU2FsdCI6IjQ2NzhjNWIyZjc1ZjY3YTVkNDQ4IiwicGFzc3dvcmRUeXBlIjoiYmNyeXB0IiwiZGlzcGxheU5hbWUiOiJBbGljZSIsImZpcnN0TmFtZSI6IiIsImxhc3ROYW1lIjoiIiwiYXZhdGFyIjoiaHR0cHM6Ly9jZG4uY2FzYmluLm9yZy9pbWcvY2FzYmluLnN2ZyIsImF2YXRhclR5cGUiOiIiLCJwZXJtYW5lbnRBdmF0YXIiOiIiLCJlbWFpbCI6IjE4djgweEBleGFtcGxlLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwicGhvbmUiOiIxNDM2NjE0ODQ0NSIsImNvdW50cnlDb2RlIjoiVVMiLCJyZWdpb24iOiIiLCJsb2NhdGlvbiI6IiIsImFkZHJlc3MiOltdLCJhZmZpbGlhdGlvbiI6IkV4YW1wbGUgSW5jLiIsInRpdGxlIjoiIiwiaWRDYXJkVHlwZSI6IiIsImlkQ2FyZCI6IiIsImhvbWVwYWdlIjoiIiwiYmlvIjoiIiwibGFuZ3VhZ2UiOiIiLCJnZW5kZXIiOiIiLCJiaXJ0aGRheSI6IiIsImVkdWNhdGlvbiI6IiIsInNjb3JlIjowLCJrYXJtYSI6MCwicmFua2luZyI6MSwiaXNEZWZhdWx0QXZhdGFyIjpmYWxzZSwiaXNPbmxpbmUiOmZhbHNlLCJpc0FkbWluIjpmYWxzZSwiaXNGb3JiaWRkZW4iOmZhbHNlLCJpc0RlbGV0ZWQiOmZhbHNlLCJzaWdudXBBcHBsaWNhdGlvbiI6InBvc3RtYW4iLCJoYXNoIjoiIiwicHJlSGFzaCI6IiIsInJlZ2lzdGVyVHlwZSI6IkFkZCBVc2VyIiwicmVnaXN0ZXJTb3VyY2UiOiJidWlsdC1pbi9hZG1pbiIsImdpdGh1YiI6IiIsImdvb2dsZSI6IiIsInFxIjoiIiwid2VjaGF0IjoiIiwiZmFjZWJvb2siOiIiLCJkaW5ndGFsayI6IiIsIndlaWJvIjoiIiwiZ2l0ZWUiOiIiLCJsaW5rZWRpbiI6IiIsIndlY29tIjoiIiwibGFyayI6IiIsImdpdGxhYiI6IiIsImNyZWF0ZWRJcCI6IiIsImxhc3RTaWduaW5UaW1lIjoiIiwibGFzdFNpZ25pbklwIjoiIiwicHJlZmVycmVkTWZhVHlwZSI6IiIsInJlY292ZXJ5Q29kZXMiOm51bGwsInRvdHBTZWNyZXQiOiIiLCJtZmFQaG9uZUVuYWJsZWQiOmZhbHNlLCJtZmFFbWFpbEVuYWJsZWQiOmZhbHNlLCJsZGFwIjoiIiwicHJvcGVydGllcyI6e30sInJvbGVzIjpbXSwicGVybWlzc2lvbnMiOltdLCJncm91cHMiOltdLCJsYXN0U2lnbmluV3JvbmdUaW1lIjoiIiwic2lnbmluV3JvbmdUaW1lcyI6MCwibWFuYWdlZEFjY291bnRzIjpudWxsLCJ0b2tlblR5cGUiOiJyZWZyZXNoLXRva2VuIiwidGFnIjoic3RhZmYiLCJzY29wZSI6Im9wZW5pZCIsImF6cCI6ImYzZjIzZDA3MGQ5ZGI5NjcyMjBlIiwic2lnbmluTWV0aG9kIjoiUGFzc3dvcmQiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgwMDAiLCJzdWIiOiIyYmZlYjc5MC1hY2IyLTRmYWItYmVlZS0yZGI1NjczZTQ3ZTgiLCJhdWQiOlsiZjNmMjNkMDcwZDlkYjk2NzIyMGUiXSwiZXhwIjoxNzg0NjU4NDU2LCJuYmYiOjE3ODQwNTM2NTYsImlhdCI6MTc4NDA1MzY1NiwianRpIjoiYWRtaW4vZWU1MDAwMTQtNGNmNy00ZDlmLTg2NGUtM2FmZmJjNzJmNDFkIn0.DZ9TB0oODrwewE9IPGzMvkkiw7ZvzQAbUhDWlD4eBiFaNnuBZqwAec8CZLc6OlnMxEamiUrydjQujIbyqw42e0__kJKohL7QPlQVD6DlkPce93VHg-RFlqltrha1LyNQ07fnWJWd0KxMpR6EgJinNttrb4HMo2IJhyw44jQs-vTQ3OuS56heHh_TyZEgCs_QgkBFh7n74naUk8kiparAqlNsys-JKxHcAsGYyUllDUS7sbE-Nn-bIFF4T2KqRUGOV_k0KGGrMcSpwwBKSoPdF7psALGAnPctYA_6xAXqYZpCuKB1zt0F2cqXYSJyFkxKOrZef0EU09qTXeec2OR6ACEwLFuAUgrfwzdzh6mAkYkdGhvFvbGuNeytYcG8FMhySNiNc-GCS0VVQENusxyFbe2XhGPrNbe761qlLNWZGoIcC5aavdeBcWQfvIuJr2Zu_W4Mlgg1m2ee_M7yfeY075RTaPcD0paRN3jiONBdVddCdIsXsLYdht6S-_9K59wsYhK_k5u5eRvpDZT-ERcnP6zoM90E72s4WXs0k9qcU33n0DU5msPq7OYzgPNK8uaceRdgSW9-nR7UCB9wCnobK-GIza2FsmUUQUaNHn9n7SoduesEfYf-YQgouOfEohYaiwmFA-o0YWkQxirDUoCYys3XzxBHJsIBpcY7d458pyc	f5157fe28f3d6e9c524286ccd7ffacada32df84cc60267d2f6ffad3665e1e59d	6a201812c7093a0efe9bdafe0fe979ef80ae7969883488b7259c169f436369e5	604800	openid	Bearer		vfd43lrnEhGIBd5LovGYDA3GDC2M-ssQGIHeZEG2wI4	t	1784053956		
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.transaction (owner, name, created_time, display_name, application, domain, category, type, subtype, provider, "user", tag, amount, currency, payment, state) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public."user" (owner, name, created_time, updated_time, deleted_time, id, external_id, type, password, password_salt, password_type, display_name, first_name, last_name, avatar, avatar_type, permanent_avatar, email, email_verified, phone, country_code, region, location, address, addresses, affiliation, title, id_card_type, id_card, real_name, is_verified, homepage, bio, tag, language, gender, birthday, education, score, karma, ranking, balance, balance_credit, currency, balance_currency, is_default_avatar, is_online, is_admin, is_forbidden, is_deleted, signup_application, hash, pre_hash, register_type, register_source, access_token, original_token, original_refresh_token, created_ip, last_signin_time, last_signin_ip, github, google, qq, wechat, facebook, dingtalk, weibo, gitee, linkedin, wecom, lark, gitlab, adfs, baidu, alipay, casdoor, infoflow, apple, azuread, azureadb2c, slack, steam, bilibili, okta, douyin, kwai, line, amazon, auth0, battlenet, bitbucket, box, cloudfoundry, dailymotion, deezer, digitalocean, discord, dropbox, eveonline, fitbit, gitea, heroku, influxcloud, instagram, intercom, kakao, lastfm, mailru, meetup, microsoftonline, naver, nextcloud, onedrive, oura, patreon, paypal, salesforce, shopify, soundcloud, spotify, strava, stripe, telegram, tiktok, tumblr, twitch, twitter, typetalk, uber, vk, wepay, xero, yahoo, yammer, yandex, zoom, metamask, web3onboard, custom, custom2, custom3, custom4, custom5, custom6, custom7, custom8, custom9, custom10, "webauthnCredentials", preferred_mfa_type, recovery_codes, totp_secret, mfa_phone_enabled, mfa_email_enabled, mfa_radius_enabled, mfa_radius_username, mfa_radius_provider, mfa_push_enabled, mfa_push_receiver, mfa_push_provider, invitation, invitation_code, face_ids, cart, ldap, properties, roles, permissions, groups, last_change_password_time, last_signin_wrong_time, signin_wrong_times, "managedAccounts", "mfaAccounts", mfa_items, mfa_remember_deadline, need_update_password, ip_whitelist, application_scopes) FROM stdin;
built-in	admin	2026-07-14T05:13:41Z	2026-07-14T05:13:41Z		38c80de1-e973-4db1-96a1-847346009d6e		normal-user	$2a$10$PqbAn0X7D1weXUYjERPt7efrmBzlpzwRv.1t9gUC506s94fdLKnV2	4b3bb25f1643761c3d95	bcrypt	Admin			https://cdn.casbin.org/img/casbin.svg			admin@example.com	f	12345678910	US			[]	\\x6e756c6c	Example Inc.					f			staff					2000	0	1	0	0		USD	f	f	t	f	f	app-built-in			Add User	built-in/admin				127.0.0.1																																																																																											\\x6e756c6c		null		f	f	f			f					null	null		{}	null	null	null			0	\\x6e756c6c	\\x6e756c6c	null		f		null
my-drive	bob	2026-07-14T02:20:09-03:00	2026-07-14T05:20:32Z		4b8decb7-ee03-4e88-a6a6-bcf9e9283626		normal-user	$2a$10$yjGjqm1bEzsD52LJMl4vNuIvyqUl9iD7mF1h8BBhu7fwxB5xSYSbe	ccd30e5834478b8de6fc	bcrypt	Bob			https://cdn.casbin.org/img/casbin.svg			104v0d@example.com	f	98377058717	US			[]	\\x6e756c6c	Example Inc.					f			staff					0	0	2	0	0		USD	f	f	f	f	f	postman			Add User	built-in/admin																																																																																															\\x6e756c6c		null		f	f	f			f					null	[]		{}	null	null	[]			0	\\x6e756c6c	\\x6e756c6c	null		f		null
my-drive	charlie	2026-07-14T02:20:36-03:00	2026-07-14T05:20:53Z		4663efe5-99ee-4051-a825-9f0dd570dd56		normal-user	$2a$10$obANgl/Lru1D6tA19AKbS.nLgFxPWWO3.PUROjZRtN8WkgXtAegdS	ef8c1264d7e18d885dc3	bcrypt	Charlie			https://cdn.casbin.org/img/casbin.svg			zdd8j5@example.com	f	09396541619	US			[]	\\x6e756c6c	Example Inc.					f			staff					0	0	3	0	0		USD	f	f	f	f	f	postman			Add User	built-in/admin																																																																																															\\x6e756c6c		null		f	f	f			f					null	[]		{}	null	null	[]			0	\\x6e756c6c	\\x6e756c6c	null		f		null
my-drive	alice	2026-07-14T02:17:58-03:00	2026-07-14T16:53:56Z		2bfeb790-acb2-4fab-beee-2db5673e47e8		normal-user	$2a$10$s/oMeKiN0UQ29rOb25dPh.PLLQksTTlZQfbDG78CrwbIQmhZzQqEO	4678c5b2f75f67a5d448	bcrypt	Alice			https://cdn.casbin.org/img/casbin.svg			18v80x@example.com	f	14366148445	US			[]	\\x6e756c6c	Example Inc.					f			staff					0	0	1	0	0		USD	f	f	f	f	f	postman			Add User	built-in/admin																																																																																															\\x6e756c6c		null		f	f	f			f					null	[]		{}	null	null	[]			0	\\x6e756c6c	\\x6e756c6c	null		f		null
\.


--
-- Data for Name: verification_record; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.verification_record (owner, name, created_time, remote_addr, type, "user", provider, receiver, code, "time", is_used) FROM stdin;
\.


--
-- Data for Name: webhook; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.webhook (owner, name, created_time, organization, url, method, content_type, headers, events, token_fields, object_fields, is_user_extended, single_org_only, is_enabled, max_retries, retry_interval, use_exponential_backoff) FROM stdin;
\.


--
-- Data for Name: webhook_event; Type: TABLE DATA; Schema: public; Owner: casdoor
--

COPY public.webhook_event (owner, name, created_time, updated_time, webhook, organization, event_type, state, payload, extended_user, attempt_count, max_retries, next_retry_time, last_status_code, last_response, last_error) FROM stdin;
\.


--
-- Name: casbin_api_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: casdoor
--

SELECT pg_catalog.setval('public.casbin_api_rule_id_seq', 98, true);


--
-- Name: casbin_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: casdoor
--

SELECT pg_catalog.setval('public.casbin_rule_id_seq', 1, false);


--
-- Name: casbin_user_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: casdoor
--

SELECT pg_catalog.setval('public.casbin_user_rule_id_seq', 1, false);


--
-- Name: coupon_usage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: casdoor
--

SELECT pg_catalog.setval('public.coupon_usage_id_seq', 1, false);


--
-- Name: permission_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: casdoor
--

SELECT pg_catalog.setval('public.permission_rule_id_seq', 3, true);


--
-- Name: record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: casdoor
--

SELECT pg_catalog.setval('public.record_id_seq', 50, true);


--
-- Name: adapter adapter_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.adapter
    ADD CONSTRAINT adapter_pkey PRIMARY KEY (owner, name);


--
-- Name: agent agent_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.agent
    ADD CONSTRAINT agent_pkey PRIMARY KEY (owner, name);


--
-- Name: application application_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_pkey PRIMARY KEY (owner, name);


--
-- Name: casbin_api_rule casbin_api_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.casbin_api_rule
    ADD CONSTRAINT casbin_api_rule_pkey PRIMARY KEY (id);


--
-- Name: casbin_rule casbin_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.casbin_rule
    ADD CONSTRAINT casbin_rule_pkey PRIMARY KEY (id);


--
-- Name: casbin_user_rule casbin_user_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.casbin_user_rule
    ADD CONSTRAINT casbin_user_rule_pkey PRIMARY KEY (id);


--
-- Name: cert cert_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.cert
    ADD CONSTRAINT cert_pkey PRIMARY KEY (owner, name);


--
-- Name: coupon coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.coupon
    ADD CONSTRAINT coupon_pkey PRIMARY KEY (owner, name);


--
-- Name: coupon_usage coupon_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.coupon_usage
    ADD CONSTRAINT coupon_usage_pkey PRIMARY KEY (id);


--
-- Name: enforcer enforcer_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.enforcer
    ADD CONSTRAINT enforcer_pkey PRIMARY KEY (owner, name);


--
-- Name: entry entry_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.entry
    ADD CONSTRAINT entry_pkey PRIMARY KEY (owner, name);


--
-- Name: form form_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.form
    ADD CONSTRAINT form_pkey PRIMARY KEY (owner, name);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (owner, name);


--
-- Name: invitation invitation_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.invitation
    ADD CONSTRAINT invitation_pkey PRIMARY KEY (owner, name);


--
-- Name: key key_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.key
    ADD CONSTRAINT key_pkey PRIMARY KEY (owner, name);


--
-- Name: ldap ldap_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.ldap
    ADD CONSTRAINT ldap_pkey PRIMARY KEY (id);


--
-- Name: model model_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.model
    ADD CONSTRAINT model_pkey PRIMARY KEY (owner, name);


--
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (owner, name);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (owner, name);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (owner, name);


--
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (owner, name);


--
-- Name: permission_rule permission_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.permission_rule
    ADD CONSTRAINT permission_rule_pkey PRIMARY KEY (id);


--
-- Name: plan plan_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.plan
    ADD CONSTRAINT plan_pkey PRIMARY KEY (owner, name);


--
-- Name: pricing pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT pricing_pkey PRIMARY KEY (owner, name);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (owner, name);


--
-- Name: provider provider_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (owner, name);


--
-- Name: radius_accounting radius_accounting_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.radius_accounting
    ADD CONSTRAINT radius_accounting_pkey PRIMARY KEY (owner, name);


--
-- Name: record record_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (id);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (owner, name);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (owner, name);


--
-- Name: rule rule_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.rule
    ADD CONSTRAINT rule_pkey PRIMARY KEY (owner, name);


--
-- Name: server server_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.server
    ADD CONSTRAINT server_pkey PRIMARY KEY (owner, name);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (owner, name, application);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (owner, name);


--
-- Name: subscription subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_pkey PRIMARY KEY (owner, name);


--
-- Name: syncer syncer_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.syncer
    ADD CONSTRAINT syncer_pkey PRIMARY KEY (owner, name);


--
-- Name: third_party_link third_party_link_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.third_party_link
    ADD CONSTRAINT third_party_link_pkey PRIMARY KEY (owner, user_name, provider_name);


--
-- Name: ticket ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.ticket
    ADD CONSTRAINT ticket_pkey PRIMARY KEY (owner, name);


--
-- Name: token token_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.token
    ADD CONSTRAINT token_pkey PRIMARY KEY (owner, name);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (owner, name);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (owner, name);


--
-- Name: verification_record verification_record_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.verification_record
    ADD CONSTRAINT verification_record_pkey PRIMARY KEY (owner, name);


--
-- Name: webhook_event webhook_event_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.webhook_event
    ADD CONSTRAINT webhook_event_pkey PRIMARY KEY (owner, name);


--
-- Name: webhook webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: casdoor
--

ALTER TABLE ONLY public.webhook
    ADD CONSTRAINT webhook_pkey PRIMARY KEY (owner, name);


--
-- Name: IDX_casbin_api_rule_ptype; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_api_rule_ptype" ON public.casbin_api_rule USING btree (ptype);


--
-- Name: IDX_casbin_api_rule_v0; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_api_rule_v0" ON public.casbin_api_rule USING btree (v0);


--
-- Name: IDX_casbin_api_rule_v1; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_api_rule_v1" ON public.casbin_api_rule USING btree (v1);


--
-- Name: IDX_casbin_api_rule_v2; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_api_rule_v2" ON public.casbin_api_rule USING btree (v2);


--
-- Name: IDX_casbin_api_rule_v3; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_api_rule_v3" ON public.casbin_api_rule USING btree (v3);


--
-- Name: IDX_casbin_api_rule_v4; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_api_rule_v4" ON public.casbin_api_rule USING btree (v4);


--
-- Name: IDX_casbin_api_rule_v5; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_api_rule_v5" ON public.casbin_api_rule USING btree (v5);


--
-- Name: IDX_casbin_rule_ptype; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_rule_ptype" ON public.casbin_rule USING btree (ptype);


--
-- Name: IDX_casbin_rule_v0; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_rule_v0" ON public.casbin_rule USING btree (v0);


--
-- Name: IDX_casbin_rule_v1; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_rule_v1" ON public.casbin_rule USING btree (v1);


--
-- Name: IDX_casbin_rule_v2; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_rule_v2" ON public.casbin_rule USING btree (v2);


--
-- Name: IDX_casbin_rule_v3; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_rule_v3" ON public.casbin_rule USING btree (v3);


--
-- Name: IDX_casbin_rule_v4; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_rule_v4" ON public.casbin_rule USING btree (v4);


--
-- Name: IDX_casbin_rule_v5; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_rule_v5" ON public.casbin_rule USING btree (v5);


--
-- Name: IDX_casbin_user_rule_ptype; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_user_rule_ptype" ON public.casbin_user_rule USING btree (ptype);


--
-- Name: IDX_casbin_user_rule_v0; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_user_rule_v0" ON public.casbin_user_rule USING btree (v0);


--
-- Name: IDX_casbin_user_rule_v1; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_user_rule_v1" ON public.casbin_user_rule USING btree (v1);


--
-- Name: IDX_casbin_user_rule_v2; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_user_rule_v2" ON public.casbin_user_rule USING btree (v2);


--
-- Name: IDX_casbin_user_rule_v3; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_user_rule_v3" ON public.casbin_user_rule USING btree (v3);


--
-- Name: IDX_casbin_user_rule_v4; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_user_rule_v4" ON public.casbin_user_rule USING btree (v4);


--
-- Name: IDX_casbin_user_rule_v5; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_casbin_user_rule_v5" ON public.casbin_user_rule USING btree (v5);


--
-- Name: IDX_invitation_code; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_invitation_code" ON public.invitation USING btree (code);


--
-- Name: IDX_key_access_key; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_key_access_key" ON public.key USING btree (access_key);


--
-- Name: IDX_permission_rule_ptype; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_permission_rule_ptype" ON public.permission_rule USING btree (ptype);


--
-- Name: IDX_permission_rule_v0; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_permission_rule_v0" ON public.permission_rule USING btree (v0);


--
-- Name: IDX_permission_rule_v1; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_permission_rule_v1" ON public.permission_rule USING btree (v1);


--
-- Name: IDX_permission_rule_v2; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_permission_rule_v2" ON public.permission_rule USING btree (v2);


--
-- Name: IDX_permission_rule_v3; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_permission_rule_v3" ON public.permission_rule USING btree (v3);


--
-- Name: IDX_permission_rule_v4; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_permission_rule_v4" ON public.permission_rule USING btree (v4);


--
-- Name: IDX_permission_rule_v5; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_permission_rule_v5" ON public.permission_rule USING btree (v5);


--
-- Name: IDX_radius_accounting_acct_session_id; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_radius_accounting_acct_session_id" ON public.radius_accounting USING btree (acct_session_id);


--
-- Name: IDX_radius_accounting_acct_start_time; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_radius_accounting_acct_start_time" ON public.radius_accounting USING btree (acct_start_time);


--
-- Name: IDX_radius_accounting_acct_stop_time; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_radius_accounting_acct_stop_time" ON public.radius_accounting USING btree (acct_stop_time);


--
-- Name: IDX_radius_accounting_username; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_radius_accounting_username" ON public.radius_accounting USING btree (username);


--
-- Name: IDX_record_name; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_record_name" ON public.record USING btree (name);


--
-- Name: IDX_record_owner; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_record_owner" ON public.record USING btree (owner);


--
-- Name: IDX_ticket_user; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_ticket_user" ON public.ticket USING btree ("user");


--
-- Name: IDX_token_access_token_hash; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_token_access_token_hash" ON public.token USING btree (access_token_hash);


--
-- Name: IDX_token_code; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_token_code" ON public.token USING btree (code);


--
-- Name: IDX_token_refresh_token_hash; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_token_refresh_token_hash" ON public.token USING btree (refresh_token_hash);


--
-- Name: IDX_user_created_time; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_user_created_time" ON public."user" USING btree (created_time);


--
-- Name: IDX_user_email; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_user_email" ON public."user" USING btree (email);


--
-- Name: IDX_user_external_id; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_user_external_id" ON public."user" USING btree (external_id);


--
-- Name: IDX_user_id; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_user_id" ON public."user" USING btree (id);


--
-- Name: IDX_user_id_card; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_user_id_card" ON public."user" USING btree (id_card);


--
-- Name: IDX_user_invitation; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_user_invitation" ON public."user" USING btree (invitation);


--
-- Name: IDX_user_invitation_code; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_user_invitation_code" ON public."user" USING btree (invitation_code);


--
-- Name: IDX_user_phone; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_user_phone" ON public."user" USING btree (phone);


--
-- Name: IDX_verification_record_receiver; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_verification_record_receiver" ON public.verification_record USING btree (receiver);


--
-- Name: IDX_webhook_event_organization; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_webhook_event_organization" ON public.webhook_event USING btree (organization);


--
-- Name: IDX_webhook_event_state; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_webhook_event_state" ON public.webhook_event USING btree (state);


--
-- Name: IDX_webhook_event_webhook; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_webhook_event_webhook" ON public.webhook_event USING btree (webhook);


--
-- Name: IDX_webhook_organization; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE INDEX "IDX_webhook_organization" ON public.webhook USING btree (organization);


--
-- Name: UQE_coupon_code; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE UNIQUE INDEX "UQE_coupon_code" ON public.coupon USING btree (code);


--
-- Name: UQE_group_name; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE UNIQUE INDEX "UQE_group_name" ON public."group" USING btree (name);


--
-- Name: UQE_provider_name; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE UNIQUE INDEX "UQE_provider_name" ON public.provider USING btree (name);


--
-- Name: UQE_third_party_link_link_unique; Type: INDEX; Schema: public; Owner: casdoor
--

CREATE UNIQUE INDEX "UQE_third_party_link_link_unique" ON public.third_party_link USING btree (owner, provider_name, provider_id);


--
-- PostgreSQL database dump complete
--

