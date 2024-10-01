const express = require('express');
const router = express.Router();

const {ModelGeografia, modelgeografia} = require('../../../domain/object/geografia/modelGeografia');

//GET
/**
    * @swagger
    * /empresa:
    *	get:
    *		summary: GET Geografia
    *		responses:
    *			200:
    *				description: Lista de Geografia
    */

router.get('/getgeografia', (req, res) => {
    res.json(["Esto","es","una","prueba","de","get"]);
})

router.get('/postgeografia', (req, res) => {
    const {idpais, nombrepais, iddepartamento, nombredepartamento, idciudad, nombreciudad} = 
    req.body;
    const newmodelgeografia = new ModelGeografia(idpais, nombrepais, iddepartamento, nombredepartamento, idciudad, nombreciudad);
    res.json(newmodelgeografia);
})

module.exports = router;   