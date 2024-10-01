const express = require('express');
const router = express.Router();

const {ModelOrganizacion, modelorganizacion} = require('../../../domain/object/organizacion/modelOrganizacion');

//GET
/**
    * @swagger
    * /empresa:
    *	get:
    *		summary: GET Organizacion
    *		responses:
    *			200:
    *				description: Lista de Organizacion
    */

router.get('/getorganizacion', (req, res) => {
    res.json(["Esto","es","una","prueba","de","get"]);
})

router.get('/postorganizacion', (req, res) => { 
    const {idgimnasio, nombregimnasio, idsede, nombresede, idempleado, nombreempleado} = 
    req.body;
    const newmodelorganizacion = new ModelOrganizacion(idgimnasio, nombregimnasio, idsede, nombresede, idempleado, nombreempleado);
    res.json(newmodelorganizacion);
})

module.exports = router;