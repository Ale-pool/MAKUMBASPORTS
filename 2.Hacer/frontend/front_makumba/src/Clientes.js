
// src/Clientes.js

import React, { useEffect, useState } from 'react';
import './Clientes.css'; // Importa el archivo CSS

const Clientes = () => {
  const [clientes, setClientes] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch('http://localhost:8067/operaciongetcliente')  // change the url
      .then((response) => response.json())
      .then((data) => {
        setClientes(data);
        setLoading(false);
      })
      .catch((error) => {
        console.error('Error al cargar datos:', error);
        setLoading(false);
      });
  }, []);

  if (loading) return <p>Cargando datos...</p>;

  return (
    <div className='clientes-container'>
      <h2>Clientes</h2>
      <table className='clientes-table'>
        <thead>
          <tr>
            <th>ID Cliente</th>
            <th>Nombre Cliente</th>
            <th>ID Documento</th>
            <th>Descripcion Documento</th>
            <th>ID Genero</th>
            <th>Descripcion Genero</th>
            <th>ID Estadocivil</th>
            <th>Descripcion Estadocivil</th>
          </tr>
        </thead>
        <tbody>
          {clientes.map((cliente) => (
            <tr key={cliente._id}>
              <td>{cliente.IdCliente}</td>
              <td>{cliente.Nombrecliente}</td>
              <td>{cliente.IdDocumento}</td>
              <td>{cliente.DescripcionDocumento}</td>
              <td>{cliente.IdGenero}</td>
              <td>{cliente.DescripcionGenero}</td>
              <td>{cliente.IdEstadocivil}</td>
              <td>{cliente.DescripcionEstadocivil}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Clientes;