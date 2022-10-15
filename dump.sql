PGDMP         .    	        	    z            shortly #   14.5 (Ubuntu 14.5-0ubuntu0.22.04.1) #   14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)     8           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            9           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            :           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ;           1262    17043    shortly    DATABASE     \   CREATE DATABASE shortly WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE shortly;
                postgres    false            �            1259    17155    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            �            1259    17154    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          postgres    false    212            <           0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          postgres    false    211            �            1259    17249    urls    TABLE     �   CREATE TABLE public.urls (
    id integer NOT NULL,
    "creatorId" integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now(),
    "visitsCount" integer DEFAULT 0
);
    DROP TABLE public.urls;
       public         heap    postgres    false            �            1259    17248    urls_id_seq    SEQUENCE     �   CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.urls_id_seq;
       public          postgres    false    214            =           0    0    urls_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;
          public          postgres    false    213            �            1259    17065    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(60) NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    17064    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    210            >           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    209            �           2604    17158    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    17252    urls id    DEFAULT     b   ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);
 6   ALTER TABLE public.urls ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    17068    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            3          0    17155    sessions 
   TABLE DATA           D   COPY public.sessions (id, token, "userId", "createdAt") FROM stdin;
    public          postgres    false    212           5          0    17249    urls 
   TABLE DATA           \   COPY public.urls (id, "creatorId", "shortUrl", url, "createdAt", "visitsCount") FROM stdin;
    public          postgres    false    214   �        1          0    17065    users 
   TABLE DATA           :   COPY public.users (id, name, email, password) FROM stdin;
    public          postgres    false    210   �"       ?           0    0    sessions_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.sessions_id_seq', 4, true);
          public          postgres    false    211            @           0    0    urls_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.urls_id_seq', 9, true);
          public          postgres    false    213            A           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 3, true);
          public          postgres    false    209            �           2606    17163    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    212            �           2606    17165    sessions sessions_token_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);
 E   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_token_key;
       public            postgres    false    212            �           2606    17258    urls urls_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.urls DROP CONSTRAINT urls_pkey;
       public            postgres    false    214            �           2606    17260    urls urls_shortUrl_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrl_key" UNIQUE ("shortUrl");
 B   ALTER TABLE ONLY public.urls DROP CONSTRAINT "urls_shortUrl_key";
       public            postgres    false    214            �           2606    17074    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    210            �           2606    17072    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    210            �           2606    17166    sessions sessions_userId_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);
 I   ALTER TABLE ONLY public.sessions DROP CONSTRAINT "sessions_userId_fkey";
       public          postgres    false    3226    210    212            �           2606    17261    urls urls_creatorId_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES public.users(id);
 D   ALTER TABLE ONLY public.urls DROP CONSTRAINT "urls_creatorId_fkey";
       public          postgres    false    210    214    3226            3   �   x�eϹmE1D�X��7@����Z�P�/�ϑa8�{��"��#`^5߰4tuO��=z����@�!���z#R�Q��u>��������t�g��{t�5�C4Q&��$��*�)1�&�\UIX�������"�>��yC"-�D��rO��
X��)�c�.��d�P\�~�Z�7��>%      5   �  x���͎�0�u�};��Ϯ 40�2�S:�J�$&	M�$v�a����VU��t{��|:�8�$�n�_D��N�ku}��T�u6��� �Q榍N��9��u+`Us��@ ����"`0{�qFh��,$!����Ore�閨=�OC��u(�P$q*x�C�C�����t�?�̇i���]}�Z%�N���K^I]�����������'Qe.�P*\���[��mrӌ��F7W��MS[�]XpL:c]9(�7@y�QFc(pLi��$�>w�v�"��[�ش����R1dI�$i@B�`���og�a���?.�y�2�C��B�Mi,e}s��]n
�v��5F6��S6���LP�R���?��m.U�5��ψ��TP�\�A��*W��('��ݚ�\����@4�P�Pz�2�ݨ���5���d%��z~3#A�s�9��ԃ�l�`��n^��{��V��[�(�L���0��d�      1   �   x�e̽v�0��\s�P�bK�b9"��K-��O<�@W����>�;�rhA���Oeà�B5��r{�غ�"ՙ>��m��r8��,	��A�}�~�М'v�8�8�r��u�Z������x>I��jEL _v�hH��C�,�{��oq�g��T�~�F�u�^:h��U���w.��N�ˁ�4�ʃ���b;?zr�|�Ix��u�g3D"�����"X�     