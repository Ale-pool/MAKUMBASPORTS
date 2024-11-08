import React from 'react';
import './App.css';
import ConsultaEntidad from './ConsultaEntidad';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Consulta de Empleado, Gimnasio y Sede</h1>
        
        <h2>Consulta de Empleados</h2>
        <ConsultaEntidad entidad="empleado" />

        <h2>Consulta de Gimnasios</h2>
        <ConsultaEntidad entidad="gimnasio" />

        <h2>Consulta de Sedes</h2>
        <ConsultaEntidad entidad="sede" />
      </header>
    </div>
  );
}

export default App;

