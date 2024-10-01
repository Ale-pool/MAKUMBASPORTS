const modelgeografia =  [];

class ModelGeografia{
    constructor(
        idpais,
        nombrepais,
        iddepartamento,
        nombredepartamento,
        idciudad,
        nombreciudad){
            this.idpais = idpais;
            this.nombrepais = nombrepais;
            this.iddepartamento = iddepartamento;
            this.nombredepartamento = nombredepartamento;
            this.idciudad = idciudad;
            this.nombreciudad = nombreciudad;
        }
}

module.exports = {ModelGeografia, modelgeografia};