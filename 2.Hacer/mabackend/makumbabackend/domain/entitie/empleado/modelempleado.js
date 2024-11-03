
// Model of the gym entity

class ModelEmpleado {
    constructor(
        idempleado,
        nombre,
        apellido,
        cargo,
        salario,
        idsede,
        activo,
        actualizar){
        this.idempleado = idempleado;
        this.nombre = nombre;
        this.apellido = apellido;
        this.cargo = cargo;
        this.salario = salario;
        this.idsede = idsede;
        this.activo = activo;
        this.actualizar = actualizar;
        }
}

module.exports = {ModelEmpleado}