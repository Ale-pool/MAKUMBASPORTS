
// coregeografia.js

const { ModelGeografia, modelgeografia } = require('../../../domain/object/geografia/modelgeografia'); 
const { InfrastructureGeografia } = require('../../../infrastructure/object/geografia/infrastructuregeografia'); 

class CoreGeografia {
	
	constructor(){	
	}

	async consultargeografia(respuesta){
		const infrastructuregeografia = new InfrastructureGeografia();	
		try {
            return infrastructuregeografia.consultargeografia(respuesta);			
		} catch (e) {
			console.error(e);
		}
	}	
}

module.exports = { CoreGeografia };