
// coregimnasio.js

const {ModelSede, modelsede} = require('../../../domain/entitie/sede/modelsede');
const {InfrastructureSede} = require('../../../infrastructure/entitie/sede/infrastructuresede');

class CoreSede {
	
	constructor(){	
	}

	async consultarsede(){
		const infrastructuresede= new InfrastructureSede();	
		try {
            return await infrastructuresede.consultarsede();			
		} catch (err) {
			console.error(err.message);
		}
	}
	
	async consultarsedeid(id){
		const infrastructuresede= new InfrastructureSede();	
		try {
            return await infrastructuresede.consultarsedeid(id);			
		} catch (err) {
			console.error(err.message);
		}
	}		

	async consultarsedenombre(nombresede){
		const infrastructuresede= new InfrastructureSede();	
		try {
            return await infrastructuresede.consultarsedenombre(nombresede);			
		} catch (err) {
			console.error(err.message);
		}
	}		
	
	async ingresarsede(cuerpo){
		const infrastructuresede= new InfrastructureSede();	
		try {
            return await infrastructuresede.ingresarsede(cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async modificarsede(parametro, cuerpo){
		const infrastructuresede = new InfrastructureSede();	
		try {
            return await infrastructuresede.modificarsede(parametro, cuerpo);			
		} catch (err) {
			console.error(err.message);
		}
	}	

	async eliminarsede(parametro){
		const infrastructuresede = new InfrastructureSede();	
		try {
            return await infrastructuresede.eliminarsede(parametro);			
		} catch (err) {
			console.error(err.message);
		}
	}		
}

module.exports = { CoreSede };
