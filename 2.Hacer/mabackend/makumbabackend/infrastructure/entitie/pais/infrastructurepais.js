
// infrastructurepais.js

const { Pool } = require('pg');
const { ModelPais } = require('../../../domain/entitie/pais/modelpais'); 

const pool = new Pool({
  host: "127.0.0.1",
  user: "postgres",
  password: "",
  database: "dbCucharaDePalo",
  port: "5432",  
});

class InfrastructurePais {
	
	constructor(){	
	}	
	
	async consultarpais(){
		let results = [];
		try {
			results = await pool.query('SELECT * FROM functionconsultarpais();');
            console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}	

	async consultarpaisid(id){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultarpaisid($1)', [id]);
			console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}

	async consultarpaisnombrepais(nombrepais){
		let results = [];		
		try {
			results = await pool.query('SELECT * FROM functionconsultarpaisnombre($1)', [nombrepais]);
			console.log('Paises encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		}
		return results;	
	}
		
	
	async ingresarpais(cuerpo){
		let results = [];
		return results;	
	}	
	
	async modificarpais(parametro, cuerpo){
		let results = []
		return results;	
	}

	async eliminarpais(parametro){	
		let results = [];	
		return results;			
	}	
}

module.exports = { InfrastructurePais };

