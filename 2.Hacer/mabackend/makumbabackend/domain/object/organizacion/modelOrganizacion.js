const modelorganizacion = [];

class ModelOrganizacion {

    constructor(idgimnasio,
        nombregimnasio,
        idsede,
        nombresede,
        idempleado,
        nombreempleado){

            this.idgimnasio = idgimnasio;
            this.nombregimnasio = nombregimnasio;
            this.idsede = idsede;
            this.nombresede = nombresede;
            this.idempleado = idempleado;
            this.nombreempleado = nombreempleado;
        }
}

module.exports = {ModelOrganizacion, modelorganizacion}