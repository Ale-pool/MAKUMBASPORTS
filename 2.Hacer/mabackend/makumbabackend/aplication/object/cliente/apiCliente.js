const express = require('express');
const router = express.Router();

const {ModelCliente, modelcliente} = require('../../../domain/object/cliente/modelCliente');

//GET
/**
    * @swagger
    * /empresa:
    *	get:
    *		summary: GET Cliente
    *		responses:
    *			200:
    *				description: Lista de Cliente
    */

router.get('/getcliente', (req, res) => {
    res.json(["Esto","es","una","prueba","de","get"]);
})

router.get('/postcliente', (req, res) => {
    const {idcliente, nombrecliente, iddocumento, descripciondocumento, idgenero, descripciongenero, idestadocivil, descripcionestadocivil} = 
    req.body;
    const newmodelcliente = new ModelCliente(idcliente, nombrecliente, iddocumento, descripciondocumento, idgenero, descripciongenero, idestadocivil, descripcionestadocivil);
    res.json(newmodelcliente);
})

module.exports = router;