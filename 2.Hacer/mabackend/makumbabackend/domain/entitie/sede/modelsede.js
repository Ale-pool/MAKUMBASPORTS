
// Model of the gym entity

class ModeloSede {
    constructor(
        idsede,
        idgimnasio,
        nombre,
        telefono,
        horario,
        activo,
        actualizar){
        this.idsede = idsede;
        this.idgimnasio = idgimnasio;
        this.nombre = nombre;
        this.telefono = telefono;
        this.horario = horario;
        this.activo = activo;
        this.actualizar = actualizar;
        }
}

module.exports = {ModeloSede}