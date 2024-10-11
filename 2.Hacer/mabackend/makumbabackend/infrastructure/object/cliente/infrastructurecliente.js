// infrastructurecliente.js

const { MongoClient, ServerApiVersion, ObjectId } = require('mongodb');
const { ModelCliente, modelcliente } = require('../../../domain/object/cliente/modelCliente')

const uri = "mongodb+srv://dbausername:dbpassword@cluster0.qbo1y.mongodb.net/Makumbasports?retryWrites=true&w=majority";
const dbName = 'Makumbasports';
const collectionName = 'Cliente';


class InfrastructureCliente {
	
	constructor(){	
	}	
	
	async consultarcliente(){
		const client = new MongoClient(uri);
        const db = client.db(dbName);
        const col = db.collection(collectionName);	
		let results = [];
		try {
            results = await col.find().toArray();
            console.log('Documentos encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		} finally {
			await client.close();
		}
		return results;	
	}

	// Get: Obtener un cliente por id en especifico
	async consultarclienteid(id){
		const client = new MongoClient(uri);
		const db = client.db(dbName);
		const col = db.collection(collectionName);
		let results = [];		
		try {
			results = await col.find({ "_id": new ObjectId(id) }).toArray();		
			console.log('Documentos encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		} finally {
			await client.close();
		}
		return results;	
	}

	async consultarclientenombrecliente(nombrecliente){
		const client = new MongoClient(uri);
		const db = client.db(dbName);
		const col = db.collection(collectionName);
		let results = [];		
		try {
			results = await col.find({ "Nombrecliente": nombrecliente }).toArray();		
			console.log('Documentos encontrados:', results.length);
			console.log(results);			
		} catch (err) {
			console.error(err);
			console.error(err.message);
		} finally {
			await client.close();
		}
		return results;	
	}



	//  // PUT: Actualizar un cliente por ID
	//  async actualizarCliente(id, nuevosDatos) {
    //     const client = new MongoClient(uri);
    //     try {
    //         await client.connect();
    //         const db = client.db(dbName);
    //         const collection = db.collection(collectionName);
    //         const result = await collection.updateOne({ _id: new ObjectId(id) }, { $set: nuevosDatos });  // Actualizar documento
    //         return result;
    //     } catch (error) {
    //         console.error(error);
    //     } finally {
    //         await client.close();
    //     }
    // }

	//  // DELETE: Eliminar un cliente por ID

	//  async eliminarCliente(id) {
    //     const client = new MongoClient(uri);
    //     try {
    //         await client.connect();
    //         const db = client.db(dbName);
    //         const collection = db.collection(collectionName);
    //         const result = await collection.deleteOne({ _id: new ObjectId(id) });  // Eliminar por ID
    //         return result;
    //     } catch (error) {
    //         console.error(error);
    //     } finally {
    //         await client.close();
    //     }
	//  }

}

 
 
module.exports = { InfrastructureCliente };   
