
import React from 'react';
import logo from './logo.svg';
import './App.css';
import Clientes from './Clientes'
import Clienteid from './Clienteid'
import Clientenombre from './Clientenombre'

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <h1>Consulta de Clientes</h1>
        <Clientenombre />
      </header>
    </div>
  );
}

export default App;
