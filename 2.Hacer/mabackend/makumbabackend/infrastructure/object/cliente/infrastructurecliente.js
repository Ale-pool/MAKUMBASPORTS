// infrastructurecliente.js

const { MongoClient, ServerApiVersion } = require('mongodb');
const { ModelCliente, modelcliente } = require('../../../domain/object/cliente/modelCliente')

const uri = "mongodb+srv://dbausername:dbpassword@cluster0.qbo1y.mongodb.net/Makumbasports?retryWrites=true&w=majority";
const dbName = 'Makumbasports';
const collectionName = 'Cliente';


class InfrastructureCliente {
	
	constructor(){	
	}	
	// Get para todos los clientes
	async consultarcliente(respuesta) {
		const client = new MongoClient(uri);
		try{
			await client.connect();
			const db = client.db(dbName);
			const collection = db.collection(collectionName);
			const clientes = await collection.find({}).toArray(); // Obtener todos los registros
			return clientes;
		}catch(error){
			console.error(error);
		} finally {
			await client.close();
		}
	}

	// Get: Obtener un cliente por id en especifico
	async consultarclienteporid(id, respuesta) {
		const client = new MongoClient(uri);
		try{
			await client.connect();
			const db = client.db(dbName);
			const collection = db.collection(collectionName);
			const cliente = await collection.findOne({ _id: new ObjectId(id)}); // Obtener todos los registros
			return cliente;
		}catch(error){
			console.error(error);
		} finally {
			await client.close();
		}
	}
	
	// Post: Crear un cliente 

	async agregarCliente(cliente) {
        const client = new MongoClient(uri);
        try {
            await client.connect();
            const db = client.db(dbName);
            const collection = db.collection(collectionName);
            const result = await collection.insertOne(cliente);  // Insertar un nuevo documento
            return result;
        } catch (error) {
            console.error(error);
        } finally {
            await client.close();
        }
    }

	 // PUT: Actualizar un cliente por ID
	 async actualizarCliente(id, nuevosDatos) {
        const client = new MongoClient(uri);
        try {
            await client.connect();
            const db = client.db(dbName);
            const collection = db.collection(collectionName);
            const result = await collection.updateOne({ _id: new ObjectId(id) }, { $set: nuevosDatos });  // Actualizar documento
            return result;
        } catch (error) {
            console.error(error);
        } finally {
            await client.close();
        }
    }

	 // DELETE: Eliminar un cliente por ID

	 async eliminarCliente(id) {
        const client = new MongoClient(uri);
        try {
            await client.connect();
            const db = client.db(dbName);
            const collection = db.collection(collectionName);
            const result = await collection.deleteOne({ _id: new ObjectId(id) });  // Eliminar por ID
            return result;
        } catch (error) {
            console.error(error);
        } finally {
            await client.close();
        }
	 }

}

 
 
module.exports = { InfrastructureCliente };   
