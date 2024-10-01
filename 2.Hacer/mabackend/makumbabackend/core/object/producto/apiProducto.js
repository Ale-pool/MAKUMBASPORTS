const express = require('express');
const router = express.Router();

const {ModelProducto, modelproducto} = require('../../../domain/object/producto/modelProducto');

//GET
/**
	* @swagger
	* /empresa:
	*	get:
	*		summary: GET Producto
	*		responses:
	*			200:
	*				description: Lista de Producto
	*/

router.get('/getproducto', (req, res) => {
	res.json(["Esto","es","una","prueba","de","get"]);
})

router.get('/postproducto', (req, res) => {
	const {idmembresia, fechainiciomembresia, idtipomembresia, descripciontipomembresia, iddetalle,fechapagomembresia} = 
	req.body;
	const newmodelproducto = new ModelProducto(idmembresia, fechainiciomembresia, idtipomembresia, 
	descripciontipomembresia, 
	iddetalle,fechapagomembresia);
	res.json(newmodelproducto);
})

module.exports = router;

