
const express = require('express');
const { ModelProducto, modelproducto } = require('../../../domain/object/producto/modelProducto');
var router = express.Router();

// GET
/**
 * @swagger
 * /operaciongetproducto:
 *   get:
 *     summary: Get all ModelProducto
 *     responses:
 *       200:
 *         description: List of ModelProducto
 */
router.get("/operaciongetproducto", (req, res) => {
	let Respuesta = ["vamos", "a", "hacer", "Prueba", "Get"];
	res.json(Respuesta);	
	//res.json(modelproducto);
});

// Get by Parametro
/**
 * @swagger
 * /operaciongetproductoparametro/{parametro}:
 *   get:
 *     summary: Get ModelProducto by Parametro
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: ModelProducto
 */
router.get('/operaciongetproductoparametro/:parametro', (req, res) => {
	const Parametro = req.params.parametro;
	let Respuesta = ["Esto", "Es", "Una", "Prueba", "Get", "Con", "Parametro:", Parametro];
	res.json(Respuesta);

});


// POST
/**
 * @swagger
 * /operacionpostproducto:
 *   post:
 *     summary: Create a new ModelProducto
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               idmembresia:
 *                 type: string
 *               fechainiciomembresia:
 *                 type: string
 *               idtipomembresia:
 *                 type: string
 *               descripciontipomembresia:
 *                 type: string
 *               iddetalle:
 *                 type: string
 *               fechapagomembresia:  # Aquí faltaba el carácter ":"
 *                 type: string
 *     responses:
 *       201:
 *         description: ModelProducto created
 */

router.post('/operacionpostproducto', (req, res) => {
	const { idmembresia, fechainiciomembresia, idtipomembresia, descripciontipomembresia, iddetalle, fechapagomembresia } = req.body;
	const newModeloProducto = new ModelProducto(idmembresia, fechainiciomembresia, idtipomembresia, descripciontipomembresia, iddetalle, fechapagomembresia);
	modelproducto.push(newModeloProducto);
	res.status(201).json(newModeloProducto);	
});

// PUT
/**
 * @swagger
 * /operacionputproducto/{parametro}: 
 *   put:
 *     summary: Update an existing ModelProducto
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               idmembresia:
 *                 type: string
 *               fechainiciomembresia:
 *                 type: string
 *               idtipomembresia:
 *                 type: string
 *               descripciontipomembresia:
 *                 type: string
 *               iddetalle:
 *                 type: string
 *               fechapagomembresia:  # Aquí también faltaba el ":"
 *                 type: string
 *     responses:
 *       200:
 *         description: ModelProducto updated
 */


router.put('/operacionputproducto/:parametro', (req, res) => {
	const Parametro = req.params.parametro;
	const { idmembresia, fechainiciomembresia, idtipomembresia, descripciontipomembresia, iddetalle, fechapagomembresia } = req.body;
	const newModeloProducto = new ModelProducto(idmembresia, fechainiciomembresia, idtipomembresia, descripciontipomembresia, iddetalle, fechapagomembresia);
	modelproducto[Parametro] = newModeloProducto;
	res.status(200).json(newModeloProducto);	
});

// DELETE
/**
 * @swagger
 * /operaciondeleteproducto/{parametro}:
 *   delete:
 *     summary: Delete a ModelProducto
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       204:
 *         description: ModelProducto deleted
 */
router.delete('/operaciondeleteproducto/:parametro', (req, res) => {	
	const Parametro = req.params.parametro;
	let Respuesta = ["Esto", "Es", "Una", "Prueba", "Delete", "Con", "Parametro:", Parametro];
	res.status(200).json({ Message: 'Eliminado: ' + Parametro });
});

module.exports = router;
