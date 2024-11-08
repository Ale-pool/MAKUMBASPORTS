
import React, { useEffect, useState } from 'react';

function Empleados() {
  const [data, setData] = useState([]);

  // URL del JSON, reemplaza con la dirección adecuada si está en un servidor.
  const jsonUrl = 'http://localhost:8068/operaciongetempleado';

  useEffect(() => {
    // Simulación de fetch con datos estáticos.
    const fetchData = async () => {
      const response = await fetch(jsonUrl);
      const jsonData = await response.json();
      setData(jsonData.rows);
    };

    fetchData();
  }, []);

  return (
    <div>
      <h1>Listado de Empleados</h1>
      <table border="1">
        <thead>
          <tr>
            <th>ID EMPLEADO</th>
            <th>Nombre</th>
            <th>APELLIDO</th>
            <th>CARGO</th>
            <th>Salario</th>
            <th>IDSEDE</th>
            <th>ACTIVO</th>
            <th>ACTUALIZAR</th>
          </tr>
        </thead>
        <tbody>
          {data.map((row) => (
            <tr key={row.idempleado}>
              <td>{row.idempleado}</td>
              <td>{row.nombre}</td>
              <td>{row.apellido}</td>
              <td>{row.cargo}</td>
              <td>{row.salario}</td>
              <td>{row.idsede}</td>
              <td>{row.activo}</td>
              <td>{row.actualizar}</td>
              <td>{new Date(row.actualiza).toLocaleString()}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Empleados;