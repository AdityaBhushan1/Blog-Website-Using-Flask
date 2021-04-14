PGDMP     7                    y            testdb     13.2 (Ubuntu 13.2-1.pgdg20.04+1)     13.2 (Ubuntu 13.2-1.pgdg20.04+1)     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384    testdb    DATABASE     U   CREATE DATABASE testdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_IN';
    DROP DATABASE testdb;
                postgres    false            �            1259    16732    contacts_log    TABLE     �   CREATE TABLE public.contacts_log (
    sno bigint NOT NULL,
    name character varying NOT NULL,
    phone_no character varying NOT NULL,
    email character varying NOT NULL,
    msg character varying NOT NULL,
    date character varying
);
     DROP TABLE public.contacts_log;
       public         heap    postgres    false            �            1259    16730    contacts_log_sno_seq    SEQUENCE     }   CREATE SEQUENCE public.contacts_log_sno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.contacts_log_sno_seq;
       public          postgres    false    201            �           0    0    contacts_log_sno_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.contacts_log_sno_seq OWNED BY public.contacts_log.sno;
          public          postgres    false    200            �            1259    16753    posts    TABLE     �   CREATE TABLE public.posts (
    sno bigint NOT NULL,
    title character varying NOT NULL,
    content character varying NOT NULL,
    date character varying,
    slug character varying,
    img_file character varying,
    tagline character varying
);
    DROP TABLE public.posts;
       public         heap    postgres    false            �            1259    16751    posts_sno_seq    SEQUENCE     v   CREATE SEQUENCE public.posts_sno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.posts_sno_seq;
       public          postgres    false    203            �           0    0    posts_sno_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.posts_sno_seq OWNED BY public.posts.sno;
          public          postgres    false    202            0           2604    16735    contacts_log sno    DEFAULT     t   ALTER TABLE ONLY public.contacts_log ALTER COLUMN sno SET DEFAULT nextval('public.contacts_log_sno_seq'::regclass);
 ?   ALTER TABLE public.contacts_log ALTER COLUMN sno DROP DEFAULT;
       public          postgres    false    200    201    201            1           2604    16756 	   posts sno    DEFAULT     f   ALTER TABLE ONLY public.posts ALTER COLUMN sno SET DEFAULT nextval('public.posts_sno_seq'::regclass);
 8   ALTER TABLE public.posts ALTER COLUMN sno DROP DEFAULT;
       public          postgres    false    203    202    203            �          0    16732    contacts_log 
   TABLE DATA           M   COPY public.contacts_log (sno, name, phone_no, email, msg, date) FROM stdin;
    public          postgres    false    201   �       �          0    16753    posts 
   TABLE DATA           S   COPY public.posts (sno, title, content, date, slug, img_file, tagline) FROM stdin;
    public          postgres    false    203   b       �           0    0    contacts_log_sno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.contacts_log_sno_seq', 3, true);
          public          postgres    false    200            �           0    0    posts_sno_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_sno_seq', 1, true);
          public          postgres    false    202            3           2606    16740    contacts_log contacts_log_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.contacts_log
    ADD CONSTRAINT contacts_log_pkey PRIMARY KEY (sno);
 H   ALTER TABLE ONLY public.contacts_log DROP CONSTRAINT contacts_log_pkey;
       public            postgres    false    201            5           2606    16761    posts posts_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (sno);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    203            �   T   x�3�,I-.A#rS���S9��uLt����2�H�"CC+#K+#=s#3K.c�l$�&cs+#=3s#C�=... ��'�      �      x��[�r��]K_�`t�Ɉ�bU�Ѥ%���%�TK�T&�
��Dv>H�V�����?0?2+���|ɜsdf�l;<�YHde!���8�����k['�J�Oek��Gw~9R��]4*7u�W�X)]�*�+��?릲����Pe����r��ڮ
�*|RIet����mak���6U%�1��6ku�lbT����[�?4�~ ���V�,K��r�����)Y�VXZת�U��r����v �-�ؙ\��>�+�D��@�øD��J|����ʹ���|����d�`Te���P�l��;l$�����:+���
�'{�S�|k��~$�bCwf����uVS��l�泑�Og�P��(���_���h�r�e�����O??������t>{�tmլǥ��g�)�_��e�t:��7Vt;q�j��J~�7�~�n���������s뚢^�fR���鴼?��OT�y5����g�|�?D���v��Y�=eY��
�\���9�WV&u�-�����՛j�pe�]m`LQusg�x%+h3Q�Æ���͈.˅�Vn��j�02�������M% �Le���6k�_��&���`=�k�,���:[i�}�-V��r^
����7������l�YZ:�+dSa#��S#���r����/7��w���2��\��]>����Z�1��{�r#����$��7�Lc叶��-�<�o���a����ë;{G�*ז^W^��K�̰����G���.%!�ØJ�6y�j!� ��K|g+��=RkWw��0���﹫k���hAM ��L/NE�P'��0j��O�w�)�hਜ�	�1La��F-+8\��]����)0D-6Ī� `d�r��n�1R���ə��������d�х�6�����TР�7 Ql=Rwk���
kȖ� ��`�UuEW*�����2�`�|�����#�\�[�2*C<ka3�lT��ui�0.*ĄҹkE}ˡd��c�Z�LS7 2?����jm�Y�"t���j�@��um�[�]/� �M*t��'�8u֬]�Z#z�x��1��dW�w�L��p��`>M�S�M�ǣ���� �"��� JI"x~<������TQ�:M�_}V[���/a�]Hʶ�OK�@�!�CHd�jx.r����>�>��RyPYh�ފ>�-R�o�FB"�{���FW/���֬L�LӢ6Ο(�]��K�ޑ�@�����$��>,+��>�颭�``�>�IJ��Ek3��\K�����#%�F�x�����n�I�EM$S0c&�0~e�I�>� Siծj�QU�`�%�]7m�靂uS� ̷!b.*]�O0џ��f�����a7ERmJhl�,��dG�
'��}����/~�-���ٻ�����Ivv���;{����⧛�[]�~�����{����?����o_����L��-�ӷ��GΙ������gg�������y�L�O>��������������/������cԞ�f�sᓿ��hL�.d������aHW0Q�*>隩�a����t	]��ˌ��Bj�\��Dm#D2Rٚ	9�G>�Pt[4ȣA��@�772X��]�7����z2�o~�\M�;���j���K�̙��	��܊�9+K���I�j�a�F'f�����l�3��ߊ�!	��$s��vKDC��5&�H���.� w�oF�c����f�d-�\7�\� ��g��f�T/�G�)�>��:]�W����ݶ������Fjvzz(怓W�I�y�nAX�nL7M<���졨�+��NY~ʑ���es���
�A)��LXk+Т��Z��	��'�T�T��Cİú�J]�e?�,gE����ʇWչ�;W�a#���	�KI��_ĩ�e �_�nI���ZZ��@���^�������L�+R&Ġ䎌>��MBM�k@[
���fS�FwbC�o� '#yz����бM,U:1/A��W�lڗ.&AuI"(nv�`�q�0C���DIZ�eLyt�1�l뵀�ĝ�SI��R�c����$���3����#��(=# � �<���9���tHՕ'��x�Z�p��/��xX �e��3�
eCњ �N2?��z�Q�(�yA�W"��cs�]5�n�X}������z~�Y� ��F�Lcዔ7��fh���W�p�a��v}<���[�/X����� +I�jh��!��sA�����{Q��ƅ��<Y����6�DF�DB�]�@%!Z��j�I�Ĭ�>F�ǤK�y�@N2���@i(_�|���#G���to|2�} 4k���夎�[��!HJ��!��33��R��o,�#M��O>zQ�)t����XܲuA�n���"F�A6�����������4���%R
!J�֧�����GP� ����5�|=�i�ޠ%�(Mc��I;̀��\p曐A��i��ҷΦ��N��nͳ0 ���� �`�հ���C��4 ���S;ay���o�OǥM(Ƹ^��z͎�G7v�q[�=J�=x�W��n�_��lvr:?:8>8zQ��x6�ǿ��s�S߀��sD�Q�\��/�Ϟ���9�U㒛���zҫ���|I�7N��7O;@�M`�p�7�w���r��<_F�
����#�G�S��%�D���o�H�w]�E��c����2��DJ��Z�ʈ��
��~��0�8r�<,LDL
�vK��ʃ֞�q��W�C�=Yf��ѳ���s8����%��NA�nr3�����XeF�I��M�[BЕ(;^�2˙��WYx��K6����F�Gy��$���P�bX�bW�gm2��������6���)��&}���0�������Ǫ��^��	klOL3�J�&Y
6����<
�+�5���Z��3msІ6a����]����R�h� ����u>ɳ��A�
���]F�P��Ӻ�=_��Q	W[�'Zx"j�t�ޱC�o�G&a[��T��.����|)�%��9�܂�[�Sͽ��g	�P{���b����k�b��K�.��nA�i�p{D#6b�K�{�C{t�Z�%a�-��������z_t|�e��ބj�F*}0h��qs���*6ŸG�]ʇK�k8�H�Vm&M�J!��9�Y▭o� 5�X�
+-La����U�`ۄ���jh"G�����U�´O�����t���ȳ$�g	+�����#c�#Gڔ�[�0��^�>��"۬m|5�d��ʟ��d�^�؝tw�3�%�W]�MK�-�0WH%��Iz�һ|C�<�6��痴�v[wл�ul�.j�	�T��:��a����+C'�W��Tu"N�g�xd�Q>�N�:���{��ҷ�vs�U0�CC��2���|UH[riM�$�s-ܿ�VÍ�tI�`%Ŷ=��}G̽��"�nd��%8D�:��.�D.oȈ	.}����q$%.��"�{io��6L�ri*6i�.�<��ej�O��fU��C�_��[���7��k�ٲ${a�~���U:��\u���'���/z>�uv����[��j�I�qR�w����&��鰉"��d���Ȣ]j�yrd������e�N|���������S��HJE��F��2�A�A�F��'N�X���{%�cT%%6"Ǖҳ'�������K:_����楅�:*_����ۇ�q�镄�+}Z�^��A�H4�2ӝQ�j�%�R�A��C*�O(o2x��|�&j>�`���i����TFɱd 9�B��'8�4�<�
��o�>��Uw��Gg�\�@y�D(�gǓ�]@u��a���Ʃ/tM	�*wö�^��V�xDctK	wr�}��;�G��D/���Ϳ��w�V.y��L�������C6,�9b�0`\�����+�3W�^��e(6�2 I�NN�S	^�od9o��=�Gq�X�uq5~��**;��xvz2���>���Q�M�}f��9���.�m�Orw�/��E���0�,����'�0�Y#
bS�
   �,(�1����[�r�B/r����%�p���Snn��47Y�lH�y�C�dy�ڞ֡?���Q������E���Q8]����M�{?������sO���O�Q��kpaY��%�uCk�s��	�n6�Q����n����h8�=&�M���ݲ�G�#�qHt��Et������F:]Ks�� �E�à��k�Tw�OI#��LK)��!L�59�W�\�9�eEz/Y��1�Qlビ܉Me���i$�f���4z��W٤O�r�h4�:u)�6���v%4_⫽Q�3�`*�˸��؂��z����7L�Z��w����"��=:�R�g_��cT�M0λ�����b�D`�z	=S���h��j����t�9b���,ϻ�9ɲW턮_�~�a�cWhy��4�/����n�5mTəbX�d��0o�Y�qpz��� r��t�Sc�ӥ�)u6�+�L����3�|+]χ�ǫ���nAԅC���1�s7Vh�R�4��pW��h���e��n|Cuh���h�������ԗL�7'����W��T���G�Z�X�wX�&+M���*G�
�Ǿ=[�&����ӧ�x�I�VW�e��P[�G<I�a_�Q��dH���a���r���ћO_H�H�_���������$���w�尹����
��xŢ?�Aᆪ3�~ڬ-�Н�A�ʬ��OʒM��լ�:t:���7���2��&<|�:>�ō'("��̎���r��]B���M�� 4�C��u�ط�\vz�?;�?:���d:>��f�����x�9/̱>X�ӓ��x?�J�z��`'����y�~��o_��5�����<&��3���a���u��
�"���6jl�}� ���Xa������������Krg�hf�ac����;9pG��H����2��t�J�\�kQ6]��0��ڀ���^��WW��X��b��z�z"U���<�$�)�!_���+�����FZ�`v�5uбHo^y�\�����jB�.��ڡ.
]S��W2z����#�K��#�
rz��n��K�x��eG i�0�9��N���K����(�H����
����%�h��h �H�$���'�K~2x���'&�j�A�V�X�m�/%N�BM����Pn@t��Q��K��18�����.7¢�E���\�i|�3!*��a]�O'w����˦���v<L�/LNؾD�k+��e�8 �l
Qc��	���R���N\5��-n_��}rH0)"J��(^�����(��ԉWm�˴J�6��)�Lh���PɆ�]����BW�}�O����v�y�r�A�+y�'h&�Sx��o��t���8�a�׎��8��t�:>ʀy$�&g�m�;��ǚy����.�C�Cy�^G���c��ۺ�y)w��$"���J�B�F�{V�V/�+ْ�;�c�P�Z�'�
�7N��Cx��s��_�зv�=�B���y�6<���~ͫv#H��J�&q�v�;��ϩL�/���k?���@v�Y�}�����O1n��p�߱OK	~й�JC!"'�����-��my�X{o�2������a���)4�a�8�!,R������E���Z�m�;#M�G����<[���:Ē����V�ANnc����>���=v��#)���d:�U�F�<!]Qޙ���+���f���P�RD~��[�~<,h
�DM�uuQ�+o0sa� ���/H��D��d�����^)Rs,����ޤ����A�W�L�51v�v���=�f�#Q����`��Ft�7���	��nCN��ɐ{�D
�I�BÆS9��/��l G�b�����nt�?��Hm�tW�KW�=�8zh��"rO�/HQ�?1����\����p����K�-�7E�BTo��H�F����ϻ���p=��y��2��91�O��46a�C��u�F��4���'d�\��T��J�غ@�k���A��S�����~ϩ�������������<ڟ�o��Ψ����P��i�����1�     