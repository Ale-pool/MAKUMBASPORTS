const modelcliente = [];

class ModelCliente {

    constructor(
        idcliente,
        nombrecliente,
        iddocumento,
        descripciondocumento,
        idgenero,
        descripciongenero,
        idestadocivil,
        descripcionestado){

            this.idcliente = idcliente;
            this.nombrecliente = nombrecliente;
            this.iddocumento =iddocumento;
            this.descripciondocumento = descripciondocumento;
            this.idgenero = idgenero;
            this.descripciongenero = descripciongenero;
            this.idestadocivil = idestadocivil;
            this.descripcionestado = descripcionestado;
        }
}

module.exports = {ModelCliente, modelcliente}