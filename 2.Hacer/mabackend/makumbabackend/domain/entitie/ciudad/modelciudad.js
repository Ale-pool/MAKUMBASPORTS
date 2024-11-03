
// domain/entitie/ciudad/modelciudad.js

class ModelCiudad{
	constructor(
				idciudad, 
				iddepartamento, 
				nombre, 
				activo,
				actualiza){
		this.idciudad = idciudad;					
		this.iddepartamento = iddepartamento;
		this.nombre = nombre;
		this.activo = activo;
		this.actualiza = actualiza;		
	}
}

module.exports = { ModelCiudad };