
// Model of the gym entity

class ModeloGimnasio {
    constructor(
        idgimnasio,
        idciudad,
        nombre,
        tipo,
        nit,
        fechaapertura,
        activo,
        actualizar,
        idsede,
        idempleado){
        this.idgimnasio = idgimnasio;
        this.idciudad = idciudad;
        this.nombre = nombre;
        this.tipo = tipo;
        this.nit = nit;
        this.fechaapertura = fechaapertura;
        this.activo = activo;
        this.actualizar = actualizar;
        this.idsede = idsede;
        this.idempleado = idempleado;
        }
}

module.exports = {ModeloGimnasio}