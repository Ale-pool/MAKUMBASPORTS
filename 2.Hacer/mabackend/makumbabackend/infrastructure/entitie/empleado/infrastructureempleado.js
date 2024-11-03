

const { Pool } = require('pg');
const { ModelSede } = require('../../../domain/entitie/sede/modelsede'); 

const pool = new Pool({
  host: "localhost",
  user: "postgres",
  password: "121267",
  database: "Commercesports",
  port: "5432",  
});

class InfraestructureEmpleado {
	
	constructor(){	
	}	
	
	
    async consultarempleado() {
        let results = [];
        try {
          results = await pool.query('SELECT * FROM consultarempleado();');
          console.log('empleados encontrados:', results.rows.length);
          console.log(results.rows);
        } catch (err) {
          console.error(err);
          console.error(err.message);
        }
        return results.rows;
      }

      async consultarempleadoid(idSede) {
        let results = [];
        try {
            const response = await pool.query('SELECT * FROM consultarempleadoid($1)', [idSede]);
            results = response.rows; // Solo asigna las filas de datos
        } catch (err) {
            console.error(err.message);
        }
        return results; // Retorna solo los datos necesarios
    }

	  async consultarempleadonombre(nombreempleado) {
        let results = [];
        try {
            const response = await pool.query('SELECT * FROM consultarempleadonombre($1)', [nombreempleado]);
            console.log('Respuesta completa de la consulta:', response);
            results = response.rows; // Solo se asignan las filas al resultado
            console.log('Gimnasios encontrados:', results.length);
        } catch (err) {
            console.error(err.message);
        }
        return results; // Retornar solo las filas
    }
		
	
      async ingresarempleado(cuerpo) {
        const { id, idCiudad, nombre, tipo, nit, fechaApertura, activo } = cuerpo;
        let results = [];
        try {
          results = await pool.query(
            'SELECT ingresargimnasio($1, $2, $3, $4, $5, $6, $7)',
            [id, idCiudad, nombre, tipo, nit, fechaApertura, activo]
          );
          console.log('Gimnasio ingresado:', results.rowCount);
        } catch (err) {
          console.error(err);
          console.error(err.message);
        }
        return results.rowCount;
      }



      async modificarempleado(id, cuerpo) {
        const { idCiudad, nombre, tipo, nit, fechaApertura, activo } = cuerpo;
        let results = [];
        try {
          results = await pool.query(
            'SELECT modificargimnasio($1, $2, $3, $4, $5, $6, $7)',
            [id, idCiudad, nombre, tipo, nit, fechaApertura, activo]
          );
          console.log('Gimnasio modificado:', results.rowCount);
        } catch (err) {
          console.error(err);
          console.error(err.message);
        }
        return results.rowCount;
      }

      async eliminarempleado(id) {
        let results = [];
        try {
          results = await pool.query('SELECT eliminargimnasio($1)', [id]);
          console.log('Gimnasio eliminado:', results.rowCount);
        } catch (err) {
          console.error(err);
          console.error(err.message);
        }
        return results.rowCount;
      }
}

module.exports = { InfraestructureEmpleado };

