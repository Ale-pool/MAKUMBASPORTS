
// infrastructuregeografia.js

const { MongoClient, ServerApiVersion } = require('mongodb');
const { ModelGeografia, modelgeografia } = require('../../../domain/object/geografia/modelgeografia'); 

const uri = "mongodb+srv://<username>:<password>@<your-cluster-url>/test?retryWrites=true&w=majority";
const dbName = 'mi_base_de_datos';
const collectionName = 'mi_coleccion';

class InfrastructureGeografia {
	
	constructor(){	
	}	
	
	async consultargeografia(respuesta){
		const client = new MongoClient(uri);
        const db = client.db(dbName);
        const collection = db.collection(collectionName);		
		let query = {};
		query = { title: '123' };
		try {
            const result1 = await collection.find(query).toArray();
			const result2 = await collection.findOne(query);
            console.log('Documentos encontrados:', result1.length);
			console.log(result2);			
		} catch (error) {
			console.error(error);
		} finally {
			await client.close();
		}
		return respuesta;	
	}
}

module.exports = { InfrastructureGeografia };

