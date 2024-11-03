
// infrastructureciudad.js

const { Pool } = require('pg');
const { ModelCiudad } = require('../../../domain/entitie/ciudad/modelciudad'); 

const pool = new Pool({
  host: "127.0.0.1",
  user: "postgres",
  password: "",
  database: "dbCucharaDePalo",
  port: "5432",  
});

class InfrastructureCiudad{
	
	constructor(){	
	}	
	
	async consultarciudad(){
		let results = [];
		try {
			results = await pool.query('SELECT * FROM functionconsultarciudad();');
            console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}	

	async consultarciudadid(id){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultarciudadid($1)', [id]);
			console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}

	async consultarciudadnombreciudad(nombreciudad){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultarciudadnombre($1)', [nombreciudad]);
			console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}
		
	
	async ingresarciudad(cuerpo){
		let results = [];
		return results;	
	}	
	
	async modificarciudad(parametro, cuerpo){
		let results = []
		return results;	
	}

	async eliminarciudad(parametro){	
		let results = [];	
		return results;			
	}	
}

module.exports = { InfrastructureCiudad };

