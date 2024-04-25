PGDMP  6    5                |            my_BD    16.2    16.2 +    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32768    my_BD    DATABASE     z   CREATE DATABASE "my_BD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "my_BD";
                postgres    false            �            1259    32783    actor    TABLE     q   CREATE TABLE public.actor (
    id_actor integer NOT NULL,
    nombre character varying(45),
    edad integer
);
    DROP TABLE public.actor;
       public         heap    postgres    false            �            1259    32782    actor_id_actor_seq    SEQUENCE     �   ALTER TABLE public.actor ALTER COLUMN id_actor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.actor_id_actor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    32799    actor_participa_en_pelicula    TABLE     u   CREATE TABLE public.actor_participa_en_pelicula (
    id_actor integer NOT NULL,
    id_pelicula integer NOT NULL
);
 /   DROP TABLE public.actor_participa_en_pelicula;
       public         heap    postgres    false            �            1259    32776    director    TABLE     w   CREATE TABLE public.director (
    id_director integer NOT NULL,
    nombre character varying(45),
    edad integer
);
    DROP TABLE public.director;
       public         heap    postgres    false            �            1259    32775    director_id_director_seq    SEQUENCE     �   ALTER TABLE public.director ALTER COLUMN id_director ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.director_id_director_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    32789    pelicula    TABLE     �   CREATE TABLE public.pelicula (
    id_pelicula integer NOT NULL,
    id_director integer,
    nombre character varying(45),
    genero character varying(45),
    duracion integer,
    fecha_publicacion date
);
    DROP TABLE public.pelicula;
       public         heap    postgres    false            �            1259    32788    pelicula_id_pelicula_seq    SEQUENCE     �   ALTER TABLE public.pelicula ALTER COLUMN id_pelicula ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pelicula_id_pelicula_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    32826    premio_mejor_actor    TABLE     s   CREATE TABLE public.premio_mejor_actor (
    id_premio integer NOT NULL,
    id_actor integer,
    anio integer
);
 &   DROP TABLE public.premio_mejor_actor;
       public         heap    postgres    false            �            1259    32825     premio_mejor_actor_id_premio_seq    SEQUENCE     �   ALTER TABLE public.premio_mejor_actor ALTER COLUMN id_premio ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.premio_mejor_actor_id_premio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    32815    premio_mejor_director    TABLE     y   CREATE TABLE public.premio_mejor_director (
    id_premio integer NOT NULL,
    id_director integer,
    anio integer
);
 )   DROP TABLE public.premio_mejor_director;
       public         heap    postgres    false            �            1259    32814 #   premio_mejor_director_id_premio_seq    SEQUENCE     �   ALTER TABLE public.premio_mejor_director ALTER COLUMN id_premio ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.premio_mejor_director_id_premio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    32837    premio_mejor_pelicula    TABLE     y   CREATE TABLE public.premio_mejor_pelicula (
    id_premio integer NOT NULL,
    id_pelicula integer,
    anio integer
);
 )   DROP TABLE public.premio_mejor_pelicula;
       public         heap    postgres    false            �            1259    32836 #   premio_mejor_pelicula_id_premio_seq    SEQUENCE     �   ALTER TABLE public.premio_mejor_pelicula ALTER COLUMN id_premio ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.premio_mejor_pelicula_id_premio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �          0    32783    actor 
   TABLE DATA           7   COPY public.actor (id_actor, nombre, edad) FROM stdin;
    public          postgres    false    218   W5       �          0    32799    actor_participa_en_pelicula 
   TABLE DATA           L   COPY public.actor_participa_en_pelicula (id_actor, id_pelicula) FROM stdin;
    public          postgres    false    221   �<       �          0    32776    director 
   TABLE DATA           =   COPY public.director (id_director, nombre, edad) FROM stdin;
    public          postgres    false    216   eC       �          0    32789    pelicula 
   TABLE DATA           i   COPY public.pelicula (id_pelicula, id_director, nombre, genero, duracion, fecha_publicacion) FROM stdin;
    public          postgres    false    220   �J       �          0    32826    premio_mejor_actor 
   TABLE DATA           G   COPY public.premio_mejor_actor (id_premio, id_actor, anio) FROM stdin;
    public          postgres    false    225   ba       �          0    32815    premio_mejor_director 
   TABLE DATA           M   COPY public.premio_mejor_director (id_premio, id_director, anio) FROM stdin;
    public          postgres    false    223   ,b       �          0    32837    premio_mejor_pelicula 
   TABLE DATA           M   COPY public.premio_mejor_pelicula (id_premio, id_pelicula, anio) FROM stdin;
    public          postgres    false    227   �b       �           0    0    actor_id_actor_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.actor_id_actor_seq', 200, true);
          public          postgres    false    217            �           0    0    director_id_director_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.director_id_director_seq', 200, true);
          public          postgres    false    215            �           0    0    pelicula_id_pelicula_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.pelicula_id_pelicula_seq', 300, true);
          public          postgres    false    219            �           0    0     premio_mejor_actor_id_premio_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.premio_mejor_actor_id_premio_seq', 32, true);
          public          postgres    false    224            �           0    0 #   premio_mejor_director_id_premio_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.premio_mejor_director_id_premio_seq', 30, true);
          public          postgres    false    222            �           0    0 #   premio_mejor_pelicula_id_premio_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.premio_mejor_pelicula_id_premio_seq', 31, true);
          public          postgres    false    226            >           2606    32803 <   actor_participa_en_pelicula actor_participa_en_pelicula_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.actor_participa_en_pelicula
    ADD CONSTRAINT actor_participa_en_pelicula_pkey PRIMARY KEY (id_actor, id_pelicula);
 f   ALTER TABLE ONLY public.actor_participa_en_pelicula DROP CONSTRAINT actor_participa_en_pelicula_pkey;
       public            postgres    false    221    221            :           2606    32787    actor actor_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id_actor);
 :   ALTER TABLE ONLY public.actor DROP CONSTRAINT actor_pkey;
       public            postgres    false    218            8           2606    32780    director director_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pkey PRIMARY KEY (id_director);
 @   ALTER TABLE ONLY public.director DROP CONSTRAINT director_pkey;
       public            postgres    false    216            <           2606    32793    pelicula pelicula_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT pelicula_pkey PRIMARY KEY (id_pelicula);
 @   ALTER TABLE ONLY public.pelicula DROP CONSTRAINT pelicula_pkey;
       public            postgres    false    220            B           2606    32830 *   premio_mejor_actor premio_mejor_actor_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.premio_mejor_actor
    ADD CONSTRAINT premio_mejor_actor_pkey PRIMARY KEY (id_premio);
 T   ALTER TABLE ONLY public.premio_mejor_actor DROP CONSTRAINT premio_mejor_actor_pkey;
       public            postgres    false    225            @           2606    32819 0   premio_mejor_director premio_mejor_director_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.premio_mejor_director
    ADD CONSTRAINT premio_mejor_director_pkey PRIMARY KEY (id_premio);
 Z   ALTER TABLE ONLY public.premio_mejor_director DROP CONSTRAINT premio_mejor_director_pkey;
       public            postgres    false    223            D           2606    32841 0   premio_mejor_pelicula premio_mejor_pelicula_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.premio_mejor_pelicula
    ADD CONSTRAINT premio_mejor_pelicula_pkey PRIMARY KEY (id_premio);
 Z   ALTER TABLE ONLY public.premio_mejor_pelicula DROP CONSTRAINT premio_mejor_pelicula_pkey;
       public            postgres    false    227            F           2606    32804 E   actor_participa_en_pelicula actor_participa_en_pelicula_id_actor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.actor_participa_en_pelicula
    ADD CONSTRAINT actor_participa_en_pelicula_id_actor_fkey FOREIGN KEY (id_actor) REFERENCES public.actor(id_actor);
 o   ALTER TABLE ONLY public.actor_participa_en_pelicula DROP CONSTRAINT actor_participa_en_pelicula_id_actor_fkey;
       public          postgres    false    221    4666    218            G           2606    32809 H   actor_participa_en_pelicula actor_participa_en_pelicula_id_pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.actor_participa_en_pelicula
    ADD CONSTRAINT actor_participa_en_pelicula_id_pelicula_fkey FOREIGN KEY (id_pelicula) REFERENCES public.pelicula(id_pelicula);
 r   ALTER TABLE ONLY public.actor_participa_en_pelicula DROP CONSTRAINT actor_participa_en_pelicula_id_pelicula_fkey;
       public          postgres    false    4668    220    221            E           2606    32794 "   pelicula pelicula_id_director_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pelicula
    ADD CONSTRAINT pelicula_id_director_fkey FOREIGN KEY (id_director) REFERENCES public.director(id_director);
 L   ALTER TABLE ONLY public.pelicula DROP CONSTRAINT pelicula_id_director_fkey;
       public          postgres    false    4664    220    216            I           2606    32831 3   premio_mejor_actor premio_mejor_actor_id_actor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.premio_mejor_actor
    ADD CONSTRAINT premio_mejor_actor_id_actor_fkey FOREIGN KEY (id_actor) REFERENCES public.actor(id_actor);
 ]   ALTER TABLE ONLY public.premio_mejor_actor DROP CONSTRAINT premio_mejor_actor_id_actor_fkey;
       public          postgres    false    218    4666    225            H           2606    32820 <   premio_mejor_director premio_mejor_director_id_director_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.premio_mejor_director
    ADD CONSTRAINT premio_mejor_director_id_director_fkey FOREIGN KEY (id_director) REFERENCES public.director(id_director);
 f   ALTER TABLE ONLY public.premio_mejor_director DROP CONSTRAINT premio_mejor_director_id_director_fkey;
       public          postgres    false    223    216    4664            J           2606    32842 <   premio_mejor_pelicula premio_mejor_pelicula_id_pelicula_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.premio_mejor_pelicula
    ADD CONSTRAINT premio_mejor_pelicula_id_pelicula_fkey FOREIGN KEY (id_pelicula) REFERENCES public.pelicula(id_pelicula);
 f   ALTER TABLE ONLY public.premio_mejor_pelicula DROP CONSTRAINT premio_mejor_pelicula_id_pelicula_fkey;
       public          postgres    false    4668    227    220            �   �  x�eWIv�6]��	�ɥ<Ķ,ɶdɖ_6P7܍�I&[��Yr���D�e)
���-ؽ�:�g��~���<3U��/�����U/�ˣ�7z`��]�Y���>�쓱�fU�+v�O��m����d&V\�7�4�!{9.8��5�0C�������=�V3��1��h��v|�!��M7���':@��=�1�hF��B���f�,ꕊ��}�v�s��Y�,YpQ�w�����a�-+J.${�Ovx�8��fe�E�>��w|�>O�
�Z����BՊ:��6鑞�Ն���O�}Ի���h�h�W�d͘�Z�W^��W�?���S/�0u��˄�B�^������3�9/��N�vG��B�/�t4���~1��h�b:����{V��P�����xK���[3���!
k����>g��E�A�Ο���̩E�Z�:^(^
�Q�OX�^O�y��#/�`i&��dW64���ly)٫��@0�@��B�WXI(��b�;�8d��s�+s^�`���GC� ��a�z�R�Mw��wo��5��!&sv�uم�Må`�캷�N?���`���˔����{g��dgz�O�w`��7\i��1��x�T���h��5;�qaAD��Zz�/[���O�*�UN��X�փ���G�')�jxU��C�J6 ��	zbE�+��)H��<�+]bEkX���kl3��{�jإ9vf��\�O)���?<����}��P�
0\�n��^U��7CG�����0����p�I�=@���j�mf?0����狦�?�
U���Ӑ��mk�'��v�ŉ�q�՞�`xS��h� ��]��3+^�Bw��g�i8�H��ep�ա�u��I�j�:�
���d6A\xN��?Q5�3��n���:,?MOi�Qv�Ogk���=���Q�)�Ƃ���M���H6��dp��4����G�����}�uC��zt^D<��&a��	�ڴ��>�=e�C?���8m,6�f֊�]3�����QR9Fe`�:B �6YW�߂�Ulͭ��9o�޽����f�㴜6��w�cg�ΠϤ����]�N�9�Џӱ����B��vf���=�&�b���d"/�����4U�ӟ�F��+�����
�����`ȑHu�E�r;�VzP)��6՝[�=�^/i�����#�j�C�������z;&{p�s�OvKT���z��;%��D�����]ޛkI��'�*ot
C>�u�����Ө<PZ`�_XK�
�b�{�xk]�o��1n�9�
t�!�1�W�. ik���^?�	�b}	t�0�C+�a�f���8�����\]�pôOm�����K��w Z-�.��j���[Y����h��֜eBe�Vk�j���Aێ�{�;�R���?^��8����  ľ��B���|��`�u�NRXNJ���!��#��6d�,�� i�Q䆁a��3T|��A���ɨ����S�0d*��O��lR6"��H�3�1aS�5��t0�B��Ix yXP8L��	��$1���C�O
Z��`�ٛNl|���y!��%CoBZp��#n'BLd���l����j�|<P#�CL�Ɂ�3�8�O�*:?����p�Y$n�0$EWV��q�6z�2��M�*�L�R�8#Q}��옦R���CG	f����bT��!�S�!���d���8��UJ�f�+Hq�$o#�A��y�wI�5i����"�	?U�d$M���?� '�`�Q���s�j�����4*��D����(y�!�>�Ej&Eܹ
����}�ċ@R��$I���ّ�H��Q]�.YR�|�Q� O���M��[�������>pǤEƅ<��/�'ނLJ�Q(S��B~�1��l%6х~���G�����GSL�G��~��M
��      �   _  x�5�ɵI����վ�"��P@fZ$�
@"3�_��ko�ݾ�w�m|m�����,}쯍˓��+���r��ni�}k�տ�K;�s�/���.{c��<v
x�2��]�/�������$�����w}k�ލ��u����Ht�ֿ^k���Wy��$q��/?��_�V���x��;�A%��_��ڷ(�cwc��c|��}��NM�/7w�Wa��|������Z+��[#�����h��عf�����k/����9
���Uj��S���U"lN����8��V[��v�!{��J�ڲ�T���<y7�K�CI��4�Q��ҬAD�1%�pS��n�ϵ;>`>����F���{���O�:��{Y6��_g�˃�A/o�I4��!���*"��&�~ft��ˇȓ��g��XI��\3Zq#�6F�h4����I&��|��$�2�?'��ȧ��*csǳ-� 3hjQdd��H�NA�]��g^�6����d�z��{d��6�U��.��ӳnِ��P�ě�@v�V���o�cT��fG�4�GJ��{ݡ�-�qt��J�\���65���!��z��Z5��N#�Ï�T
���3�n�T'+�T��U'ͱWМ��|R�*e�R���	�N���LPN(�z_FF��^�T:@I�efԤ4��+f�@�٢��D�`a���2�&�[�\.�k�a}}k3U47_"qX�Ö���WM�^^g����y�/aHƼ�wK��tm��Ri���	|�
{������c�LshG3SB�S}F���<h���:D�i~0V=�(��Z�puMAp���P�S��Y�L���X���!3Y5L������N�D�~��Kz�������T;S��o��vj�P����L���O�3-��aR#����0�~�b�I�NrB٘��V��&�b<�蔳H�j�3d*�k�>i�1�_(o��`
�5������r�
zJ4��}��:3��>J�9M֍��Ϲ�pFz�\���Vyc:_����%�j�i���P��?�z��1��y�1���#��oL5��3��b˛�#ڍԅ�l��$QK�)꙾�iܛ�|mFgJoy������B�3l�Ń��RIH�6e^o�:Y��BW�X�pƕC(t��p"����r������-j���_�#d���حtF�����Ы���~�Rlaʝ΂`��_s�R���`��n)��F"��=(��cO!�'#��m���P��.�hnϭ'M�IGL�c7�a:�ƛ�q�b����SshQ�Y�vڦl�HT�T�u `[��S6u�/�HEM�VLlM�}q��
$-����@d�UA�%���hp+�&�hsp�:h���`8�ǯ(�I�=1��V]!��$?�|νX��t�@K1����Js!d����?G\1�b�^�i�h�o��Rs6�ql3�@%��4�n��F���q�EuO��i��g?P�q�Υ����n�P����������?����fN
L���z�8��I�Åu9qR+/(!�Fh��_�,�6cSt�j��wZ�C�Z�;r=r\;i�<�C��
��Vn�ы�F6�����6b�L��r&��hT��IL�	�'�C�|����)X      �   �  x�mWYv�8�N��+p�O�l˲lɖ^�@*���n�X��m�,s���Fj�|
KfdddP�[�5��&���=,�/�4���ŭg��k�=S��n����a��L�xɾ��58��;�	g�+��n�t03S���N�Ә���N����t����f�S��k�Ck�a?��y�ޛ��(�׋���*.v��o>��eU΅`�d�)�n�49�̭�go�cs��
��>��.�Cô�d�Z���i��Ux�����OfOLbI��8�i?fo�i��6;��NH�􈻯f�l�6]O����_�<�xxgvo���ʒ�"Aza�f Hw<�:��</�S1EY�L�❀'��;;"��f�MGW��2b�q�x�0�L�<W�c���q����#z�=Wͮ��d_�eF�%/v��L'd��"5/;��$}���E�>ڧ��.dTI^�֞��쬙3�}�rZ�9��{�9,��el�b�W�qBY
� ���2��bW�3S��,^hvo�温N��܁z��L�ݡD�*E���Ht�z�.�C%�M?ΔoY�7���aA�˵6��k^V�����y�.�R�G��L3+%/{��{�'X�$�Ӯk'�&�����]��I)^�s��2�����`U�
�A;T�J��reͫ�y����b���k��*�do̓��;3RQ+�o��}�ֵP�N�O<�pjvg����x�cg؊�ܛ�aBBLCW*�����;.s����\R6G���&.��,=	>��Pزb�{�(�ܡ�$HA�T�f��`���F@o��I.k
7��v��ָK	��G�q�v��eCX�Z�#%WŪ���d7t�*t0�����-i���=0*���Գ8���A���JGjA��(�w����\�إ��g�Eb� t��م�q���S�*@[��]V�D�j+�f�gL���1��QYr��k3����3�P�*q����:���w�p���i�0���ſ6.v��~�ka�A�"���8Hhv�.=��\m���UB(�
q�eP�0�j^�D�К�I�C$a*^��<�B�$���<엮3-�U�9"���4ԉ��۴��O7h�-�A�c=���U���F�[�_�a1Xt�ةMo�����6�X��v�(L{R�o+0^1�c��=(���sS��bU�ϖ& -�Jy���L��m35sإ�20���*ڭ���2���4�ܤĘ"��B8k������&� ��;�+�����,���}a"mpN�>u�:�Y)�|���	��������[�	�����& Ⱳ�.�4)���I.)�z�23�w'9��D�l0�(����o�H��)�D��4އ�q�]KT�pB�`��A�ܕ[R��J����7Hz,d�iM0������X�D%���$A���Ԫ���*#�z� ��� �i����4樀9p��v�����v���+:5�F�0��;e��������S�ЄS��Eˋh�V����e����8�,,LC�w���B����)�4��ǽ}�:W� ҕ�F�S�K�ϗ�c�`�涷T'��Y����ٛ�?���5���)����/�y�@�72�����'���ibQ��b�N`Q"8���3����^a.Q��7��\�HBa���E&�`�T�Jt/��ޱp$�p���Z�u�Å�Y�P�;	�'}C��*�ܴ�v+��m�ӫ��ZMku"v��%��V���ń�#w�X���ϓu�X���!/`'R�$���U (����z����}	؉t~h�V���xu�w��@��xn�5vܦ�O$�J�.��UܩL�}�QKt��xfs�y�8Bg�CB��;~�=<�t�ozE����,����߈���?�����9���*      �      x��\��I��3��?����GD�c�\iV�;�SNɮ�i�XuUoVm�3�
#���j����#�1���x p8H�ʙ����m:-�������<~Z���r�?�u�~�̯��1�m��s>[�ʸK�����|{����������T��t{��K�<�2�禥��2]�U��x�NӢ�N��}>���O'�,�e��]��X�����L;}��_'=��x��=-�u����J�������Xz/r�ۼL�Q�!��L���2~��:���OI���M?[[��m����<��ty�з����k�ip�>�q_��x~���:�ִf���Z�ם��r�*��ʄ��5��Uk��|�&�������u��I/��t�G4M*ӆ�ߦ�?��^��C6F_����6|�c���⛎��yz���o��}��GK�φ���Y�|������[<�m|�V�y%�p=,�g~����vX���׈���O����i٪�/�]�p�60]ez>�3�h����l�+��mk�W��x���2>���x,v����͛~cs�&�;>W!o��%^��ڸj`���_���h�o��^����uz&cЋ�,��^���Ъ�2���5��9Ȗ���5����&T�C�Rz���t�/cz�E���6���2=M�h~�7z�©izR�s�S[Su�d�{��+��-9�y~Yʘ�����xm�m��e�Ƨ%څ9=�˦���A3�Al[����F�V����x�<;�ö�nK���u��#���n՟��;�L+M�;2����]ߗ�����/d\�n�\�Ʊe������<����3� �VV�mW����ޞ�����??�c��Q�6�A^�e�n�q~�.�wr���,�e�w��s��bb�	�Op���~P�% jB��!��}:�E�F,߄������ae��}yY[R��b���"�Z[�V2��h�W�����³z�Ǔ�n�o����-�)��tZ""�~��Bt�PӅMcĕb^M���"mTt6�h�"��������2���N�#_50F������+y����_*�l"��K�~*��谰�s���N96��k���[���r;�r�$L��d^:�@D�
�ڧE�4��$������lL̲1����#�:S�f���N@P@w�����-���u�^�{��ǿ�)�\�O�:�1��S����_���Jϰ�4� 'x ���1I����2��M0�@��&#�e�t*]u�����R~��$l�q*cF1���E�O����*�����&!K˞s�^�vG�̙eZ�
����������t�4Ӟ�(@���)�ߕ�Jc\��z)ݧ���L�����u59���3,���=DALӭ=����"�Y��9iO�� ��2��͉�p�uO��;�0�.1?~[�ęJ���L�ژNyR�l��Ҙ䡂Ue�=���F��>�WGC�_��2���A�[n�$-}��	����i)�l�	/�"09����4���yLT�<>�� �9{��� ikЬ6D�A��K\� �ÐB�w1E;�]_�(�j-C��Hr5erE���1��3�uVmaC��s�*FY�-0��4�<� �c�J�à<k�[)?���0���(�I+�r��a�	��9��'����=�=)3������M�� S�J��xH��4�c���EH�j
��(��-{i/���iM6�we��z'�Z��t�ՑkU��Tʬ*sDs#9���H���e~y�d�r���N�eo�:+�&GĮ�֯�	�o<�o�"���F��m�g��W=tP�!�;- ��	BDq`x�땈�:��A��Zylg�tũmF��}i��1� ؄�F�6�zK����o5�gnt50�����OX�$�My�S���x}��?�D�S�p���L�md���F
9H���̏vu5����Ґ���VLa�fF��!������B�wP�x)r�/F�����'�Kt$~����3!A���>���5�5gW-�"����=��5��/0���ԔO#�X����iuJ�0R S��Ax�&�"�PPO�TK�8h�Cy��G�:�d���V�X@H��ሊ���Wՠ)���V��"�X�
nH�5AG��r�e:�9�"2�`�u�*�rc	���
-��|�]��:'���$��%cH���ѭ��EE�x8�<Կ}�q�0�X�9`�u{��"i_lj��@��v~�JoL{��Q�R�k��$(���K���� u`�{��u:}��� 3 ��p3�?ԕ��,�l�F����υK���<�1r�4⋖%�"�S���Â(���&��UO(
Z�����;�|u���+����M��=�ѷ�V�kY���l�"eS�\/�qqd(G��H�N �}T,F�ڳ1� �e�y �q"Zq*.8����ToG-�e�6��
��L��#�A�׏�^�Wާ��g�5>I���1ξN�x�_�����c�$dh:��[<��,޺ Dy��0b�6�d�'�rX��V�t�
�FA	�ڽ�x����!���Y3�_��oIN�4����*e�䀨S'喩���8���gT�s����^h*wŜ��B"J�A֘j֥�����e:ֲ���+S����_)a)$m�=jP��0�¨m�F�U]�G2���ALQ�z���$��5I]$Ú5�D�N%'GA��ŭz�,�C��-S��+�E�*u'�}z(�/~����*����My��]���RO9�e���'W��A����ڏ�Y�?�9	!6x83�#��Fqc�mQ)^�<D��N%.	�m�GZy�X\s��:;�_���k��2s���t`�N--���͗O���K��v}}*H.� ���	k)v��I��xn�j8%�0�yp�6��LZ%��H[Ϋ�DyN�O��a,�5��S؁��~��E�<�vaԓ�w����˹xɬIkg���
j��՘ڽB�Z�J£M���mJ�������`���d�e+cKu�nȅz#�.� )�]!�����eKX�6ka���U�#��L"��&����}�?��H��j�v��e`�����h�s	ʠ�P��%���e������Z�5�)�
�g#F��Ŵ�+����H���ɖb@⍨�rv��u9KRՋ&:P�H"x�YW\Ż�钐��QESHg�
f�`P��$ ��o�����I���J����vy-#!��1�ܽTh�}�$}�9�n�Q���CH,8P��V��W��`��#ӵD,��rG��J��Aiy�GBjTS�v\�F��\t��
�PU1�`t8g[4
�)z�C.�Q=��B�z���x��fN#��iYg*ǮkB�	����`/iH''��u�8al��h��n	!ʊq¼!��-��N9b//�͙)���qUԤz��x��y\#��mo�����f]H3>�ȴ�5��F3���.�$,Z����:�i��вU��i
��
	Բ��f�ަ�w摧>��\=gtȫ�ɝ�{�I�*�S�V4���{aB�V����N	��2]�?�+�?�����,1%��UoT��:��;�U�;��.�>p��r��G�c�΢��2]0�x�:�^]n�J���g��%�/��.E:o�q=$����+����V|ת��
I��[����X��|^�f���%��.8&�yd��w���QUD���oTQ�,۞�ou����V5��,k.g��׎�����-9/��S�D����6�渨����=K3G��ʬ�=c�t����vn���z��ǘ�&�v��V�L�4�i��l�9�0�S����[f/W��A�B����=��k�,^��^�(0` ��H7� \�:w	f���.�˷q�-�X��t��E�9�Ҵ�7i>��jA�˔�G0��;���l9���RRhQ�����N*	h����H@���i���Fl���]��*c�:eU&5�iϹ��������q
KCL�)�D�ͅS����S�
�z�j��)M+��K� U  �Bg����]�S��D��>
Km�A�:�剝�G�-3j��M������RI����mK��4���}�������M�EA:P��j�Xq
� ^,=�p�u��C�%�F4��K4��[�!��	�	>{���h��{iW�B��*)0ck��e7�ɯ���.�ZTl[
5���f�T��6�o�j���fi���� �O�屖������q�`kM�N��'�|[�C�.*8�E�����x+u�A׶�őQ�C[&U�>�� W��0T�ߌ��q�B6O=f
f�#s˛Ayfz� m'�Eh�� ��H��sN���v/�(��(փ6J�]V�,��S��/*� :�p�a?%�����0��2K�GZ��e
���G�J���\� P֪��y,�w���"At[#ӣ$������$�*�Τ.���Eg�q�m�-ޒ�	�Z�-�+�
a܌��Z�o[o�j�8:$�����>�af`_@����@\߯���;l��~�8� 3)K������0���A����#qmG
^��{�#�����9D�]W�O���u�Y� �K<��9��̓����N�[�4��1�,Z/i���ʒ'�-�0o��*��Y\�9��\?@���C*���<�J�h������w
�r��#5��G�q�;���W��+�xI���,2zY�_�� v��&D��푾�z?���ҡ��jV'CK����3�&F��B̤�)<��ٲ]E����R��%�UL����x�C���2����^���� ��iM0��~[�8�V�B���`7F�W_�E-~�����&�ڹLem����}�����ҏߖ��y+������'�,����
*�hY�������X˘�H\��;��WC���R���/�s��=.D�/�Ql���C�BT��d�+^�JEYEDjh�kʟ7E����)���{D���b�Mkiݐ*�e�L_l��]�@��Z����gÓ�vh�'���*��b>�%��߃uq�j��m�nr5B�ro��a`&{Dv�1~:����X�L�M����� ��R(�2���]��F�BE�9�0g�E#󍁟�}#�A���Dq.�8c�X�A����)^��+�,f�
 �q���3(�K�������(O�)=7yz%U@�`�E��K�R�Y�X�w������G��
�R냓xX��n��.m;�I	:�k�A�T	7h�RS�?[ډ�j'K�9���;~g~�<��Ce�~`����T܄���(���Jm)�u�O�����ߥOm}��zק�6~<��e�����P�-Ɂ��e�`O��6�Qə��<�H=���)��O�+���jy~�/]��TV}�s3�ٶy�������s��^M�f�4ׂ��z�P��ou��bL�r��l�a�˵l��������4��#6�{�}��4^�t���H��v�d�b�UJ��{{����k�ÝgK4�?�D��&�f��1	�� |9�M/��*�{���|l.*�~F�G�c$҄���RZ��#��c����V�T�����A >�Tպ�����LzPy�!-e���!6�Ji2F����++Oi� s�*C��������@��      �   �   x�-�ˍ0Cϸ�&��鿎5�9Ų���<,�p,c\cߋm\O��O:�T�l -�e��5�E������m��Ψ�ak�(�������1�iU��cSy��`�5Ң�����;:AK;!'��z��>�m{���θy��5�J2m������V�=�������Ug>�o����|9|      �   �   x�-P��0zK17A�1�l�uf�%C 14?�k5��K���s��:�zW�F\DW�/$�5҆��Wc�Z�"�l� �5t7�V��c��S!9�$۲~tY[b��WI��uPk����810�4��	�����Y��
�1i��~FIj�j*����]'�h���/p��@M����?�w5�      �   �   x�=PA�!:��l�M����K���`I�eYx,��V9���a���D�¶��w�r���AD[���p-R��n�	`�ԽIh�a?Z�����Bs�7(�z�Y{�,��>���[��r�$Bԃ�Ur�|{EX�i{:N�B�k�z"���J~lMG�D�y8B�'�ˮWc;���:�����{8�     