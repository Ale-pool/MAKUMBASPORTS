PGDMP  6        	            |            Commercesports    16.3    16.3 U    v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            x           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            y           1262    16742    Commercesports    DATABASE     �   CREATE DATABASE "Commercesports" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
     DROP DATABASE "Commercesports";
                postgres    false            z           0    0    DATABASE "Commercesports"    COMMENT     �   COMMENT ON DATABASE "Commercesports" IS 'Estara los diferentes tablas, entidades y atributos del proyecto de curso de Arquictectura de Software';
                   postgres    false    4985                        2615    16998    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            {           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    6            |           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    6                        3079    16999 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false    6            }           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1255    17207 P   actualizar_cliente(uuid, character varying, character varying, uuid, uuid, uuid) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_cliente(IN p_idcliente uuid, IN p_nombre character varying, IN p_apellido character varying, IN p_iddocumento uuid, IN p_idestadocivil uuid, IN p_idgenero uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Cliente
    SET Nombre = p_nombre, Apellido = p_apellido, IdDocumento = p_iddocumento, IdEstadoCivil = p_idestadocivil, IdGenero = p_idgenero, Actualizar = NOW()
    WHERE IdCliente = p_idcliente;
END;
$$;
 �   DROP PROCEDURE public.actualizar_cliente(IN p_idcliente uuid, IN p_nombre character varying, IN p_apellido character varying, IN p_iddocumento uuid, IN p_idestadocivil uuid, IN p_idgenero uuid);
       public          postgres    false    6            �            1255    17204 *   actualizar_membresia(uuid, interval, uuid) 	   PROCEDURE     :  CREATE PROCEDURE public.actualizar_membresia(IN p_idmembresia uuid, IN p_fecha_fin interval, IN p_idtipomembresia uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Membresia
    SET FechaFin = p_fecha_fin, IdTipoMembresia = p_idtipomembresia, Actualizar = NOW()
    WHERE IdMembresia = p_idmembresia;
END;
$$;
 w   DROP PROCEDURE public.actualizar_membresia(IN p_idmembresia uuid, IN p_fecha_fin interval, IN p_idtipomembresia uuid);
       public          postgres    false    6            �            1255    17201 1   actualizar_pais(uuid, character varying, boolean) 	   PROCEDURE     
  CREATE PROCEDURE public.actualizar_pais(IN p_idpais uuid, IN p_nombre character varying, IN p_activo boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Pais
    SET Nombre = p_nombre, Activo = p_activo, Actualizar = NOW()
    WHERE IdPais = p_idpais;
END;
$$;
 m   DROP PROCEDURE public.actualizar_pais(IN p_idpais uuid, IN p_nombre character varying, IN p_activo boolean);
       public          postgres    false    6            �            1255    17205    eliminar_membresia(uuid) 	   PROCEDURE     �   CREATE PROCEDURE public.eliminar_membresia(IN p_idmembresia uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Membresia
    WHERE IdMembresia = p_idmembresia;
END;
$$;
 A   DROP PROCEDURE public.eliminar_membresia(IN p_idmembresia uuid);
       public          postgres    false    6            �            1255    17206 H   insertar_cliente(character varying, character varying, uuid, uuid, uuid) 	   PROCEDURE     �  CREATE PROCEDURE public.insertar_cliente(IN p_nombre character varying, IN p_apellido character varying, IN p_iddocumento uuid, IN p_idestadocivil uuid, IN p_idgenero uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Cliente (IdCliente, Nombre, Apellido, IdDocumento, IdEstadoCivil, IdGenero, Activo, Actualizar)
    VALUES (uuid_generate_v4(), p_nombre, p_apellido, p_iddocumento, p_idestadocivil, p_idgenero, B'1', NOW());
END;
$$;
 �   DROP PROCEDURE public.insertar_cliente(IN p_nombre character varying, IN p_apellido character varying, IN p_iddocumento uuid, IN p_idestadocivil uuid, IN p_idgenero uuid);
       public          postgres    false    6            �            1255    17203 .   insertar_membresia(date, interval, uuid, uuid) 	   PROCEDURE     �  CREATE PROCEDURE public.insertar_membresia(IN p_fecha_inicio date, IN p_fecha_fin interval, IN p_idcliente uuid, IN p_idtipomembresia uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Membresia (IdMembresia, FechaInicio, FechaFin, IdCliente, IdTipoMembresia, Activo, Actualizar)
    VALUES (uuid_generate_v4(), p_fecha_inicio, p_fecha_fin, p_idcliente, p_idtipomembresia, B'1', NOW());
END;
$$;
 �   DROP PROCEDURE public.insertar_membresia(IN p_fecha_inicio date, IN p_fecha_fin interval, IN p_idcliente uuid, IN p_idtipomembresia uuid);
       public          postgres    false    6            �            1255    17200 )   insertar_pais(character varying, boolean) 	   PROCEDURE     �   CREATE PROCEDURE public.insertar_pais(IN p_nombre character varying, IN p_activo boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Pais (IdPais, Nombre, Activo, Actualizar)
    VALUES (uuid_generate_v4(), p_nombre, p_activo, NOW());
END;
$$;
 Y   DROP PROCEDURE public.insertar_pais(IN p_nombre character varying, IN p_activo boolean);
       public          postgres    false    6            �            1255    17208    obtener_clientes_activos()    FUNCTION     R  CREATE FUNCTION public.obtener_clientes_activos() RETURNS TABLE(idcliente uuid, nombre character varying, apellido character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT IdCliente, Nombre, Apellido, Activo, Actualizar FROM Cliente WHERE Activo = B'1';
END;
$$;
 1   DROP FUNCTION public.obtener_clientes_activos();
       public          postgres    false    6            �            1255    17202    obtener_paises_activos()    FUNCTION     %  CREATE FUNCTION public.obtener_paises_activos() RETURNS TABLE(idpais uuid, nombre character varying, activo boolean, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT IdPais, Nombre, Activo, Actualizar FROM Pais WHERE Activo = TRUE;
END;
$$;
 /   DROP FUNCTION public.obtener_paises_activos();
       public          postgres    false    6            �            1259    17025    ciudad    TABLE     �   CREATE TABLE public.ciudad (
    idciudad uuid NOT NULL,
    iddepartamento uuid,
    nombre character varying(255),
    activo boolean,
    actualizar timestamp without time zone
);
    DROP TABLE public.ciudad;
       public         heap    postgres    false    6            �            1259    17078    cliente    TABLE       CREATE TABLE public.cliente (
    idcliente uuid NOT NULL,
    nombre character varying(255),
    apellido character varying(255),
    iddocumento uuid,
    idestadocivil uuid,
    idgenero uuid,
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.cliente;
       public         heap    postgres    false    6            �            1259    17015    departamento    TABLE     �   CREATE TABLE public.departamento (
    iddepartamento uuid NOT NULL,
    idpais uuid,
    nombre character varying(255),
    activo boolean,
    actualizar timestamp without time zone
);
     DROP TABLE public.departamento;
       public         heap    postgres    false    6            �            1259    17162    detallefactura    TABLE     �   CREATE TABLE public.detallefactura (
    iddetallefactura uuid NOT NULL,
    cantidad integer,
    preciounitario money,
    idfactura uuid,
    descr_ character varying(255),
    activo bit(1),
    actualizar timestamp without time zone
);
 "   DROP TABLE public.detallefactura;
       public         heap    postgres    false    6            �            1259    17132    detallemembresia    TABLE     �   CREATE TABLE public.detallemembresia (
    iddetalle uuid NOT NULL,
    fechapago date,
    montopagado money,
    idmembresia uuid,
    activo bit(1),
    actualizar timestamp without time zone
);
 $   DROP TABLE public.detallemembresia;
       public         heap    postgres    false    6            �            1259    17059 	   documento    TABLE     �   CREATE TABLE public.documento (
    iddocumento uuid NOT NULL,
    numero bigint,
    fechaexpedicion date,
    lugar character varying(255),
    descrip_ character varying(255),
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.documento;
       public         heap    postgres    false    6            �            1259    17100    empleado    TABLE       CREATE TABLE public.empleado (
    idempleado uuid NOT NULL,
    nombre character varying(255),
    apellido character varying(255),
    cargo character varying(255),
    salario numeric(10,2),
    idsede uuid,
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.empleado;
       public         heap    postgres    false    6            �            1259    17066    estadocivil    TABLE     �   CREATE TABLE public.estadocivil (
    idestadocivil uuid NOT NULL,
    fechacambio date,
    tipoestadocivil character varying(255),
    descrip_ character varying(255),
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.estadocivil;
       public         heap    postgres    false    6            �            1259    17172    estadofactura    TABLE     �   CREATE TABLE public.estadofactura (
    idestadofactura uuid NOT NULL,
    descr_ character varying(255),
    fechacambio date,
    idfactura uuid,
    activo bit(1),
    actualizar timestamp without time zone
);
 !   DROP TABLE public.estadofactura;
       public         heap    postgres    false    6            �            1259    17147    factura    TABLE     �   CREATE TABLE public.factura (
    idfactura uuid NOT NULL,
    fecha date,
    montototal money,
    idcliente uuid,
    idmetodopago uuid,
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.factura;
       public         heap    postgres    false    6            �            1259    17073    genero    TABLE     �   CREATE TABLE public.genero (
    idgenero uuid NOT NULL,
    descr_ character varying(255),
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.genero;
       public         heap    postgres    false    6            �            1259    17035    gimnasio    TABLE     �   CREATE TABLE public.gimnasio (
    idgimnasio uuid NOT NULL,
    idciudad uuid,
    nombre character varying(255),
    tipo character varying(255),
    nit integer,
    fechaapertura date,
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.gimnasio;
       public         heap    postgres    false    6            �            1259    17117 	   membresia    TABLE     �   CREATE TABLE public.membresia (
    idmembresia uuid NOT NULL,
    fechainicio date,
    fechafin interval,
    idcliente uuid,
    idtipomembresia uuid,
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.membresia;
       public         heap    postgres    false    6            �            1259    17142 
   metodopago    TABLE     �   CREATE TABLE public.metodopago (
    idmetodopago uuid NOT NULL,
    descr_ character varying(255),
    activo boolean,
    actualizar timestamp without time zone
);
    DROP TABLE public.metodopago;
       public         heap    postgres    false    6            �            1259    17010    pais    TABLE     �   CREATE TABLE public.pais (
    idpais uuid NOT NULL,
    nombre character varying(255),
    activo boolean,
    actualizar timestamp without time zone
);
    DROP TABLE public.pais;
       public         heap    postgres    false    6            �            1259    17047    sede    TABLE     �   CREATE TABLE public.sede (
    idsede uuid NOT NULL,
    idgimnasio uuid,
    nombre character varying(255),
    telefono bigint,
    horario character varying(255),
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.sede;
       public         heap    postgres    false    6            �            1259    17112    tipomembresia    TABLE     �   CREATE TABLE public.tipomembresia (
    idtipomembresia uuid NOT NULL,
    descrip_ character varying(255),
    precio money,
    duracion interval,
    activo bit(1),
    actualizar timestamp without time zone
);
 !   DROP TABLE public.tipomembresia;
       public         heap    postgres    false    6            e          0    17025    ciudad 
   TABLE DATA           V   COPY public.ciudad (idciudad, iddepartamento, nombre, activo, actualizar) FROM stdin;
    public          postgres    false    218   �t       k          0    17078    cliente 
   TABLE DATA           x   COPY public.cliente (idcliente, nombre, apellido, iddocumento, idestadocivil, idgenero, activo, actualizar) FROM stdin;
    public          postgres    false    224   8v       d          0    17015    departamento 
   TABLE DATA           Z   COPY public.departamento (iddepartamento, idpais, nombre, activo, actualizar) FROM stdin;
    public          postgres    false    217   Lx       r          0    17162    detallefactura 
   TABLE DATA           {   COPY public.detallefactura (iddetallefactura, cantidad, preciounitario, idfactura, descr_, activo, actualizar) FROM stdin;
    public          postgres    false    231   �y       o          0    17132    detallemembresia 
   TABLE DATA           n   COPY public.detallemembresia (iddetalle, fechapago, montopagado, idmembresia, activo, actualizar) FROM stdin;
    public          postgres    false    228   {       h          0    17059 	   documento 
   TABLE DATA           n   COPY public.documento (iddocumento, numero, fechaexpedicion, lugar, descrip_, activo, actualizar) FROM stdin;
    public          postgres    false    221   C|       l          0    17100    empleado 
   TABLE DATA           l   COPY public.empleado (idempleado, nombre, apellido, cargo, salario, idsede, activo, actualizar) FROM stdin;
    public          postgres    false    225   �}       i          0    17066    estadocivil 
   TABLE DATA           p   COPY public.estadocivil (idestadocivil, fechacambio, tipoestadocivil, descrip_, activo, actualizar) FROM stdin;
    public          postgres    false    222   <       s          0    17172    estadofactura 
   TABLE DATA           l   COPY public.estadofactura (idestadofactura, descr_, fechacambio, idfactura, activo, actualizar) FROM stdin;
    public          postgres    false    232   M�       q          0    17147    factura 
   TABLE DATA           l   COPY public.factura (idfactura, fecha, montototal, idcliente, idmetodopago, activo, actualizar) FROM stdin;
    public          postgres    false    230   ��       j          0    17073    genero 
   TABLE DATA           F   COPY public.genero (idgenero, descr_, activo, actualizar) FROM stdin;
    public          postgres    false    223   4�       f          0    17035    gimnasio 
   TABLE DATA           n   COPY public.gimnasio (idgimnasio, idciudad, nombre, tipo, nit, fechaapertura, activo, actualizar) FROM stdin;
    public          postgres    false    219   ��       n          0    17117 	   membresia 
   TABLE DATA           w   COPY public.membresia (idmembresia, fechainicio, fechafin, idcliente, idtipomembresia, activo, actualizar) FROM stdin;
    public          postgres    false    227   :�       p          0    17142 
   metodopago 
   TABLE DATA           N   COPY public.metodopago (idmetodopago, descr_, activo, actualizar) FROM stdin;
    public          postgres    false    229   �       c          0    17010    pais 
   TABLE DATA           B   COPY public.pais (idpais, nombre, activo, actualizar) FROM stdin;
    public          postgres    false    216   ��       g          0    17047    sede 
   TABLE DATA           a   COPY public.sede (idsede, idgimnasio, nombre, telefono, horario, activo, actualizar) FROM stdin;
    public          postgres    false    220   ��       m          0    17112    tipomembresia 
   TABLE DATA           h   COPY public.tipomembresia (idtipomembresia, descrip_, precio, duracion, activo, actualizar) FROM stdin;
    public          postgres    false    226   <�       �           2606    17029    ciudad ciudad_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (idciudad);
 <   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_pkey;
       public            postgres    false    218            �           2606    17084    cliente cliente_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    224            �           2606    17019    departamento departamento_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (iddepartamento);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public            postgres    false    217            �           2606    17166 "   detallefactura detallefactura_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.detallefactura
    ADD CONSTRAINT detallefactura_pkey PRIMARY KEY (iddetallefactura);
 L   ALTER TABLE ONLY public.detallefactura DROP CONSTRAINT detallefactura_pkey;
       public            postgres    false    231            �           2606    17136 &   detallemembresia detallemembresia_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.detallemembresia
    ADD CONSTRAINT detallemembresia_pkey PRIMARY KEY (iddetalle);
 P   ALTER TABLE ONLY public.detallemembresia DROP CONSTRAINT detallemembresia_pkey;
       public            postgres    false    228            �           2606    17065    documento documento_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (iddocumento);
 B   ALTER TABLE ONLY public.documento DROP CONSTRAINT documento_pkey;
       public            postgres    false    221            �           2606    17106    empleado empleado_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (idempleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    225            �           2606    17072    estadocivil estadocivil_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.estadocivil
    ADD CONSTRAINT estadocivil_pkey PRIMARY KEY (idestadocivil);
 F   ALTER TABLE ONLY public.estadocivil DROP CONSTRAINT estadocivil_pkey;
       public            postgres    false    222            �           2606    17176     estadofactura estadofactura_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadofactura
    ADD CONSTRAINT estadofactura_pkey PRIMARY KEY (idestadofactura);
 J   ALTER TABLE ONLY public.estadofactura DROP CONSTRAINT estadofactura_pkey;
       public            postgres    false    232            �           2606    17151    factura factura_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (idfactura);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    230            �           2606    17077    genero genero_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (idgenero);
 <   ALTER TABLE ONLY public.genero DROP CONSTRAINT genero_pkey;
       public            postgres    false    223            �           2606    17041    gimnasio gimnasio_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.gimnasio
    ADD CONSTRAINT gimnasio_pkey PRIMARY KEY (idgimnasio);
 @   ALTER TABLE ONLY public.gimnasio DROP CONSTRAINT gimnasio_pkey;
       public            postgres    false    219            �           2606    17121    membresia membresia_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_pkey PRIMARY KEY (idmembresia);
 B   ALTER TABLE ONLY public.membresia DROP CONSTRAINT membresia_pkey;
       public            postgres    false    227            �           2606    17146    metodopago metodopago_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.metodopago
    ADD CONSTRAINT metodopago_pkey PRIMARY KEY (idmetodopago);
 D   ALTER TABLE ONLY public.metodopago DROP CONSTRAINT metodopago_pkey;
       public            postgres    false    229            �           2606    17014    pais pais_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (idpais);
 8   ALTER TABLE ONLY public.pais DROP CONSTRAINT pais_pkey;
       public            postgres    false    216            �           2606    17053    sede sede_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.sede
    ADD CONSTRAINT sede_pkey PRIMARY KEY (idsede);
 8   ALTER TABLE ONLY public.sede DROP CONSTRAINT sede_pkey;
       public            postgres    false    220            �           2606    17116     tipomembresia tipomembresia_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.tipomembresia
    ADD CONSTRAINT tipomembresia_pkey PRIMARY KEY (idtipomembresia);
 J   ALTER TABLE ONLY public.tipomembresia DROP CONSTRAINT tipomembresia_pkey;
       public            postgres    false    226            �           2606    17030 !   ciudad ciudad_iddepartamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_iddepartamento_fkey FOREIGN KEY (iddepartamento) REFERENCES public.departamento(iddepartamento);
 K   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_iddepartamento_fkey;
       public          postgres    false    217    4774    218            �           2606    17085     cliente cliente_iddocumento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES public.documento(iddocumento);
 J   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_iddocumento_fkey;
       public          postgres    false    221    224    4782            �           2606    17090 "   cliente cliente_idestadocivil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_idestadocivil_fkey FOREIGN KEY (idestadocivil) REFERENCES public.estadocivil(idestadocivil);
 L   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_idestadocivil_fkey;
       public          postgres    false    224    222    4784            �           2606    17095    cliente cliente_idgenero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_idgenero_fkey FOREIGN KEY (idgenero) REFERENCES public.genero(idgenero);
 G   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_idgenero_fkey;
       public          postgres    false    224    223    4786            �           2606    17020 %   departamento departamento_idpais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_idpais_fkey FOREIGN KEY (idpais) REFERENCES public.pais(idpais);
 O   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_idpais_fkey;
       public          postgres    false    217    216    4772            �           2606    17167 ,   detallefactura detallefactura_idfactura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallefactura
    ADD CONSTRAINT detallefactura_idfactura_fkey FOREIGN KEY (idfactura) REFERENCES public.factura(idfactura);
 V   ALTER TABLE ONLY public.detallefactura DROP CONSTRAINT detallefactura_idfactura_fkey;
       public          postgres    false    230    231    4800            �           2606    17137 2   detallemembresia detallemembresia_idmembresia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallemembresia
    ADD CONSTRAINT detallemembresia_idmembresia_fkey FOREIGN KEY (idmembresia) REFERENCES public.membresia(idmembresia);
 \   ALTER TABLE ONLY public.detallemembresia DROP CONSTRAINT detallemembresia_idmembresia_fkey;
       public          postgres    false    227    4794    228            �           2606    17107    empleado empleado_idsede_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idsede_fkey FOREIGN KEY (idsede) REFERENCES public.sede(idsede);
 G   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idsede_fkey;
       public          postgres    false    220    4780    225            �           2606    17177 *   estadofactura estadofactura_idfactura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estadofactura
    ADD CONSTRAINT estadofactura_idfactura_fkey FOREIGN KEY (idfactura) REFERENCES public.factura(idfactura);
 T   ALTER TABLE ONLY public.estadofactura DROP CONSTRAINT estadofactura_idfactura_fkey;
       public          postgres    false    232    230    4800            �           2606    17152    factura factura_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 H   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_idcliente_fkey;
       public          postgres    false    4788    230    224            �           2606    17157 !   factura factura_idmetodopago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_idmetodopago_fkey FOREIGN KEY (idmetodopago) REFERENCES public.metodopago(idmetodopago);
 K   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_idmetodopago_fkey;
       public          postgres    false    4798    229    230            �           2606    17042    gimnasio gimnasio_idciudad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gimnasio
    ADD CONSTRAINT gimnasio_idciudad_fkey FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad);
 I   ALTER TABLE ONLY public.gimnasio DROP CONSTRAINT gimnasio_idciudad_fkey;
       public          postgres    false    4776    219    218            �           2606    17122 "   membresia membresia_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 L   ALTER TABLE ONLY public.membresia DROP CONSTRAINT membresia_idcliente_fkey;
       public          postgres    false    227    224    4788            �           2606    17127 (   membresia membresia_idtipomembresia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_idtipomembresia_fkey FOREIGN KEY (idtipomembresia) REFERENCES public.tipomembresia(idtipomembresia);
 R   ALTER TABLE ONLY public.membresia DROP CONSTRAINT membresia_idtipomembresia_fkey;
       public          postgres    false    226    4792    227            �           2606    17054    sede sede_idgimnasio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sede
    ADD CONSTRAINT sede_idgimnasio_fkey FOREIGN KEY (idgimnasio) REFERENCES public.gimnasio(idgimnasio);
 C   ALTER TABLE ONLY public.sede DROP CONSTRAINT sede_idgimnasio_fkey;
       public          postgres    false    219    4778    220            e   C  x���=N�AD�S����mn�HH�����V1���b.�� /իW�7�
�MA������]cj�U2g:�<�@�oH�
]'���^��\����[���U ��+>
=����*�i2S �b�%6�Е[��Ii*N�
��H%pW���`��-ʯ���v�g���mU���rw�C%K��� ��D�B.�ə�Mk���K��{ެ˱	�C/�LCp��^b���`�z�l�oDh=���+�����z~�����TaL�c��i�'t3��!�ԕ=��*������Q�VO�^^���7^��y8�N�����      k     x���1n0F��\�Ȏ����H��ŉ��Z�Cn�Љ#��� ��;����J�k_H���5a�\��:�������ݕO�?��]ä5F	��؉ S]c�*�+N�.���J��)l�c�z�ದRtp�I��f�F���'�B�b�	X_U�m��km�ooXk5�Tw�)�V������X��Yyg�}}�¨��.X��iy�5m_T�a�>�wit �u�V=H�ȱR:�9@k�Q�5r�@ڻu^����O�D�s�y�C�-㟑1O��������]~]�?�Ӄ�����56X0��]מs���0ۓ#��zP��4��,�� ~_��'M�A�O"k&'i��)���p��#��2�,�|yGz�PO	��T�>��'KW���m�/y>h�L� �{�Gí��DO�ݗ��~�>~}����:4��0�W�T'����c'�B����W~��Ay� ~�U�QKN�s�B4΢� �a��MɟO������?51�      d   7  x����m0F��^�EI՛�
��II���F~<QF�be��F�=��ٴQڂ�U����x3t��g�6�H�����V*T�
B��ܼ*��t�<_�ngM���*� �#��F��q� ��p�J��*�Z��h�§�e�/�[�������5�ĦPYlxZ1+�Q�ˠÚ�s8���>�h b"=����q<���ǿ��M�W�NPE��u��|/Ӓ�ʻM�s�GS�CA#�,�����?_��O��^�l��+���kcm�`v���I�V�9�&#��E�<E� ��g�,������p�s��      r   b  x��ҽ�SA�:y��xe{<?��v+(i����"���)x1�E�a鯏�{�'��:�8�� �LR�r]r�ûS�D|�x�	�1�bZ��"М'�m�ֳ_���;=���w��)�,�
�'�G�T�*�'
F�Cd�D�THe/_��� �A�E1O�,m�M�{^k�V��ȸ�|�������-�K��P�z�`-�-8�)�z�p�Ytv�u#l�y32܋X����uo����R�2�#�M5c)�ƹ�����Q�m�:&hP����[Wh��m���}>���N3�e�A�f�Ήtz�L��=��^��.�בT��a�W2�Pvؼ,g�{�ǳ]��oƗ����7��      o   .  x���;nC1k�)R���賤!%��G�����v�p�K��V6��NU����PM�1�ҙ����o���*���D ���R9{��E; 0=�=Q*��w�ɘ&`��J 0�[.k��x�����D̴�`c�חp�s��P�8��;J.�瑎Rp��sousC�}������H����FXB�~�����ڒ�	%�O���Ͼ@l�	�T��׿�_zi=����u~���	���@���&����kl?�w:�-�~�Z�nloW�/;.�&�`4ߠ����T�&��������?ٔ�h      h   .  x���=NA�zr���#��;3N	H	PD����li�m�!*��b/ƬD�����3cU���SJ�C��Q9&�5�d�%r�[�Z���y����|9�����G�J���\��q���-M(��n�oȭ�s�v�0�w1A"? �SPM9$Q�Jj���L�Ț�i?������A�z`	�:l��͔��sECX�6�:��vԓ��ק�H@����"g����e�%.m�l͕�qA�Re������y����mE|(�@υ����E���X�ԬR��Y��z ����t�}3>�o#���j��ԇ�      l   �  x�}ұj1�Z��sH��Vr�"����4�f�,�v��^so��U�^,���N�B���/���OP3F NT�j�v(6��󸚧뿓\̗i[d*</�Y�y*{kM,Vy�
i�
�}��*�`lN�7ΠE���݃����]p�Q&���"j�e�5UD8T�,[1��x1Gi���y׾�>)꬏-T@%*���� �N
A�ާ���T�[+@2
�Ĉ�V4/��l��t}_z>O���Đ��OC�4+�L��S:�H�e����R����SXr��$�`k��|���^�ϲ���<���Q.=������T��|)�IU�z�0����}HvT)���� N�M�#�Ҝs�q���w5?�e��|��m9��7�e�k~-?M�䜥��(8�����R2���߇�n�wb�      i     x����iAE��Qt$U������O��6hh�a���s58�����Ǔ���:ﲀ+L��F(�]U�o��qF󱭷v�����u���X�Y�����}�  όG��>�0s> ��-8�1{^�6��Pםg@���!x�S�f�6@���ʠ#P�b����#�E�<�KY^r���[ �wp��:�GJ�*�jv���b���+
6ڔh$����h��$W{�x�퀁��</�?�y]�=o�>L�����9      s   )  x���;nD1���*�"���YE����2���L3��Yp.p�Slu�'�KƄ��ē0l\��m�s�z�lH� �*�n`}!�����:�j�ި}�~p{��d�c�{L)n�"��&�dJ������n^p�Ye�	�~*��(�Y_ü�h�rV���hW��0f؏=���W�q��T����V:Ofn�r���|�Ƅ��c���a��E��?���/s�>4`�]����,�I�s���g�=7G����u^�栤c�fǴ?��k���O-jԍuz�F���vZ��z<��u�,      q   �  x���=�\1��7������OH�Y� !��fk�N9W)���l8b���8��pa�a�bd�zׯ��OD��x15a�h���t���p�>��N��	r�Y_�y��H����L�h�M�]��?�Rb�[��	1KU��5�:�~�F$}1�`b�1�nW��C6�V�x�)�	5A)�e�𔶖�F�=��������*��Q�j�J¹�~�f��b��G]E������	w�8{��!��Zn0t!䢵�[�v�3ƌ%m,�r�v����u�5�'j���ŘՌ6*�.�䁙��T�ǂcйlx���ȨE����s��Տ�g,�l� ϓ���q�$ ִ){�������1��pA��Cd	�L�}��hҋ���b�/0���Q~�Q��a��$��9�y>��<��      j   X  x���M�!@דS���� ��� �`l���D���/�˦��BH���dS����I��CWc��zu�����k���?�[�2fT�|�x'��ji�.���@�сf#0Y��\�Q��S���G$�T��ŀ�-)�4�LM�i����j���VZ�3�^H��J��c������{�\G^�C�̕I4�n˦��.�۷#�G\ϫ�؏�����`��ʕ'X�4������|�'�5���"u���\���89�h�F�<y-Y�M�WT��BM`$:{��*f�#~��v��Q�b��J$h<�BI�1�?�bTQQB�x3�ڲ�\s�C���������b_�      f   �  x�}��j0�Ϟ��(H�$�=���"oa3�����'J/>��X߿��ؤ8L�Rq@�Y��e�6��^��
��j ��r�^��0��������u���D�E�xM�����n�����Ex�G�,r�41k��vY�v���*V�UW�D����K�P%H�ٖ��K��v��_6���y�u���T2� hO��]����ˀ�|�~��Y��ܺ�v��y!S5(fۘ}_@8�MjY�����������s�"z�=�>͢�*1�un��*�4f�"s��4xn�$o�ilo��Z�L]pn�n5}=����gRO�z�Iլ�̉�!�giy���@Dl�����ؚ��VK3/�A}T���nn:�Qc�����S��Q�;�{x�3����+��      n   �  x���And1D׿O��1��Yf6쒑fV������G��rQ�*'I,
��p���J0��D�$��a�T碷��_W#ᦞ@S;��Tˁ	�0n��/��{m��8���`�*������ �[���N�G[|#j�RC����1n��)q?���w���֬�0�n�cu��ʁԣvj���3E̺A�&�9˅V'_�O:��9s%Eq��*q��{Un���;�>�j<c�Ŵ����me���ن^�O���]�=`�j!g���ɎuXW�~�f��q��tL$<?��(�;��u�6�*o�|��u�Tk6)+�Þ5���1��60^Sy�m���H(��o����c'ĐN�e���<�}WtgЪ%���+Oo9��(�K,�"j�κ�+����g�n�G}���v��!%��      p   �   x���;n�0��Y>�/��zQR�>��P$���5
�H9G.�L��?�\|5�iH�����U��N�}�γ���]/��nwCl�a��t��@�jjS�أ
	!y���1��EZ�>��/�K(V,�$E�$��&AP�b�Q�<��0ٗ��ƥ�1b�D�ns���@)�Ȼ������VYx~�Ux[�>�)�i �r��B�[zΨܰ{L���|z?L���i      c   �   x����M�0 гS����{�m���c"�G
[W#�������+H5#w��I]j����������g�H�@�Գڙ���,�$+4�9$wܩ�Pv8w�J�Kx�>��������������@�A��ھ�n�m����Bi��1h��S�]TM݌-Rk��^Ǳ�ֱ�2TԶ;u@H3�8��3�������8-���Z=      g   n  x��һN0�9�)x#_����C��]��Q�����t�"���ߩ�{5��P�y^�n��:i��9����r\�5��XkZP��+o�_�c�kDbQ��`�C<��*����7�wjwd�L��/�P��u��:Ĝ���lo,�Ś�OP��Ӡ᪎��}P����S�>�VM����c���o�Ӟ�o�$8{����49�fѳ����^����2��M�OL>��I��E��0_��+����ހ��ڜ�˦p�X����W����pC��B�����5����Z��e���x���F}�C��g۫��d*DD�P�ꌳx�f^?,��������b{?�$���r��^�U      m   �   x���;K�A��z�+RX:avn��N����f������*؜�9��(��f�H���@M͚�:��8?�-ܭ7�x��z�~1� @ZSܢn)n��y��T��.�PgV�X$֒$�^��~?�>����}@��j�AG� �:x��2�4���y���.����޹N������98�l9Q��p�Ms��4|�m��cL�6�ǫ@��`���RM�w������~�M�nV��'Bn`     