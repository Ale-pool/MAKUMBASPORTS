
// coregimnasio.js
// falta realizar las funciones de ingrsar, modifcar y eliminar
const {ModelEmpleado, modelempleado} = require('../../../domain/entitie/empleado/modelempleado');
const {InfraestructureEmpleado} = require('../../../infrastructure/entitie/empleado/infrastructureempleado');


class CoreEmpleado {
	
	constructor(){	
	}

	async consultarempleado(){
		const infrastructureempleado= new InfraestructureEmpleado();	
		try {
            return await infrastructureempleado.consultarempleado();			
		} catch (err) {
			console.error(err.message);
		}
	}
	
	async consultarempleadoid(id){
		const infrastructureempleado= new InfraestructureEmpleado();	
		try {
            return await infrastructureempleado.consultarempleadoid(id);			
		} catch (err) {
			console.error(err.message);
		}
	}		

	async consultarempleadonombre(nombreempleado){
		const infrastructureempleado= new InfraestructureEmpleado();	
		try {
            return await infrastructureempleado.consultarempleadonombre(nombreempleado);			
		} catch (err) {
			console.error(err.message);
		}
	}		
	
	async ingresarempleado(cuerpo){
		const infrastructureempleado= new InfraestructureEmpleado();	
		try {
            return await infrastructureempleado.ingresarempleado(cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async modificarempleado(parametro, cuerpo){
		const infrastructureempleado= new InfraestructureEmpleado();	
		try {
            return await infrastructureempleado.modificarempleado(parametro, cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async eliminarempleado(parametro){
		const infrastructureempleado = new InfraestructureEmpleado();	
		try {
            return await infrastructureempleado.eliminarempleado(parametro);			
		} catch (err) {
			console.error(err.message);
		}
	}		
}

module.exports = { CoreEmpleado };
