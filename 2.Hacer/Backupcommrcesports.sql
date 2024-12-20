PGDMP                  
    |            Commercesports    16.3    16.3 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16742    Commercesports    DATABASE     �   CREATE DATABASE "Commercesports" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
     DROP DATABASE "Commercesports";
                postgres    false            �           0    0    DATABASE "Commercesports"    COMMENT     �   COMMENT ON DATABASE "Commercesports" IS 'Estara los diferentes tablas, entidades y atributos del proyecto de curso de Arquictectura de Software';
                   postgres    false    5097                        2615    16998    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            �           0    0    SCHEMA public    COMMENT         COMMENT ON SCHEMA public IS '';
                   postgres    false    6            �           0    0    SCHEMA public    ACL     +   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
                   postgres    false    6                        3079    16999 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false    6            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            _           1255    17207 P   actualizar_cliente(uuid, character varying, character varying, uuid, uuid, uuid) 	   PROCEDURE     �  CREATE PROCEDURE public.actualizar_cliente(IN p_idcliente uuid, IN p_nombre character varying, IN p_apellido character varying, IN p_iddocumento uuid, IN p_idestadocivil uuid, IN p_idgenero uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Cliente
    SET Nombre = p_nombre, Apellido = p_apellido, IdDocumento = p_iddocumento, IdEstadoCivil = p_idestadocivil, IdGenero = p_idgenero, Actualizar = NOW()
    WHERE IdCliente = p_idcliente;
END;
$$;
 �   DROP PROCEDURE public.actualizar_cliente(IN p_idcliente uuid, IN p_nombre character varying, IN p_apellido character varying, IN p_iddocumento uuid, IN p_idestadocivil uuid, IN p_idgenero uuid);
       public          postgres    false    6            P           1255    17204 *   actualizar_membresia(uuid, interval, uuid) 	   PROCEDURE     :  CREATE PROCEDURE public.actualizar_membresia(IN p_idmembresia uuid, IN p_fecha_fin interval, IN p_idtipomembresia uuid)
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
       public          postgres    false    6            ^           1255    17697    consultar_ciudad_por_id(uuid)    FUNCTION     )  CREATE FUNCTION public.consultar_ciudad_por_id(p_id uuid) RETURNS TABLE(idciudad uuid, iddepartamento uuid, nombre character varying, activo boolean, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Ciudad WHERE IdCiudad = p_id;
END;
$$;
 9   DROP FUNCTION public.consultar_ciudad_por_id(p_id uuid);
       public          postgres    false    6            Y           1255    17696    consultar_ciudades()    FUNCTION       CREATE FUNCTION public.consultar_ciudades() RETURNS TABLE(idciudad uuid, iddepartamento uuid, nombre character varying, activo boolean, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Ciudad WHERE Activo = TRUE;
END;
$$;
 +   DROP FUNCTION public.consultar_ciudades();
       public          postgres    false    6                       1255    17733    consultar_cliente_por_id(uuid)    FUNCTION     e  CREATE FUNCTION public.consultar_cliente_por_id(p_id uuid) RETURNS TABLE(idcliente uuid, nombre character varying, apellido character varying, iddocumento uuid, idestadocivil uuid, idgenero uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Cliente WHERE IdCliente = p_id;
END;
$$;
 :   DROP FUNCTION public.consultar_cliente_por_id(p_id uuid);
       public          postgres    false    6                       1255    17732    consultar_clientes()    FUNCTION     S  CREATE FUNCTION public.consultar_clientes() RETURNS TABLE(idcliente uuid, nombre character varying, apellido character varying, iddocumento uuid, idestadocivil uuid, idgenero uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Cliente WHERE Activo = B'1';
END;
$$;
 +   DROP FUNCTION public.consultar_clientes();
       public          postgres    false    6            �            1255    17691 #   consultar_departamento_por_id(uuid)    FUNCTION     9  CREATE FUNCTION public.consultar_departamento_por_id(p_id uuid) RETURNS TABLE(iddepartamento uuid, idpais uuid, nombre character varying, activo boolean, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Departamento WHERE IdDepartamento = p_id;
END;
$$;
 ?   DROP FUNCTION public.consultar_departamento_por_id(p_id uuid);
       public          postgres    false    6            G           1255    17690    consultar_departamentos()    FUNCTION     "  CREATE FUNCTION public.consultar_departamentos() RETURNS TABLE(iddepartamento uuid, idpais uuid, nombre character varying, activo boolean, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Departamento WHERE Activo = TRUE;
END;
$$;
 0   DROP FUNCTION public.consultar_departamentos();
       public          postgres    false    6                       1255    17769 &   consultar_detalle_factura_por_id(uuid)    FUNCTION     i  CREATE FUNCTION public.consultar_detalle_factura_por_id(p_id uuid) RETURNS TABLE(iddetallefactura uuid, cantidad integer, preciounitario money, idfactura uuid, descr_ character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM DetalleFactura WHERE IdDetalleFactura = p_id;
END;
$$;
 B   DROP FUNCTION public.consultar_detalle_factura_por_id(p_id uuid);
       public          postgres    false    6                       1255    17768    consultar_detalle_facturas()    FUNCTION     P  CREATE FUNCTION public.consultar_detalle_facturas() RETURNS TABLE(iddetallefactura uuid, cantidad integer, preciounitario money, idfactura uuid, descr_ character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM DetalleFactura WHERE Activo = B'1';
END;
$$;
 3   DROP FUNCTION public.consultar_detalle_facturas();
       public          postgres    false    6                       1255    17751 (   consultar_detalle_membresia_por_id(uuid)    FUNCTION     B  CREATE FUNCTION public.consultar_detalle_membresia_por_id(p_id uuid) RETURNS TABLE(iddetalle uuid, fechapago date, montopagado money, idmembresia uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM DetalleMembresia WHERE IdDetalle = p_id;
END;
$$;
 D   DROP FUNCTION public.consultar_detalle_membresia_por_id(p_id uuid);
       public          postgres    false    6            l           1255    17750    consultar_detalle_membresias()    FUNCTION     0  CREATE FUNCTION public.consultar_detalle_membresias() RETURNS TABLE(iddetalle uuid, fechapago date, montopagado money, idmembresia uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM DetalleMembresia WHERE Activo = B'1';
END;
$$;
 5   DROP FUNCTION public.consultar_detalle_membresias();
       public          postgres    false    6            ?           1255    17715     consultar_documento_por_id(uuid)    FUNCTION     \  CREATE FUNCTION public.consultar_documento_por_id(p_id uuid) RETURNS TABLE(iddocumento uuid, numero bigint, fechaexpedicion date, lugar character varying, descrip_ character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Documento WHERE IdDocumento = p_id;
END;
$$;
 <   DROP FUNCTION public.consultar_documento_por_id(p_id uuid);
       public          postgres    false    6            b           1255    17714    consultar_documentos()    FUNCTION     H  CREATE FUNCTION public.consultar_documentos() RETURNS TABLE(iddocumento uuid, numero bigint, fechaexpedicion date, lugar character varying, descrip_ character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Documento WHERE Activo = B'1';
END;
$$;
 -   DROP FUNCTION public.consultar_documentos();
       public          postgres    false    6            %           1255    17739    consultar_empleado_por_id(uuid)    FUNCTION     k  CREATE FUNCTION public.consultar_empleado_por_id(p_id uuid) RETURNS TABLE(idempleado uuid, nombre character varying, apellido character varying, cargo character varying, salario numeric, idsede uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Empleado WHERE IdEmpleado = p_id;
END;
$$;
 ;   DROP FUNCTION public.consultar_empleado_por_id(p_id uuid);
       public          postgres    false    6            6           1255    17738    consultar_empleados()    FUNCTION     X  CREATE FUNCTION public.consultar_empleados() RETURNS TABLE(idempleado uuid, nombre character varying, apellido character varying, cargo character varying, salario numeric, idsede uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Empleado WHERE Activo = B'1';
END;
$$;
 ,   DROP FUNCTION public.consultar_empleados();
       public          postgres    false    6            W           1255    17721 #   consultar_estado_civil_por_id(uuid)    FUNCTION     \  CREATE FUNCTION public.consultar_estado_civil_por_id(p_id uuid) RETURNS TABLE(idestadocivil uuid, fechacambio date, tipoestadocivil character varying, descrip_ character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM EstadoCivil WHERE IdEstadoCivil = p_id;
END;
$$;
 ?   DROP FUNCTION public.consultar_estado_civil_por_id(p_id uuid);
       public          postgres    false    6            C           1255    17775 %   consultar_estado_factura_por_id(uuid)    FUNCTION     O  CREATE FUNCTION public.consultar_estado_factura_por_id(p_id uuid) RETURNS TABLE(idestadofactura uuid, descr_ character varying, fechacambio date, idfactura uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM EstadoFactura WHERE IdEstadoFactura = p_id;
END;
$$;
 A   DROP FUNCTION public.consultar_estado_factura_por_id(p_id uuid);
       public          postgres    false    6            S           1255    17774    consultar_estado_facturas()    FUNCTION     7  CREATE FUNCTION public.consultar_estado_facturas() RETURNS TABLE(idestadofactura uuid, descr_ character varying, fechacambio date, idfactura uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM EstadoFactura WHERE Activo = B'1';
END;
$$;
 2   DROP FUNCTION public.consultar_estado_facturas();
       public          postgres    false    6            B           1255    17720    consultar_estados_civiles()    FUNCTION     H  CREATE FUNCTION public.consultar_estados_civiles() RETURNS TABLE(idestadocivil uuid, fechacambio date, tipoestadocivil character varying, descrip_ character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM EstadoCivil WHERE Activo = B'1';
END;
$$;
 2   DROP FUNCTION public.consultar_estados_civiles();
       public          postgres    false    6            0           1255    17763    consultar_factura_por_id(uuid)    FUNCTION     ;  CREATE FUNCTION public.consultar_factura_por_id(p_id uuid) RETURNS TABLE(idfactura uuid, fecha date, montototal money, idcliente uuid, idmetodopago uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Factura WHERE IdFactura = p_id;
END;
$$;
 :   DROP FUNCTION public.consultar_factura_por_id(p_id uuid);
       public          postgres    false    6            &           1255    17762    consultar_facturas()    FUNCTION     )  CREATE FUNCTION public.consultar_facturas() RETURNS TABLE(idfactura uuid, fecha date, montototal money, idcliente uuid, idmetodopago uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Factura WHERE Activo = B'1';
END;
$$;
 +   DROP FUNCTION public.consultar_facturas();
       public          postgres    false    6                       1255    17727    consultar_genero_por_id(uuid)    FUNCTION       CREATE FUNCTION public.consultar_genero_por_id(p_id uuid) RETURNS TABLE(idgenero uuid, descr_ character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Genero WHERE IdGenero = p_id;
END;
$$;
 9   DROP FUNCTION public.consultar_genero_por_id(p_id uuid);
       public          postgres    false    6            /           1255    17726    consultar_generos()    FUNCTION     �   CREATE FUNCTION public.consultar_generos() RETURNS TABLE(idgenero uuid, descr_ character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Genero WHERE Activo = B'1';
END;
$$;
 *   DROP FUNCTION public.consultar_generos();
       public          postgres    false    6            =           1255    17703    consultar_gimnasio_por_id(uuid)    FUNCTION     `  CREATE FUNCTION public.consultar_gimnasio_por_id(p_id uuid) RETURNS TABLE(idgimnasio uuid, idciudad uuid, nombre character varying, tipo character varying, nit integer, fechaapertura date, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Gimnasio WHERE IdGimnasio = p_id;
END;
$$;
 ;   DROP FUNCTION public.consultar_gimnasio_por_id(p_id uuid);
       public          postgres    false    6            v           1255    17702    consultar_gimnasios()    FUNCTION     M  CREATE FUNCTION public.consultar_gimnasios() RETURNS TABLE(idgimnasio uuid, idciudad uuid, nombre character varying, tipo character varying, nit integer, fechaapertura date, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Gimnasio WHERE Activo = B'1';
END;
$$;
 ,   DROP FUNCTION public.consultar_gimnasios();
       public          postgres    false    6            J           1255    17781     consultar_membresia_por_id(uuid)    FUNCTION     M  CREATE FUNCTION public.consultar_membresia_por_id(p_id uuid) RETURNS TABLE(idmembresia uuid, fechainicio date, fechafin interval, idcliente uuid, idtipomembresia uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Membresia WHERE IdMembresia = p_id;
END;
$$;
 <   DROP FUNCTION public.consultar_membresia_por_id(p_id uuid);
       public          postgres    false    6            �            1255    17780    consultar_membresias()    FUNCTION     9  CREATE FUNCTION public.consultar_membresias() RETURNS TABLE(idmembresia uuid, fechainicio date, fechafin interval, idcliente uuid, idtipomembresia uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Membresia WHERE Activo = B'1';
END;
$$;
 -   DROP FUNCTION public.consultar_membresias();
       public          postgres    false    6                       1255    17757 "   consultar_metodo_pago_por_id(uuid)    FUNCTION     %  CREATE FUNCTION public.consultar_metodo_pago_por_id(p_id uuid) RETURNS TABLE(idmetodopago uuid, descr_ character varying, activo boolean, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM MetodoPago WHERE IdMetodoPago = p_id;
END;
$$;
 >   DROP FUNCTION public.consultar_metodo_pago_por_id(p_id uuid);
       public          postgres    false    6                       1255    17756    consultar_metodos_pago()    FUNCTION       CREATE FUNCTION public.consultar_metodos_pago() RETURNS TABLE(idmetodopago uuid, descr_ character varying, activo boolean, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM MetodoPago WHERE Activo = TRUE;
END;
$$;
 /   DROP FUNCTION public.consultar_metodos_pago();
       public          postgres    false    6            "           1255    17685    consultar_pais_por_id(uuid)    FUNCTION       CREATE FUNCTION public.consultar_pais_por_id(p_id uuid) RETURNS TABLE(idpais uuid, nombre character varying, activo boolean, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Pais WHERE IdPais = p_id;
END;
$$;
 7   DROP FUNCTION public.consultar_pais_por_id(p_id uuid);
       public          postgres    false    6            ;           1255    17684    consultar_paises()    FUNCTION     �   CREATE FUNCTION public.consultar_paises() RETURNS TABLE(idpais uuid, nombre character varying, activo boolean, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Pais WHERE Activo = TRUE;
END;
$$;
 )   DROP FUNCTION public.consultar_paises();
       public          postgres    false    6            p           1255    17709    consultar_sede_por_id(uuid)    FUNCTION     F  CREATE FUNCTION public.consultar_sede_por_id(p_id uuid) RETURNS TABLE(idsede uuid, idgimnasio uuid, nombre character varying, telefono integer, horario character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Sede WHERE IdSede = p_id;
END;
$$;
 7   DROP FUNCTION public.consultar_sede_por_id(p_id uuid);
       public          postgres    false    6            M           1255    17708    consultar_sedes()    FUNCTION     7  CREATE FUNCTION public.consultar_sedes() RETURNS TABLE(idsede uuid, idgimnasio uuid, nombre character varying, telefono integer, horario character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Sede WHERE Activo = B'1';
END;
$$;
 (   DROP FUNCTION public.consultar_sedes();
       public          postgres    false    6            �            1255    17745 %   consultar_tipo_membresia_por_id(uuid)    FUNCTION     P  CREATE FUNCTION public.consultar_tipo_membresia_por_id(p_id uuid) RETURNS TABLE(idtipomembresia uuid, descrip_ character varying, precio money, duracion interval, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM TipoMembresia WHERE IdTipoMembresia = p_id;
END;
$$;
 A   DROP FUNCTION public.consultar_tipo_membresia_por_id(p_id uuid);
       public          postgres    false    6                       1255    17744    consultar_tipos_membresia()    FUNCTION     8  CREATE FUNCTION public.consultar_tipos_membresia() RETURNS TABLE(idtipomembresia uuid, descrip_ character varying, precio money, duracion interval, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM TipoMembresia WHERE Activo = B'1';
END;
$$;
 2   DROP FUNCTION public.consultar_tipos_membresia();
       public          postgres    false    6            H           1255    17800    consultarempleado()    FUNCTION     B  CREATE FUNCTION public.consultarempleado() RETURNS TABLE(idempleado uuid, nombre character varying, apellido character varying, cargo character varying, salario numeric, idsede uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Empleado;
END;
$$;
 *   DROP FUNCTION public.consultarempleado();
       public          postgres    false    6            �            1255    17802    consultarempleadoid(uuid)    FUNCTION       CREATE FUNCTION public.consultarempleadoid(p_id uuid) RETURNS TABLE(idempleado uuid, nombre character varying, apellido character varying, cargo character varying, salario numeric, idsede uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY
    SELECT 
        g.IdEmpleado, 
        g.Nombre, 
        g.Apellido, 
        g.Cargo, 
        g.Salario, 
        g.IdSede,  
        g.Activo,
		g.Actualizar
    FROM Empleado AS g
    WHERE g.IdEmpleado = p_id;
END;
$$;
 5   DROP FUNCTION public.consultarempleadoid(p_id uuid);
       public          postgres    false    6            o           1255    17803 *   consultarempleadonombre(character varying)    FUNCTION     "  CREATE FUNCTION public.consultarempleadonombre(p_nombre character varying) RETURNS TABLE(idempleado uuid, nombre character varying, apellido character varying, cargo character varying, salario numeric, idsede uuid, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY
    SELECT 
        g.IdEmpleado, 
        g.Nombre, 
        g.Apellido, 
        g.Cargo, 
        g.Salario, 
        g.IdSede, 
        g.Activo,
		g.Actualizar
    FROM Empleado AS g
    WHERE g.Nombre = p_nombre;
END;
$$;
 J   DROP FUNCTION public.consultarempleadonombre(p_nombre character varying);
       public          postgres    false    6                       1255    17787    consultargimnasio()    FUNCTION     U  CREATE FUNCTION public.consultargimnasio() RETURNS TABLE(idgimnasio uuid, idciudad uuid, nombre character varying, tipo character varying, nit integer, fechaapertura date, activo bit, actualizar timestamp without time zone, idsede uuid, idempleado uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Gimnasio;
END;
$$;
 *   DROP FUNCTION public.consultargimnasio();
       public          postgres    false    6            ,           1255    17791    consultargimnasioid(uuid)    FUNCTION     I  CREATE FUNCTION public.consultargimnasioid(p_id uuid) RETURNS TABLE(idgimnasio uuid, idciudad uuid, nombre character varying, tipo character varying, nit integer, fechaapertura date, activo bit, actualizar timestamp without time zone, idsede uuid, idempleado uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
     RETURN QUERY
    SELECT 
        g.IdGimnasio, 
        g.IdCiudad, 
        g.Nombre, 
        g.Tipo, 
        g.NIT, 
        g.FechaApertura, 
        g.Activo, 
        g.Actualizar,
		g.IdSede,
		g.IdEmpleado
    FROM Gimnasio AS g
    WHERE g.IdGimnasio = p_id;
END;
$$;
 5   DROP FUNCTION public.consultargimnasioid(p_id uuid);
       public          postgres    false    6                       1255    17793 *   consultargimnasionombre(character varying)    FUNCTION     _  CREATE FUNCTION public.consultargimnasionombre(p_nombre character varying) RETURNS TABLE(idgimnasio uuid, idciudad uuid, nombre character varying, tipo character varying, nit integer, fechaapertura date, activo bit, actualizar timestamp without time zone, idsede uuid, idempleado uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        g.IdGimnasio,
        g.IdCiudad,
        g.Nombre,
        g.Tipo,
        g.NIT,
        g.FechaApertura,
        g.Activo,
        g.Actualizar,
        g.IdSede,
        g.IdEmpleado
    FROM Gimnasio g
    WHERE g.Nombre = p_nombre;
END;
$$;
 J   DROP FUNCTION public.consultargimnasionombre(p_nombre character varying);
       public          postgres    false    6            r           1255    17796    consultarsede()    FUNCTION        CREATE FUNCTION public.consultarsede() RETURNS TABLE(idsede uuid, idgimnasio uuid, nombre character varying, telefono bigint, horario character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT * FROM Sede;
END;
$$;
 &   DROP FUNCTION public.consultarsede();
       public          postgres    false    6            7           1255    17797    consultarsedeid(uuid)    FUNCTION     �  CREATE FUNCTION public.consultarsedeid(p_id uuid) RETURNS TABLE(idsede uuid, idgimnasio uuid, nombre character varying, telefono bigint, horario character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY
    SELECT 
        g.IdSede, 
        g.IdGimnasio, 
        g.Nombre, 
        g.Telefono, 
        g.Horario, 
        g.Activo,  
        g.Actualizar
    FROM Sede AS g
    WHERE g.IdSede = p_id;
END;
$$;
 1   DROP FUNCTION public.consultarsedeid(p_id uuid);
       public          postgres    false    6                       1255    17799 &   consultarsedenombre(character varying)    FUNCTION     �  CREATE FUNCTION public.consultarsedenombre(p_nombre character varying) RETURNS TABLE(idsede uuid, idgimnasio uuid, nombre character varying, telefono bigint, horario character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RETURN QUERY
    SELECT 
        g.IdSede, 
        g.IdGimnasio, 
        g.Nombre, 
        g.Telefono, 
        g.Horario, 
        g.Activo, 
        g.Actualizar
    FROM Sede AS g
    WHERE g.Nombre = p_nombre;
END;
$$;
 F   DROP FUNCTION public.consultarsedenombre(p_nombre character varying);
       public          postgres    false    6            d           1255    17700    eliminar_fisico_ciudad(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_ciudad(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Ciudad WHERE IdCiudad = p_id;
END;
$$;
 8   DROP FUNCTION public.eliminar_fisico_ciudad(p_id uuid);
       public          postgres    false    6                       1255    17736    eliminar_fisico_cliente(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_cliente(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Cliente WHERE IdCliente = p_id;
END;
$$;
 9   DROP FUNCTION public.eliminar_fisico_cliente(p_id uuid);
       public          postgres    false    6            j           1255    17694 "   eliminar_fisico_departamento(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_departamento(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Departamento WHERE IdDepartamento = p_id;
END;
$$;
 >   DROP FUNCTION public.eliminar_fisico_departamento(p_id uuid);
       public          postgres    false    6            [           1255    17772 %   eliminar_fisico_detalle_factura(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_detalle_factura(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM DetalleFactura WHERE IdDetalleFactura = p_id;
END;
$$;
 A   DROP FUNCTION public.eliminar_fisico_detalle_factura(p_id uuid);
       public          postgres    false    6                       1255    17754 '   eliminar_fisico_detalle_membresia(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_detalle_membresia(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM DetalleMembresia WHERE IdDetalle = p_id;
END;
$$;
 C   DROP FUNCTION public.eliminar_fisico_detalle_membresia(p_id uuid);
       public          postgres    false    6                       1255    17718    eliminar_fisico_documento(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_documento(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Documento WHERE IdDocumento = p_id;
END;
$$;
 ;   DROP FUNCTION public.eliminar_fisico_documento(p_id uuid);
       public          postgres    false    6            �            1255    17742    eliminar_fisico_empleado(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_empleado(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Empleado WHERE IdEmpleado = p_id;
END;
$$;
 :   DROP FUNCTION public.eliminar_fisico_empleado(p_id uuid);
       public          postgres    false    6            5           1255    17724 "   eliminar_fisico_estado_civil(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_estado_civil(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM EstadoCivil WHERE IdEstadoCivil = p_id;
END;
$$;
 >   DROP FUNCTION public.eliminar_fisico_estado_civil(p_id uuid);
       public          postgres    false    6                       1255    17778 $   eliminar_fisico_estado_factura(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_estado_factura(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM EstadoFactura WHERE IdEstadoFactura = p_id;
END;
$$;
 @   DROP FUNCTION public.eliminar_fisico_estado_factura(p_id uuid);
       public          postgres    false    6                       1255    17766    eliminar_fisico_factura(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_factura(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Factura WHERE IdFactura = p_id;
END;
$$;
 9   DROP FUNCTION public.eliminar_fisico_factura(p_id uuid);
       public          postgres    false    6            '           1255    17730    eliminar_fisico_genero(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_genero(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Genero WHERE IdGenero = p_id;
END;
$$;
 8   DROP FUNCTION public.eliminar_fisico_genero(p_id uuid);
       public          postgres    false    6                       1255    17706    eliminar_fisico_gimnasio(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_gimnasio(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Gimnasio WHERE IdGimnasio = p_id;
END;
$$;
 :   DROP FUNCTION public.eliminar_fisico_gimnasio(p_id uuid);
       public          postgres    false    6                       1255    17784    eliminar_fisico_membresia(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_membresia(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Membresia WHERE IdMembresia = p_id;
END;
$$;
 ;   DROP FUNCTION public.eliminar_fisico_membresia(p_id uuid);
       public          postgres    false    6            g           1255    17760 !   eliminar_fisico_metodo_pago(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_metodo_pago(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM MetodoPago WHERE IdMetodoPago = p_id;
END;
$$;
 =   DROP FUNCTION public.eliminar_fisico_metodo_pago(p_id uuid);
       public          postgres    false    6                       1255    17688    eliminar_fisico_pais(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_pais(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Pais WHERE IdPais = p_id;
END;
$$;
 6   DROP FUNCTION public.eliminar_fisico_pais(p_id uuid);
       public          postgres    false    6            L           1255    17712    eliminar_fisico_sede(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_sede(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Sede WHERE IdSede = p_id;
END;
$$;
 6   DROP FUNCTION public.eliminar_fisico_sede(p_id uuid);
       public          postgres    false    6            k           1255    17748 $   eliminar_fisico_tipo_membresia(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_fisico_tipo_membresia(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM TipoMembresia WHERE IdTipoMembresia = p_id;
END;
$$;
 @   DROP FUNCTION public.eliminar_fisico_tipo_membresia(p_id uuid);
       public          postgres    false    6            (           1255    17701    eliminar_logico_ciudad(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_ciudad(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Ciudad
    SET Activo = FALSE
    WHERE IdCiudad = p_id;
END;
$$;
 8   DROP FUNCTION public.eliminar_logico_ciudad(p_id uuid);
       public          postgres    false    6            a           1255    17737    eliminar_logico_cliente(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_cliente(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Cliente
    SET Activo = B'0'
    WHERE IdCliente = p_id;
END;
$$;
 9   DROP FUNCTION public.eliminar_logico_cliente(p_id uuid);
       public          postgres    false    6            u           1255    17695 "   eliminar_logico_departamento(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_departamento(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Departamento
    SET Activo = FALSE
    WHERE IdDepartamento = p_id;
END;
$$;
 >   DROP FUNCTION public.eliminar_logico_departamento(p_id uuid);
       public          postgres    false    6                       1255    17773 %   eliminar_logico_detalle_factura(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_detalle_factura(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE DetalleFactura
    SET Activo = B'0'
    WHERE IdDetalleFactura = p_id;
END;
$$;
 A   DROP FUNCTION public.eliminar_logico_detalle_factura(p_id uuid);
       public          postgres    false    6            O           1255    17755 '   eliminar_logico_detalle_membresia(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_detalle_membresia(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE DetalleMembresia
    SET Activo = B'0'
    WHERE IdDetalle = p_id;
END;
$$;
 C   DROP FUNCTION public.eliminar_logico_detalle_membresia(p_id uuid);
       public          postgres    false    6            m           1255    17719    eliminar_logico_documento(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_documento(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Documento
    SET Activo = B'0'
    WHERE IdDocumento = p_id;
END;
$$;
 ;   DROP FUNCTION public.eliminar_logico_documento(p_id uuid);
       public          postgres    false    6            >           1255    17743    eliminar_logico_empleado(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_empleado(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Empleado
    SET Activo = B'0'
    WHERE IdEmpleado = p_id;
END;
$$;
 :   DROP FUNCTION public.eliminar_logico_empleado(p_id uuid);
       public          postgres    false    6            2           1255    17725 "   eliminar_logico_estado_civil(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_estado_civil(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE EstadoCivil
    SET Activo = B'0'
    WHERE IdEstadoCivil = p_id;
END;
$$;
 >   DROP FUNCTION public.eliminar_logico_estado_civil(p_id uuid);
       public          postgres    false    6            K           1255    17779 $   eliminar_logico_estado_factura(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_estado_factura(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE EstadoFactura
    SET Activo = B'0'
    WHERE IdEstadoFactura = p_id;
END;
$$;
 @   DROP FUNCTION public.eliminar_logico_estado_factura(p_id uuid);
       public          postgres    false    6            �            1255    17767    eliminar_logico_factura(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_factura(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Factura
    SET Activo = B'0'
    WHERE IdFactura = p_id;
END;
$$;
 9   DROP FUNCTION public.eliminar_logico_factura(p_id uuid);
       public          postgres    false    6            .           1255    17731    eliminar_logico_genero(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_genero(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Genero
    SET Activo = B'0'
    WHERE IdGenero = p_id;
END;
$$;
 8   DROP FUNCTION public.eliminar_logico_genero(p_id uuid);
       public          postgres    false    6            3           1255    17707    eliminar_logico_gimnasio(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_gimnasio(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Gimnasio
    SET Activo = B'0'
    WHERE IdGimnasio = p_id;
END;
$$;
 :   DROP FUNCTION public.eliminar_logico_gimnasio(p_id uuid);
       public          postgres    false    6            �            1255    17785    eliminar_logico_membresia(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_membresia(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Membresia
    SET Activo = B'0'
    WHERE IdMembresia = p_id;
END;
$$;
 ;   DROP FUNCTION public.eliminar_logico_membresia(p_id uuid);
       public          postgres    false    6            n           1255    17761 !   eliminar_logico_metodo_pago(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_metodo_pago(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE MetodoPago
    SET Activo = FALSE
    WHERE IdMetodoPago = p_id;
END;
$$;
 =   DROP FUNCTION public.eliminar_logico_metodo_pago(p_id uuid);
       public          postgres    false    6            *           1255    17689    eliminar_logico_pais(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_pais(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Pais
    SET Activo = FALSE
    WHERE IdPais = p_id;
END;
$$;
 6   DROP FUNCTION public.eliminar_logico_pais(p_id uuid);
       public          postgres    false    6            V           1255    17713    eliminar_logico_sede(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_sede(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Sede
    SET Activo = B'0'
    WHERE IdSede = p_id;
END;
$$;
 6   DROP FUNCTION public.eliminar_logico_sede(p_id uuid);
       public          postgres    false    6            Q           1255    17749 $   eliminar_logico_tipo_membresia(uuid)    FUNCTION     �   CREATE FUNCTION public.eliminar_logico_tipo_membresia(p_id uuid) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE TipoMembresia
    SET Activo = B'0'
    WHERE IdTipoMembresia = p_id;
END;
$$;
 @   DROP FUNCTION public.eliminar_logico_tipo_membresia(p_id uuid);
       public          postgres    false    6            	           1255    17205    eliminar_membresia(uuid) 	   PROCEDURE     �   CREATE PROCEDURE public.eliminar_membresia(IN p_idmembresia uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM Membresia
    WHERE IdMembresia = p_idmembresia;
END;
$$;
 A   DROP PROCEDURE public.eliminar_membresia(IN p_idmembresia uuid);
       public          postgres    false    6            t           1255    17786    functionconsultarpais()    FUNCTION     \  CREATE FUNCTION public.functionconsultarpais() RETURNS TABLE(idpais uuid, nombre character varying, activo bit, actualiza timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN QUERY
    SELECT "IdPais",
           "Nombre",
           "Activo",
           "Actualiza"
    FROM public."Pais"
    WHERE "Activo" = B'1';
END;
$$;
 .   DROP FUNCTION public.functionconsultarpais();
       public          postgres    false    6                       1255    17698 T   insertar_ciudad(uuid, uuid, character varying, boolean, timestamp without time zone)    FUNCTION     q  CREATE FUNCTION public.insertar_ciudad(p_id uuid, p_iddepartamento uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Ciudad (IdCiudad, IdDepartamento, Nombre, Activo, Actualizar)
    VALUES (p_id, p_iddepartamento, p_nombre, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_ciudad(p_id uuid, p_iddepartamento uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone);
       public          postgres    false    6                       1255    17206 H   insertar_cliente(character varying, character varying, uuid, uuid, uuid) 	   PROCEDURE     �  CREATE PROCEDURE public.insertar_cliente(IN p_nombre character varying, IN p_apellido character varying, IN p_iddocumento uuid, IN p_idestadocivil uuid, IN p_idgenero uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Cliente (IdCliente, Nombre, Apellido, IdDocumento, IdEstadoCivil, IdGenero, Activo, Actualizar)
    VALUES (uuid_generate_v4(), p_nombre, p_apellido, p_iddocumento, p_idestadocivil, p_idgenero, B'1', NOW());
END;
$$;
 �   DROP PROCEDURE public.insertar_cliente(IN p_nombre character varying, IN p_apellido character varying, IN p_iddocumento uuid, IN p_idestadocivil uuid, IN p_idgenero uuid);
       public          postgres    false    6            �            1255    17734 p   insertar_cliente(uuid, character varying, character varying, uuid, uuid, uuid, bit, timestamp without time zone)    FUNCTION        CREATE FUNCTION public.insertar_cliente(p_id uuid, p_nombre character varying, p_apellido character varying, p_id_documento uuid, p_id_estado_civil uuid, p_id_genero uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Cliente (IdCliente, Nombre, Apellido, IdDocumento, IdEstadoCivil, IdGenero, Activo, Actualizar)
    VALUES (p_id, p_nombre, p_apellido, p_id_documento, p_id_estado_civil, p_id_genero, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_cliente(p_id uuid, p_nombre character varying, p_apellido character varying, p_id_documento uuid, p_id_estado_civil uuid, p_id_genero uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            �            1255    17692 Z   insertar_departamento(uuid, uuid, character varying, boolean, timestamp without time zone)    FUNCTION     k  CREATE FUNCTION public.insertar_departamento(p_id uuid, p_idpais uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Departamento (IdDepartamento, IdPais, Nombre, Activo, Actualizar)
    VALUES (p_id, p_idpais, p_nombre, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_departamento(p_id uuid, p_idpais uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone);
       public          postgres    false    6            �            1255    17770 i   insertar_detalle_factura(uuid, integer, money, uuid, character varying, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_detalle_factura(p_id uuid, p_cantidad integer, p_precio_unitario money, p_id_factura uuid, p_descr_ character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO DetalleFactura (IdDetalleFactura, Cantidad, PrecioUnitario, IdFactura, Descr_, Activo, Actualizar)
    VALUES (p_id, p_cantidad, p_precio_unitario, p_id_factura, p_descr_, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_detalle_factura(p_id uuid, p_cantidad integer, p_precio_unitario money, p_id_factura uuid, p_descr_ character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            �            1255    17752 U   insertar_detalle_membresia(uuid, date, money, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_detalle_membresia(p_id uuid, p_fecha_pago date, p_monto_pagado money, p_id_membresia uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO DetalleMembresia (IdDetalle, FechaPago, MontoPagado, IdMembresia, Activo, Actualizar)
    VALUES (p_id, p_fecha_pago, p_monto_pagado, p_id_membresia, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_detalle_membresia(p_id uuid, p_fecha_pago date, p_monto_pagado money, p_id_membresia uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6                       1255    17716 n   insertar_documento(uuid, bigint, date, character varying, character varying, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_documento(p_id uuid, p_numero bigint, p_fecha date, p_lugar character varying, p_descrip_ character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Documento (IdDocumento, Numero, FechaExpedicion, Lugar, Descrip_, Activo, Actualizar)
    VALUES (p_id, p_numero, p_fecha, p_lugar, p_descrip_, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_documento(p_id uuid, p_numero bigint, p_fecha date, p_lugar character varying, p_descrip_ character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            �            1255    17740 �   insertar_empleado(uuid, character varying, character varying, character varying, numeric, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_empleado(p_id uuid, p_nombre character varying, p_apellido character varying, p_cargo character varying, p_salario numeric, p_id_sede uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Empleado (IdEmpleado, Nombre, Apellido, Cargo, Salario, IdSede, Activo, Actualizar)
    VALUES (p_id, p_nombre, p_apellido, p_cargo, p_salario, p_id_sede, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_empleado(p_id uuid, p_nombre character varying, p_apellido character varying, p_cargo character varying, p_salario numeric, p_id_sede uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            N           1255    17722 i   insertar_estado_civil(uuid, date, character varying, character varying, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_estado_civil(p_id uuid, p_fecha date, p_tipo character varying, p_descrip_ character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO EstadoCivil (IdEstadoCivil, FechaCambio, TipoEstadoCivil, Descrip_, Activo, Actualizar)
    VALUES (p_id, p_fecha, p_tipo, p_descrip_, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_estado_civil(p_id uuid, p_fecha date, p_tipo character varying, p_descrip_ character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            q           1255    17776 ^   insertar_estado_factura(uuid, character varying, date, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_estado_factura(p_id uuid, p_descr_ character varying, p_fecha_cambio date, p_id_factura uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO EstadoFactura (IdEstadoFactura, Descr_, FechaCambio, IdFactura, Activo, Actualizar)
    VALUES (p_id, p_descr_, p_fecha_cambio, p_id_factura, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_estado_factura(p_id uuid, p_descr_ character varying, p_fecha_cambio date, p_id_factura uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            `           1255    17764 Q   insertar_factura(uuid, date, money, uuid, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_factura(p_id uuid, p_fecha date, p_monto_total money, p_id_cliente uuid, p_id_metodo_pago uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Factura (IdFactura, Fecha, MontoTotal, IdCliente, IdMetodoPago, Activo, Actualizar)
    VALUES (p_id, p_fecha, p_monto_total, p_id_cliente, p_id_metodo_pago, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_factura(p_id uuid, p_fecha date, p_monto_total money, p_id_cliente uuid, p_id_metodo_pago uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            @           1255    17728 J   insertar_genero(uuid, character varying, bit, timestamp without time zone)    FUNCTION     4  CREATE FUNCTION public.insertar_genero(p_id uuid, p_descr_ character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Genero (IdGenero, Descr_, Activo, Actualizar)
    VALUES (p_id, p_descr_, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_genero(p_id uuid, p_descr_ character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6                       1255    17704 t   insertar_gimnasio(uuid, uuid, character varying, character varying, integer, date, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_gimnasio(p_id uuid, p_idciudad uuid, p_nombre character varying, p_tipo character varying, p_nit integer, p_fecha date, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Gimnasio (IdGimnasio, IdCiudad, Nombre, Tipo, NIT, FechaApertura, Activo, Actualizar)
    VALUES (p_id, p_idciudad, p_nombre, p_tipo, p_nit, p_fecha, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_gimnasio(p_id uuid, p_idciudad uuid, p_nombre character varying, p_tipo character varying, p_nit integer, p_fecha date, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            Z           1255    17203 .   insertar_membresia(date, interval, uuid, uuid) 	   PROCEDURE     �  CREATE PROCEDURE public.insertar_membresia(IN p_fecha_inicio date, IN p_fecha_fin interval, IN p_idcliente uuid, IN p_idtipomembresia uuid)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Membresia (IdMembresia, FechaInicio, FechaFin, IdCliente, IdTipoMembresia, Activo, Actualizar)
    VALUES (uuid_generate_v4(), p_fecha_inicio, p_fecha_fin, p_idcliente, p_idtipomembresia, B'1', NOW());
END;
$$;
 �   DROP PROCEDURE public.insertar_membresia(IN p_fecha_inicio date, IN p_fecha_fin interval, IN p_idcliente uuid, IN p_idtipomembresia uuid);
       public          postgres    false    6            A           1255    17782 V   insertar_membresia(uuid, date, interval, uuid, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_membresia(p_id uuid, p_fecha_inicio date, p_fecha_fin interval, p_id_cliente uuid, p_id_tipo_membresia uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Membresia (IdMembresia, FechaInicio, FechaFin, IdCliente, IdTipoMembresia, Activo, Actualizar)
    VALUES (p_id, p_fecha_inicio, p_fecha_fin, p_id_cliente, p_id_tipo_membresia, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_membresia(p_id uuid, p_fecha_inicio date, p_fecha_fin interval, p_id_cliente uuid, p_id_tipo_membresia uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            9           1255    17758 S   insertar_metodo_pago(uuid, character varying, boolean, timestamp without time zone)    FUNCTION     E  CREATE FUNCTION public.insertar_metodo_pago(p_id uuid, p_descr_ character varying, p_activo boolean, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO MetodoPago (IdMetodoPago, Descr_, Activo, Actualizar)
    VALUES (p_id, p_descr_, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_metodo_pago(p_id uuid, p_descr_ character varying, p_activo boolean, p_actualizar timestamp without time zone);
       public          postgres    false    6                       1255    17200 )   insertar_pais(character varying, boolean) 	   PROCEDURE     �   CREATE PROCEDURE public.insertar_pais(IN p_nombre character varying, IN p_activo boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Pais (IdPais, Nombre, Activo, Actualizar)
    VALUES (uuid_generate_v4(), p_nombre, p_activo, NOW());
END;
$$;
 Y   DROP PROCEDURE public.insertar_pais(IN p_nombre character varying, IN p_activo boolean);
       public          postgres    false    6            �            1255    17686 L   insertar_pais(uuid, character varying, boolean, timestamp without time zone)    FUNCTION     2  CREATE FUNCTION public.insertar_pais(p_id uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Pais (IdPais, Nombre, Activo, Actualizar)
    VALUES (p_id, p_nombre, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_pais(p_id uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone);
       public          postgres    false    6            s           1255    17710 j   insertar_sede(uuid, uuid, character varying, integer, character varying, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_sede(p_id uuid, p_idgimnasio uuid, p_nombre character varying, p_telefono integer, p_horario character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Sede (IdSede, IdGimnasio, Nombre, Telefono, Horario, Activo, Actualizar)
    VALUES (p_id, p_idgimnasio, p_nombre, p_telefono, p_horario, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_sede(p_id uuid, p_idgimnasio uuid, p_nombre character varying, p_telefono integer, p_horario character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            -           1255    17746 c   insertar_tipo_membresia(uuid, character varying, money, interval, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.insertar_tipo_membresia(p_id uuid, p_descrip_ character varying, p_precio money, p_duracion interval, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO TipoMembresia (IdTipoMembresia, Descrip_, Precio, Duracion, Activo, Actualizar)
    VALUES (p_id, p_descrip_, p_precio, p_duracion, p_activo, p_actualizar);
END;
$$;
 �   DROP FUNCTION public.insertar_tipo_membresia(p_id uuid, p_descrip_ character varying, p_precio money, p_duracion interval, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6                       1255    17699 U   modificar_ciudad(uuid, uuid, character varying, boolean, timestamp without time zone)    FUNCTION     u  CREATE FUNCTION public.modificar_ciudad(p_id uuid, p_iddepartamento uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Ciudad
    SET IdDepartamento = p_iddepartamento, Nombre = p_nombre, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdCiudad = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_ciudad(p_id uuid, p_iddepartamento uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone);
       public          postgres    false    6            f           1255    17735 q   modificar_cliente(uuid, character varying, character varying, uuid, uuid, uuid, bit, timestamp without time zone)    FUNCTION       CREATE FUNCTION public.modificar_cliente(p_id uuid, p_nombre character varying, p_apellido character varying, p_id_documento uuid, p_id_estado_civil uuid, p_id_genero uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Cliente
    SET Nombre = p_nombre, Apellido = p_apellido, IdDocumento = p_id_documento, IdEstadoCivil = p_id_estado_civil, IdGenero = p_id_genero, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdCliente = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_cliente(p_id uuid, p_nombre character varying, p_apellido character varying, p_id_documento uuid, p_id_estado_civil uuid, p_id_genero uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            X           1255    17693 [   modificar_departamento(uuid, uuid, character varying, boolean, timestamp without time zone)    FUNCTION     o  CREATE FUNCTION public.modificar_departamento(p_id uuid, p_idpais uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Departamento
    SET IdPais = p_idpais, Nombre = p_nombre, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdDepartamento = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_departamento(p_id uuid, p_idpais uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone);
       public          postgres    false    6                        1255    17771 j   modificar_detalle_factura(uuid, integer, money, uuid, character varying, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_detalle_factura(p_id uuid, p_cantidad integer, p_precio_unitario money, p_id_factura uuid, p_descr_ character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE DetalleFactura
    SET Cantidad = p_cantidad, PrecioUnitario = p_precio_unitario, IdFactura = p_id_factura, Descr_ = p_descr_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdDetalleFactura = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_detalle_factura(p_id uuid, p_cantidad integer, p_precio_unitario money, p_id_factura uuid, p_descr_ character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            �            1255    17753 V   modificar_detalle_membresia(uuid, date, money, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_detalle_membresia(p_id uuid, p_fecha_pago date, p_monto_pagado money, p_id_membresia uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE DetalleMembresia
    SET FechaPago = p_fecha_pago, MontoPagado = p_monto_pagado, IdMembresia = p_id_membresia, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdDetalle = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_detalle_membresia(p_id uuid, p_fecha_pago date, p_monto_pagado money, p_id_membresia uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            c           1255    17717 o   modificar_documento(uuid, bigint, date, character varying, character varying, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_documento(p_id uuid, p_numero bigint, p_fecha date, p_lugar character varying, p_descrip_ character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Documento
    SET Numero = p_numero, FechaExpedicion = p_fecha, Lugar = p_lugar, Descrip_ = p_descrip_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdDocumento = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_documento(p_id uuid, p_numero bigint, p_fecha date, p_lugar character varying, p_descrip_ character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            E           1255    17741 �   modificar_empleado(uuid, character varying, character varying, character varying, numeric, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_empleado(p_id uuid, p_nombre character varying, p_apellido character varying, p_cargo character varying, p_salario numeric, p_id_sede uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Empleado
    SET Nombre = p_nombre, Apellido = p_apellido, Cargo = p_cargo, Salario = p_salario, IdSede = p_id_sede, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdEmpleado = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_empleado(p_id uuid, p_nombre character varying, p_apellido character varying, p_cargo character varying, p_salario numeric, p_id_sede uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            #           1255    17723 j   modificar_estado_civil(uuid, date, character varying, character varying, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_estado_civil(p_id uuid, p_fecha date, p_tipo character varying, p_descrip_ character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE EstadoCivil
    SET FechaCambio = p_fecha, TipoEstadoCivil = p_tipo, Descrip_ = p_descrip_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdEstadoCivil = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_estado_civil(p_id uuid, p_fecha date, p_tipo character varying, p_descrip_ character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            F           1255    17777 _   modificar_estado_factura(uuid, character varying, date, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_estado_factura(p_id uuid, p_descr_ character varying, p_fecha_cambio date, p_id_factura uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE EstadoFactura
    SET Descr_ = p_descr_, FechaCambio = p_fecha_cambio, IdFactura = p_id_factura, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdEstadoFactura = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_estado_factura(p_id uuid, p_descr_ character varying, p_fecha_cambio date, p_id_factura uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            4           1255    17765 R   modificar_factura(uuid, date, money, uuid, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_factura(p_id uuid, p_fecha date, p_monto_total money, p_id_cliente uuid, p_id_metodo_pago uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Factura
    SET Fecha = p_fecha, MontoTotal = p_monto_total, IdCliente = p_id_cliente, IdMetodoPago = p_id_metodo_pago, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdFactura = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_factura(p_id uuid, p_fecha date, p_monto_total money, p_id_cliente uuid, p_id_metodo_pago uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            h           1255    17729 K   modificar_genero(uuid, character varying, bit, timestamp without time zone)    FUNCTION     7  CREATE FUNCTION public.modificar_genero(p_id uuid, p_descr_ character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Genero
    SET Descr_ = p_descr_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdGenero = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_genero(p_id uuid, p_descr_ character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            �            1255    17705 u   modificar_gimnasio(uuid, uuid, character varying, character varying, integer, date, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_gimnasio(p_id uuid, p_idciudad uuid, p_nombre character varying, p_tipo character varying, p_nit integer, p_fecha date, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Gimnasio
    SET IdCiudad = p_idciudad, Nombre = p_nombre, Tipo = p_tipo, NIT = p_nit, FechaApertura = p_fecha, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdGimnasio = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_gimnasio(p_id uuid, p_idciudad uuid, p_nombre character varying, p_tipo character varying, p_nit integer, p_fecha date, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            $           1255    17783 W   modificar_membresia(uuid, date, interval, uuid, uuid, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_membresia(p_id uuid, p_fecha_inicio date, p_fecha_fin interval, p_id_cliente uuid, p_id_tipo_membresia uuid, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Membresia
    SET FechaInicio = p_fecha_inicio, FechaFin = p_fecha_fin, IdCliente = p_id_cliente, IdTipoMembresia = p_id_tipo_membresia, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdMembresia = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_membresia(p_id uuid, p_fecha_inicio date, p_fecha_fin interval, p_id_cliente uuid, p_id_tipo_membresia uuid, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            i           1255    17759 T   modificar_metodo_pago(uuid, character varying, boolean, timestamp without time zone)    FUNCTION     H  CREATE FUNCTION public.modificar_metodo_pago(p_id uuid, p_descr_ character varying, p_activo boolean, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE MetodoPago
    SET Descr_ = p_descr_, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdMetodoPago = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_metodo_pago(p_id uuid, p_descr_ character varying, p_activo boolean, p_actualizar timestamp without time zone);
       public          postgres    false    6            �            1255    17687 M   modificar_pais(uuid, character varying, boolean, timestamp without time zone)    FUNCTION     5  CREATE FUNCTION public.modificar_pais(p_id uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Pais
    SET Nombre = p_nombre, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdPais = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_pais(p_id uuid, p_nombre character varying, p_activo boolean, p_actualizar timestamp without time zone);
       public          postgres    false    6            1           1255    17711 k   modificar_sede(uuid, uuid, character varying, integer, character varying, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_sede(p_id uuid, p_idgimnasio uuid, p_nombre character varying, p_telefono integer, p_horario character varying, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE Sede
    SET IdGimnasio = p_idgimnasio, Nombre = p_nombre, Telefono = p_telefono, Horario = p_horario, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdSede = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_sede(p_id uuid, p_idgimnasio uuid, p_nombre character varying, p_telefono integer, p_horario character varying, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            �            1255    17747 d   modificar_tipo_membresia(uuid, character varying, money, interval, bit, timestamp without time zone)    FUNCTION     �  CREATE FUNCTION public.modificar_tipo_membresia(p_id uuid, p_descrip_ character varying, p_precio money, p_duracion interval, p_activo bit, p_actualizar timestamp without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE TipoMembresia
    SET Descrip_ = p_descrip_, Precio = p_precio, Duracion = p_duracion, Activo = p_activo, Actualizar = p_actualizar
    WHERE IdTipoMembresia = p_id;
END;
$$;
 �   DROP FUNCTION public.modificar_tipo_membresia(p_id uuid, p_descrip_ character varying, p_precio money, p_duracion interval, p_activo bit, p_actualizar timestamp without time zone);
       public          postgres    false    6            <           1255    17208    obtener_clientes_activos()    FUNCTION     R  CREATE FUNCTION public.obtener_clientes_activos() RETURNS TABLE(idcliente uuid, nombre character varying, apellido character varying, activo bit, actualizar timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY SELECT IdCliente, Nombre, Apellido, Activo, Actualizar FROM Cliente WHERE Activo = B'1';
END;
$$;
 1   DROP FUNCTION public.obtener_clientes_activos();
       public          postgres    false    6            8           1255    17202    obtener_paises_activos()    FUNCTION     %  CREATE FUNCTION public.obtener_paises_activos() RETURNS TABLE(idpais uuid, nombre character varying, activo boolean, actualizar timestamp without time zone)
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
    descripcion character varying(255),
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
    descripcion character varying(255),
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
    descripcion character varying(255),
    activo bit(1),
    actualizar timestamp without time zone
);
    DROP TABLE public.genero;
       public         heap    postgres    false    6            �            1259    17035    gimnasio    TABLE     $  CREATE TABLE public.gimnasio (
    idgimnasio uuid NOT NULL,
    idciudad uuid,
    nombre character varying(255),
    tipo character varying(255),
    nit integer,
    fechaapertura date,
    activo bit(1),
    actualizar timestamp without time zone,
    idsede uuid,
    idempleado uuid
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
    descripcion character varying(255),
    precio money,
    duracion interval,
    activo bit(1),
    actualizar timestamp without time zone
);
 !   DROP TABLE public.tipomembresia;
       public         heap    postgres    false    6            �          0    17025    ciudad 
   TABLE DATA           V   COPY public.ciudad (idciudad, iddepartamento, nombre, activo, actualizar) FROM stdin;
    public          postgres    false    218   -y      �          0    17078    cliente 
   TABLE DATA           x   COPY public.cliente (idcliente, nombre, apellido, iddocumento, idestadocivil, idgenero, activo, actualizar) FROM stdin;
    public          postgres    false    224   �z      �          0    17015    departamento 
   TABLE DATA           Z   COPY public.departamento (iddepartamento, idpais, nombre, activo, actualizar) FROM stdin;
    public          postgres    false    217   �|      �          0    17162    detallefactura 
   TABLE DATA           {   COPY public.detallefactura (iddetallefactura, cantidad, preciounitario, idfactura, descr_, activo, actualizar) FROM stdin;
    public          postgres    false    231   �}      �          0    17132    detallemembresia 
   TABLE DATA           n   COPY public.detallemembresia (iddetalle, fechapago, montopagado, idmembresia, activo, actualizar) FROM stdin;
    public          postgres    false    228   M      �          0    17059 	   documento 
   TABLE DATA           q   COPY public.documento (iddocumento, numero, fechaexpedicion, lugar, descripcion, activo, actualizar) FROM stdin;
    public          postgres    false    221   ��      �          0    17100    empleado 
   TABLE DATA           l   COPY public.empleado (idempleado, nombre, apellido, cargo, salario, idsede, activo, actualizar) FROM stdin;
    public          postgres    false    225   Ɂ      �          0    17066    estadocivil 
   TABLE DATA           s   COPY public.estadocivil (idestadocivil, fechacambio, tipoestadocivil, descripcion, activo, actualizar) FROM stdin;
    public          postgres    false    222   ��      �          0    17172    estadofactura 
   TABLE DATA           l   COPY public.estadofactura (idestadofactura, descr_, fechacambio, idfactura, activo, actualizar) FROM stdin;
    public          postgres    false    232   ��      �          0    17147    factura 
   TABLE DATA           l   COPY public.factura (idfactura, fecha, montototal, idcliente, idmetodopago, activo, actualizar) FROM stdin;
    public          postgres    false    230   ΅      �          0    17073    genero 
   TABLE DATA           K   COPY public.genero (idgenero, descripcion, activo, actualizar) FROM stdin;
    public          postgres    false    223   |�      �          0    17035    gimnasio 
   TABLE DATA           �   COPY public.gimnasio (idgimnasio, idciudad, nombre, tipo, nit, fechaapertura, activo, actualizar, idsede, idempleado) FROM stdin;
    public          postgres    false    219   �      �          0    17117 	   membresia 
   TABLE DATA           w   COPY public.membresia (idmembresia, fechainicio, fechafin, idcliente, idtipomembresia, activo, actualizar) FROM stdin;
    public          postgres    false    227   X�      �          0    17142 
   metodopago 
   TABLE DATA           N   COPY public.metodopago (idmetodopago, descr_, activo, actualizar) FROM stdin;
    public          postgres    false    229   �      �          0    17010    pais 
   TABLE DATA           B   COPY public.pais (idpais, nombre, activo, actualizar) FROM stdin;
    public          postgres    false    216   ��      �          0    17047    sede 
   TABLE DATA           a   COPY public.sede (idsede, idgimnasio, nombre, telefono, horario, activo, actualizar) FROM stdin;
    public          postgres    false    220   �      �          0    17112    tipomembresia 
   TABLE DATA           k   COPY public.tipomembresia (idtipomembresia, descripcion, precio, duracion, activo, actualizar) FROM stdin;
    public          postgres    false    226   h�                 2606    17029    ciudad ciudad_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (idciudad);
 <   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_pkey;
       public            postgres    false    218            $           2606    17084    cliente cliente_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);
 >   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pkey;
       public            postgres    false    224                       2606    17019    departamento departamento_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (iddepartamento);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public            postgres    false    217            2           2606    17166 "   detallefactura detallefactura_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.detallefactura
    ADD CONSTRAINT detallefactura_pkey PRIMARY KEY (iddetallefactura);
 L   ALTER TABLE ONLY public.detallefactura DROP CONSTRAINT detallefactura_pkey;
       public            postgres    false    231            ,           2606    17136 &   detallemembresia detallemembresia_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.detallemembresia
    ADD CONSTRAINT detallemembresia_pkey PRIMARY KEY (iddetalle);
 P   ALTER TABLE ONLY public.detallemembresia DROP CONSTRAINT detallemembresia_pkey;
       public            postgres    false    228                       2606    17065    documento documento_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (iddocumento);
 B   ALTER TABLE ONLY public.documento DROP CONSTRAINT documento_pkey;
       public            postgres    false    221            &           2606    17106    empleado empleado_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (idempleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    225                        2606    17072    estadocivil estadocivil_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.estadocivil
    ADD CONSTRAINT estadocivil_pkey PRIMARY KEY (idestadocivil);
 F   ALTER TABLE ONLY public.estadocivil DROP CONSTRAINT estadocivil_pkey;
       public            postgres    false    222            4           2606    17176     estadofactura estadofactura_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadofactura
    ADD CONSTRAINT estadofactura_pkey PRIMARY KEY (idestadofactura);
 J   ALTER TABLE ONLY public.estadofactura DROP CONSTRAINT estadofactura_pkey;
       public            postgres    false    232            0           2606    17151    factura factura_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (idfactura);
 >   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_pkey;
       public            postgres    false    230            "           2606    17077    genero genero_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (idgenero);
 <   ALTER TABLE ONLY public.genero DROP CONSTRAINT genero_pkey;
       public            postgres    false    223                       2606    17041    gimnasio gimnasio_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.gimnasio
    ADD CONSTRAINT gimnasio_pkey PRIMARY KEY (idgimnasio);
 @   ALTER TABLE ONLY public.gimnasio DROP CONSTRAINT gimnasio_pkey;
       public            postgres    false    219            *           2606    17121    membresia membresia_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_pkey PRIMARY KEY (idmembresia);
 B   ALTER TABLE ONLY public.membresia DROP CONSTRAINT membresia_pkey;
       public            postgres    false    227            .           2606    17146    metodopago metodopago_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.metodopago
    ADD CONSTRAINT metodopago_pkey PRIMARY KEY (idmetodopago);
 D   ALTER TABLE ONLY public.metodopago DROP CONSTRAINT metodopago_pkey;
       public            postgres    false    229                       2606    17014    pais pais_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (idpais);
 8   ALTER TABLE ONLY public.pais DROP CONSTRAINT pais_pkey;
       public            postgres    false    216                       2606    17053    sede sede_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.sede
    ADD CONSTRAINT sede_pkey PRIMARY KEY (idsede);
 8   ALTER TABLE ONLY public.sede DROP CONSTRAINT sede_pkey;
       public            postgres    false    220            (           2606    17116     tipomembresia tipomembresia_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.tipomembresia
    ADD CONSTRAINT tipomembresia_pkey PRIMARY KEY (idtipomembresia);
 J   ALTER TABLE ONLY public.tipomembresia DROP CONSTRAINT tipomembresia_pkey;
       public            postgres    false    226            6           2606    17030 !   ciudad ciudad_iddepartamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_iddepartamento_fkey FOREIGN KEY (iddepartamento) REFERENCES public.departamento(iddepartamento);
 K   ALTER TABLE ONLY public.ciudad DROP CONSTRAINT ciudad_iddepartamento_fkey;
       public          postgres    false    217    4886    218            9           2606    17085     cliente cliente_iddocumento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_iddocumento_fkey FOREIGN KEY (iddocumento) REFERENCES public.documento(iddocumento);
 J   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_iddocumento_fkey;
       public          postgres    false    221    4894    224            :           2606    17090 "   cliente cliente_idestadocivil_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_idestadocivil_fkey FOREIGN KEY (idestadocivil) REFERENCES public.estadocivil(idestadocivil);
 L   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_idestadocivil_fkey;
       public          postgres    false    4896    222    224            ;           2606    17095    cliente cliente_idgenero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_idgenero_fkey FOREIGN KEY (idgenero) REFERENCES public.genero(idgenero);
 G   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_idgenero_fkey;
       public          postgres    false    223    224    4898            5           2606    17020 %   departamento departamento_idpais_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_idpais_fkey FOREIGN KEY (idpais) REFERENCES public.pais(idpais);
 O   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_idpais_fkey;
       public          postgres    false    4884    217    216            B           2606    17167 ,   detallefactura detallefactura_idfactura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallefactura
    ADD CONSTRAINT detallefactura_idfactura_fkey FOREIGN KEY (idfactura) REFERENCES public.factura(idfactura);
 V   ALTER TABLE ONLY public.detallefactura DROP CONSTRAINT detallefactura_idfactura_fkey;
       public          postgres    false    230    231    4912            ?           2606    17137 2   detallemembresia detallemembresia_idmembresia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallemembresia
    ADD CONSTRAINT detallemembresia_idmembresia_fkey FOREIGN KEY (idmembresia) REFERENCES public.membresia(idmembresia);
 \   ALTER TABLE ONLY public.detallemembresia DROP CONSTRAINT detallemembresia_idmembresia_fkey;
       public          postgres    false    227    228    4906            <           2606    17107    empleado empleado_idsede_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idsede_fkey FOREIGN KEY (idsede) REFERENCES public.sede(idsede);
 G   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idsede_fkey;
       public          postgres    false    225    220    4892            C           2606    17177 *   estadofactura estadofactura_idfactura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estadofactura
    ADD CONSTRAINT estadofactura_idfactura_fkey FOREIGN KEY (idfactura) REFERENCES public.factura(idfactura);
 T   ALTER TABLE ONLY public.estadofactura DROP CONSTRAINT estadofactura_idfactura_fkey;
       public          postgres    false    230    4912    232            @           2606    17152    factura factura_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 H   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_idcliente_fkey;
       public          postgres    false    224    230    4900            A           2606    17157 !   factura factura_idmetodopago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.factura
    ADD CONSTRAINT factura_idmetodopago_fkey FOREIGN KEY (idmetodopago) REFERENCES public.metodopago(idmetodopago);
 K   ALTER TABLE ONLY public.factura DROP CONSTRAINT factura_idmetodopago_fkey;
       public          postgres    false    229    4910    230            7           2606    17042    gimnasio gimnasio_idciudad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.gimnasio
    ADD CONSTRAINT gimnasio_idciudad_fkey FOREIGN KEY (idciudad) REFERENCES public.ciudad(idciudad);
 I   ALTER TABLE ONLY public.gimnasio DROP CONSTRAINT gimnasio_idciudad_fkey;
       public          postgres    false    4888    218    219            =           2606    17122 "   membresia membresia_idcliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES public.cliente(idcliente);
 L   ALTER TABLE ONLY public.membresia DROP CONSTRAINT membresia_idcliente_fkey;
       public          postgres    false    224    4900    227            >           2606    17127 (   membresia membresia_idtipomembresia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.membresia
    ADD CONSTRAINT membresia_idtipomembresia_fkey FOREIGN KEY (idtipomembresia) REFERENCES public.tipomembresia(idtipomembresia);
 R   ALTER TABLE ONLY public.membresia DROP CONSTRAINT membresia_idtipomembresia_fkey;
       public          postgres    false    226    4904    227            8           2606    17054    sede sede_idgimnasio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sede
    ADD CONSTRAINT sede_idgimnasio_fkey FOREIGN KEY (idgimnasio) REFERENCES public.gimnasio(idgimnasio);
 C   ALTER TABLE ONLY public.sede DROP CONSTRAINT sede_idgimnasio_fkey;
       public          postgres    false    220    4890    219            �   C  x���=N�AD�S����mn�HH�����V1���b.�� /իW�7�
�MA������]cj�U2g:�<�@�oH�
]'���^��\����[���U ��+>
=����*�i2S �b�%6�Е[��Ii*N�
��H%pW���`��-ʯ���v�g���mU���rw�C%K��� ��D�B.�ə�Mk���K��{ެ˱	�C/�LCp��^b���`�z�l�oDh=���+�����z~�����TaL�c��i�'t3��!�ԕ=��*������Q�VO�^^���7^��y8�N�����      �     x���1n0F��\�Ȏ����H��ŉ��Z�Cn�Љ#��� ��;����J�k_H���5a�\��:�������ݕO�?��]ä5F	��؉ S]c�*�+N�.���J��)l�c�z�ದRtp�I��f�F���'�B�b�	X_U�m��km�ooXk5�Tw�)�V������X��Yyg�}}�¨��.X��iy�5m_T�a�>�wit �u�V=H�ȱR:�9@k�Q�5r�@ڻu^����O�D�s�y�C�-㟑1O��������]~]�?�Ӄ�����56X0��]מs���0ۓ#��zP��4��,�� ~_��'M�A�O"k&'i��)���p��#��2�,�|yGz�PO	��T�>��'KW���m�/y>h�L� �{�Gí��DO�ݗ��~�>~}����:4��0�W�T'����c'�B����W~��Ay� ~�U�QKN�s�B4΢� �a��MɟO������?51�      �   7  x����m0F��^�EI՛�
��II���F~<QF�be��F�=��ٴQڂ�U����x3t��g�6�H�����V*T�
B��ܼ*��t�<_�ngM���*� �#��F��q� ��p�J��*�Z��h�§�e�/�[�������5�ĦPYlxZ1+�Q�ˠÚ�s8���>�h b"=����q<���ǿ��M�W�NPE��u��|/Ӓ�ʻM�s�GS�CA#�,�����?_��O��^�l��+���kcm�`v���I�V�9�&#��E�<E� ��g�,������p�s��      �   b  x��ҽ�SA�:y��xe{<?��v+(i����"���)x1�E�a鯏�{�'��:�8�� �LR�r]r�ûS�D|�x�	�1�bZ��"М'�m�ֳ_���;=���w��)�,�
�'�G�T�*�'
F�Cd�D�THe/_��� �A�E1O�,m�M�{^k�V��ȸ�|�������-�K��P�z�`-�-8�)�z�p�Ytv�u#l�y32܋X����uo����R�2�#�M5c)�ƹ�����Q�m�:&hP����[Wh��m���}>���N3�e�A�f�Ήtz�L��=��^��.�בT��a�W2�Pvؼ,g�{�ǳ]��oƗ����7��      �   .  x���;nC1k�)R���賤!%��G�����v�p�K��V6��NU����PM�1�ҙ����o���*���D ���R9{��E; 0=�=Q*��w�ɘ&`��J 0�[.k��x�����D̴�`c�חp�s��P�8��;J.�瑎Rp��sousC�}������H����FXB�~�����ڒ�	%�O���Ͼ@l�	�T��׿�_zi=����u~���	���@���&����kl?�w:�-�~�Z�nloW�/;.�&�`4ߠ����T�&��������?ٔ�h      �   .  x���=NA�zr���#��;3N	H	PD����li�m�!*��b/ƬD�����3cU���SJ�C��Q9&�5�d�%r�[�Z���y����|9�����G�J���\��q���-M(��n�oȭ�s�v�0�w1A"? �SPM9$Q�Jj���L�Ț�i?������A�z`	�:l��͔��sECX�6�:��vԓ��ק�H@����"g����e�%.m�l͕�qA�Re������y����mE|(�@υ����E���X�ԬR��Y��z ����t�}3>�o#���j��ԇ�      �   �  x�}ұj1�Z��sH��Vr�"����4�f�,�v��^so��U�^,���N�B���/���OP3F NT�j�v(6��󸚧뿓\̗i[d*</�Y�y*{kM,Vy�
i�
�}��*�`lN�7ΠE���݃����]p�Q&���"j�e�5UD8T�,[1��x1Gi���y׾�>)꬏-T@%*���� �N
A�ާ���T�[+@2
�Ĉ�V4/��l��t}_z>O���Đ��OC�4+�L��S:�H�e����R����SXr��$�`k��|���^�ϲ���<���Q.=������T��|)�IU�z�0����}HvT)���� N�M�#�Ҝs�q���w5?�e��|��m9��7�e�k~-?M�䜥��(8�����R2���߇�n�wb�      �     x����iAE��Qt$U������O��6hh�a���s58�����Ǔ���:ﲀ+L��F(�]U�o��qF󱭷v�����u���X�Y�����}�  όG��>�0s> ��-8�1{^�6��Pםg@���!x�S�f�6@���ʠ#P�b����#�E�<�KY^r���[ �wp��:�GJ�*�jv���b���+
6ڔh$����h��$W{�x�퀁��</�?�y]�=o�>L�����9      �   )  x���;nD1���*�"���YE����2���L3��Yp.p�Slu�'�KƄ��ē0l\��m�s�z�lH� �*�n`}!�����:�j�ި}�~p{��d�c�{L)n�"��&�dJ������n^p�Ye�	�~*��(�Y_ü�h�rV���hW��0f؏=���W�q��T����V:Ofn�r���|�Ƅ��c���a��E��?���/s�>4`�]����,�I�s���g�=7G����u^�栤c�fǴ?��k���O-jԍuz�F���vZ��z<��u�,      �   �  x���=�\1��7������OH�Y� !��fk�N9W)���l8b���8��pa�a�bd�zׯ��OD��x15a�h���t���p�>��N��	r�Y_�y��H����L�h�M�]��?�Rb�[��	1KU��5�:�~�F$}1�`b�1�nW��C6�V�x�)�	5A)�e�𔶖�F�=��������*��Q�j�J¹�~�f��b��G]E������	w�8{��!��Zn0t!䢵�[�v�3ƌ%m,�r�v����u�5�'j���ŘՌ6*�.�䁙��T�ǂcйlx���ȨE����s��Տ�g,�l� ϓ���q�$ ִ){�������1��pA��Cd	�L�}��hҋ���b�/0���Q~�Q��a��$��9�y>��<��      �   X  x���M�!@דS���� ��� �`l���D���/�˦��BH���dS����I��CWc��zu�����k���?�[�2fT�|�x'��ji�.���@�сf#0Y��\�Q��S���G$�T��ŀ�-)�4�LM�i����j���VZ�3�^H��J��c������{�\G^�C�̕I4�n˦��.�۷#�G\ϫ�؏�����`��ʕ'X�4������|�'�5���"u���\���89�h�F�<y-Y�M�WT��BM`$:{��*f�#~��v��Q�b��J$h<�BI�1�?�bTQQB�x3�ڲ�\s�C���������b_�      �   d  x�}S�j�9<�����%K��c��=��ٖJI�oÒ������%���miF3����}����g=0�'�&c�-�ew����(pm[�ݻ�QA/<������|�����SAj,��,T�BE@)x�J��~a���6b.j5N��SBim�Nj0;��h��gM kRB9Cap��#F���m�ڤ�$570���[�ף��*1�8�Ƒ�Q�%�0�x��`\��uy���rg����%�袂�#�y֦[Pp�7�`{70:��D"jȓ6�V�d8����P��[>��>���g�����"���p*d��rVy߁ɢ�:�����?~���������,L@󒖾񓷻���ä��X�	��Ieѐap������rU"��hS��9��A����zV2n%�r��I�KӄkC��Փ��Y�>���ۻ���."���w�:�}̊ꚧ����6#"�6�{�a������BO�;���H깭滷�`f9�jk��n�9+u�Z��pC�}f��$�Tx`;f�R������1����y�8[�朾�0!6�d���p�$�U��4Չ����PBE��o��n�Z �      �   �  x���And1D׿O��1��Yf6쒑fV������G��rQ�*'I,
��p���J0��D�$��a�T碷��_W#ᦞ@S;��Tˁ	�0n��/��{m��8���`�*������ �[���N�G[|#j�RC����1n��)q?���w���֬�0�n�cu��ʁԣvj���3E̺A�&�9˅V'_�O:��9s%Eq��*q��{Un���;�>�j<c�Ŵ����me���ن^�O���]�=`�j!g���ɎuXW�~�f��q��tL$<?��(�;��u�6�*o�|��u�Tk6)+�Þ5���1��60^Sy�m���H(��o����c'ĐN�e���<�}WtgЪ%���+Oo9��(�K,�"j�κ�+����g�n�G}���v��!%��      �   �   x���;n�0��Y>�/��zQR�>��P$���5
�H9G.�L��?�\|5�iH�����U��N�}�γ���]/��nwCl�a��t��@�jjS�أ
	!y���1��EZ�>��/�K(V,�$E�$��&AP�b�Q�<��0ٗ��ƥ�1b�D�ns���@)�Ȼ������VYx~�Ux[�>�)�i �r��B�[zΨܰ{L���|z?L���i      �   �   x����m1�᳷
����{C4@��c;A�EBT�k�^s!<z�EG��Е����;D��.5����q{�۵�W�H�@�ꪶQ�E�d��4��;��N ��\��`	����^����ƠHO���h�fl�Z��m�w�:vQ���v���i����s��x�|�w�����=${�b�@�%����.u��?���q�R<"�"�|�e��Z,      �   n  x��һN0�9�)x#_����C��]��Q�����t�"���ߩ�{5��P�y^�n��:i��9����r\�5��XkZP��+o�_�c�kDbQ��`�C<��*����7�wjwd�L��/�P��u��:Ĝ���lo,�Ś�OP��Ӡ᪎��}P����S�>�VM����c���o�Ӟ�o�$8{����49�fѳ����^����2��M�OL>��I��E��0_��+����ހ��ڜ�˦p�X����W����pC��B�����5����Z��e���x���F}�C��g۫��d*DD�P�ꌳx�f^?,��������b{?�$���r��^�U      �   �   x���;K�A��z�+RX:avn��N����f������*؜�9��(��f�H���@M͚�:��8?�-ܭ7�x��z�~1� @ZSܢn)n��y��T��.�PgV�X$֒$�^��~?�>����}@��j�AG� �:x��2�4���y���.����޹N������98�l9Q��p�Ms��4|�m��cL�6�ǫ@��`���RM�w������~�M�nV��'Bn`     