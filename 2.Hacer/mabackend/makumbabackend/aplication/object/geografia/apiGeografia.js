
// apisimple.js

const express = require('express');
const { ModelGeografia, modelgeografia } = require('../../../domain/object/geografia/modelgeografia'); 

var router = express.Router();

// GET
/**
 * @swagger
 * /operaciongetgeografia:
 *   get:
 *     summary: Get all ModelGeografia
 *     responses:
 *       200:
 *         description: List of ModelGeografia
 */
router.get("/operaciongetgeografia", (req, res) => {
	let Respuesta = ["vamos", "a", "hacer", "Prueba", "Get"];
	res.json(Respuesta);	
	//res.json(modelgeografia);
});

// Get by Parametro
/**
 * @swagger
 * /operaciongetgeografiaparametro/{parametro}:
 *   get:
 *     summary: Get ModelGeografia by Parametro
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelGeografia
 */
router.get('/operaciongetgeografiaparametro/:parametro', (req, res) => {
	const Parametro = req.params.parametro;
	let Respuesta = ["Esto", "Es", "Una", "Prueba", "Get", "Con", "Parametro:", Parametro];

	res.status(201).json(Respuesta);
});

// POST
/**
 * @swagger
 * /operacionpostgeografia:
 *   post:
 *     summary: Create a new ModelGeografia
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               documento:
 *                 type: string
 *               nombres:
 *                 type: string
 *               apellidos:
 *                 type: string 
 *     responses:
 *       201:
 *         description: ModelGeografia created
 */
router.post('/operacionpostgeografia', (req, res) => {
	const {documento, nombres, apellidos} = req.body;
	const newModeloGeografia = new ModelGeografia(documento, nombres, apellidos);
	modelgeografia.push(newModeloGeografia);
	res.status(201).json(newModeloGeografia);	
});

// PUT
/**
 * @swagger
 * /operacionputgeografia/{parametro}: 
 *   put:
 *     summary: Update an existing ModelGeografia
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         aplication/json:
 *           schema:
 *             type: object
 *             properties:
 *               documento:
 *                 type: string
 *               nombres:
 *                 type: string
 *               apellidos:
 *                 type: string 
 *     responses:
 *       200:
 *         description: ModelGeografia updated
 */
router.put('/operacionputgeografia/:parametro', (req, res) => {
    const { documento, nombres, apellidos } = req.body;
	const newModeloGeografia = new ModelGeografia(documento, nombres, apellidos);
	
    newModeloGeografia.documento = req.params.parametro;
	
    newModeloGeografia.nombres = nombres;
	newModeloGeografia.apellidos = apellidos;

	res.status(201).json(newModeloGeografia);
});

// DELETE a user
/**
 * @swagger
 * /operaciondeletegeografiaparametro/{parametro}:
 *   delete:
 *     summary: Delete a ModelGeografia
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       204:
 *         description: ModelGeografia deleted
 */
router.delete('/operaciondeletegeografiaparametro/:parametro', (req, res) => {	
	//const { parametro } = req.params;
	const Parametro = req.params.parametro;
	let Respuesta = ["Esto", "Es", "Una", "Prueba", "Delete", "Con", "Parametro:", Parametro];

	//res.status(200).json(Respuesta);
	res.status(200).json({ Message: 'Eliminado: ' + Parametro });	
});

module.exports = router;