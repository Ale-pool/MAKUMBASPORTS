
// infrastructuredepartamento.js

const { Pool } = require('pg');
const { ModelDepartamento } = require('../../../domain/entitie/departamento/modeldepartamento'); 

const pool = new Pool({
  host: "127.0.0.1",
  user: "postgres",
  password: "",
  database: "dbCucharaDePalo",
  port: "5432",  
});

class InfrastructureDepartamento {
	
	constructor(){	
	}	
	
	async consultardepartamento(){
		let results = [];
		try {
			results = await pool.query('SELECT * FROM functionconsultardepartamento();');
            console.log('Departamentoes encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}	

	async consultardepartamentoid(id){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultardepartamentoid($1)', [id]);
			console.log('Departamentoes encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}

	async consultardepartamentonombredepartamento(nombredepartamento){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultardepartamentonombre($1)', [nombredepartamento]);
			console.log('Departamentoes encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}
		
	
	async ingresardepartamento(cuerpo){
		let results = [];
		return results;	
	}	
	
	async modificardepartamento(parametro, cuerpo){
		let results = []
		return results;	
	}

	async eliminardepartamento(parametro){	
		let results = [];	
		return results;			
	}	
}

module.exports = { InfrastructureDepartamento };

