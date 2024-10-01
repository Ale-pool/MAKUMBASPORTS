const { MongoClient, ServerApiVersion } = require('mongodb');
const { ModelGeografia, modelgeografia } = require('../../../domain/object/geografia/modelgeografia'); 

const uri = "mongodb+srv://<username>:<password>@<your-cluster-url>/test?retryWrites=true&w=majority";
const dbName = 'mi_base_de_datos';
const collectionName = 'mi_coleccion';


class InfrastructureGeografia {
	
	constructor(){	
	}	

	async consultargeografia(respuesta) {
		const client = new MongoClient(uri);
		const db = client.db(dbName);
		const collection = db.collection(collectionName);
		
		let query = {};  // Usamos 'let' para poder reasignar si es necesario más adelante.
		query = { title: '123' };  // Aquí estamos reasignando 'query'.
		
		try {
			const documents = await collection.find(query).toArray();  // Cambié 'result' a 'documents' para evitar la redeclaración.
			const singleResult = await collection.findOne(query);  // Cambié 'result' a 'singleResult' para evitar la redeclaración.
			
			console.log('Documentos encontrados:', documents.length);
			console.log(singleResult);
		} catch (error) {
			console.error(error);
		} finally {
			await client.close();
		}
		
		return respuesta;
	}
	
}
