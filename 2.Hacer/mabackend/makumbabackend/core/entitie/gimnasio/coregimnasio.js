
// coregimnasio.js
// falta realizar las funciones de ingrsar, modifcar y eliminar
const {ModelGimnasio, modelgimnasio} = require('../../../domain/entitie/gimnasio/modelgimnasio');
const {InfrastructureGimnasio} = require('../../../infrastructure/entitie/gimnasio/infrastructuregimnasio');

class CoreGimnasio {
	
	constructor(){	
	}

	async consultargimnasio(){
		const infrastructuregimnasio= new InfrastructureGimnasio();	
		try {
            return await infrastructuregimnasio.consultargimnasio();			
		} catch (err) {
			console.error(err.message);
		}
	}
	
	async consultargimnasioid(id){
		const infrastructuregimnasio= new InfrastructureGimnasio();	
		try {
            return await infrastructuregimnasio.consultargimnasioid(id);			
		} catch (err) {
			console.error(err.message);
		}
	}		

	async consultargimnasionombre(nombregimnasio){
		const infrastructuregimnasio= new InfrastructureGimnasio();	
		try {
            return await infrastructuregimnasio.consultargimnasionombre(nombregimnasio);			
		} catch (err) {
			console.error(err.message);
		}
	}		
	
	async ingresargimnasio(cuerpo){
		const infrastructuregimnasio= new InfrastructureGimnasio();	
		try {
            return await infrastructuregimnasio.ingresargimnasio(cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async modificargimnasio(parametro, cuerpo){
		const infrastructuregimnasio= new InfrastructureGimnasio();	
		try {
            return await infrastructuregimnasio.modificargimnasio(parametro, cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async eliminargimnasio(parametro){
		const infrastructuregimnasio= new InfrastructureGimnasio();	
		try {
            return await infrastructuregimnasio.eliminargimnasio(parametro);			
		} catch (err) {
			console.error(err.message);
		}
	}		
}

module.exports = { CoreGimnasio };
