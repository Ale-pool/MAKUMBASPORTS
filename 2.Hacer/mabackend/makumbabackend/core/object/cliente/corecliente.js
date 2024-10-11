

// corecliente.js

const { ModelCliente, modelcliente } = require('../../../domain/object/cliente/modelCliente');
const { InfrastructureCliente } = require('../../../infrastructure/object/cliente/infrastructurecliente'); 

class CoreCliente {
	

	constructor(){}

    
	async consultarcliente(){
		const infrastructurecliente = new InfrastructureCliente();	
		try {
            return await infrastructurecliente.consultarcliente();			
		} catch (err) {
			console.error(err.message);
		}
	}


    async consultarclienteid(id){
		const infrastructurecliente = new InfrastructureCliente();	
		try {
            return await infrastructurecliente.consultarclienteid(id);			
		} catch (err) {
			console.error(err.message);
		}
	}

    async consultarclientenombrecliente(nombrecliente){
		const infrastructurecliente = new InfrastructureCliente();	
		try {
            return await infrastructurecliente.consultarclientenombrecliente(nombrecliente);			
		} catch (err) {
			console.error(err.message);
		}
	}


}

module.exports = { CoreCliente};

