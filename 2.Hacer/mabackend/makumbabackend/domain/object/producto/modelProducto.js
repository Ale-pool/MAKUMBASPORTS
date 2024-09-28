const modelproducto = [];

class ModelProducto{
	constructor(idmembresia, 
        fechainiciomembresia,
        idtipomembresia,
        descripciontipomembresia,
        iddetalle,
        fechapagomembresia){
		this.idmembresia = idmembresia;
		this.fechainiciomembresia = fechainiciomembresia;
		this.idtipomembresia = idtipomembresia;
		this.descripciontipomembresia = descripciontipomembresia;
		this.iddetalle = iddetalle;
		this.fechapagomembresia = fechapagomembresia;
	}
}

module.exports = {ModelProducto, modelproducto};