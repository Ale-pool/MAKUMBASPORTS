import React, { useState } from 'react';
import axios from 'axios';
import './ConsultaEntidad.css';

function ConsultaEntidad({ entidad }) {
    const [datos, setDatos] = useState([]);
    const [busquedaId, setBusquedaId] = useState('');
    const [busquedaNombre, setBusquedaNombre] = useState('');
    const [error, setError] = useState(null);

    const obtenerTodos = async () => {
        try {
            let url;
            switch (entidad) {
                case 'empleado':
                    url = 'http://localhost:8068/operaciongetempleado';
                    break;
                case 'sede':
                    url = 'http://localhost:8068/operaciongetsede';
                    break;
                case 'gimnasio':
                    url = 'http://localhost:8068/operaciongetgimnasio';
                    break;
                default:
                    setError('Entidad no válida');
                    return;
            }
            const respuesta = await axios.get(url);
            setDatos(respuesta.data);
            setError(null);
        } catch (e) {
            setError("Error al obtener los datos");
        }
    };

    const buscarPorId = async () => {
        if (!busquedaId) {
            setError("Por favor ingrese un ID para buscar");
            return;
        }
        try {
            const respuesta = await axios.get(`http://localhost:8068/operacionget${entidad}id/${busquedaId}`);
            setDatos(Array.isArray(respuesta.data) ? respuesta.data : [respuesta.data]);
            setError(null);
        } catch (e) {
            setError("No se encontró un registro con ese ID");
        }
    };

    const buscarPorNombre = async () => {
        if (!busquedaNombre) {
            setError("Por favor ingrese un nombre para buscar");
            return;
        }
        try {
            const respuesta = await axios.get(`http://localhost:8068/operacionget${entidad}nombre/${busquedaNombre}`);
            setDatos(respuesta.data);
            setError(null);
        } catch (e) {
            setError("No se encontraron registros con ese nombre");
        }
    };

    return (
        <div>
            <h2>Consulta de {entidad.charAt(0).toUpperCase() + entidad.slice(1)}</h2>
            <button onClick={obtenerTodos}>Consultar Todos</button>

            <div>
                <input
                    type="text"
                    placeholder="Buscar por ID"
                    value={busquedaId}
                    onChange={(e) => setBusquedaId(e.target.value)}
                />
                <button onClick={buscarPorId}>Buscar por ID</button>
            </div>

            <div>
                <input
                    type="text"
                    placeholder="Buscar por Nombre"
                    value={busquedaNombre}
                    onChange={(e) => setBusquedaNombre(e.target.value)}
                />
                <button onClick={buscarPorNombre}>Buscar por Nombre</button>
            </div>

            {error && <p style={{ color: 'red' }}>{error}</p>}
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Detalles</th>
                    </tr>
                </thead>
                <tbody>
                    {datos.map((item) => (
                        <tr key={item.idgimnasio || item.idempleado || item.idsede}>
                            <td>{item.idgimnasio || item.idempleado || item.idsede}</td>
                            <td>{item.nombre}</td>
                            <td>{JSON.stringify(item)}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}

export default ConsultaEntidad;
