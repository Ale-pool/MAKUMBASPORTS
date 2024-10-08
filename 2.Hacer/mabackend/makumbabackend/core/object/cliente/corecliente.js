

// corecliente.js

const { ModelCliente, modelcliente } = require('../../../domain/object/cliente/modelCliente');
const { InfrastructureCliente } = require('../../../infrastructure/object/cliente/infrastructurecliente'); 

class CoreCliente {
	

	constructor(){}


	async consultarcliente() {
        const infrastructurecliente = new InfrastructureCliente();
        return await infrastructurecliente.consultarcliente();
    }

	async consultarclienteporid(id) {
        const infrastructurecliente = new InfrastructureCliente();
        return await infrastructurecliente.consultarclienteporid(id);
    }

    async agregarCliente(cliente) {
        const infrastructurecliente = new InfrastructureCliente();
        return await infrastructurecliente.agregarCliente(cliente);
    }

    async actualizarCliente(id, nuevosDatos) {
        const infrastructurecliente = new InfrastructureCliente();
        return await infrastructurecliente.actualizarCliente(id, nuevosDatos);
    }

    async eliminarCliente(id) {
        const infrastructurecliente = new InfrastructureCliente();
        return await infrastructurecliente.eliminarCliente(id);
    }


}

module.exports = { CoreCliente};

