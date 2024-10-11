
// apisimple,js


const express = require('express');
const { ModelCliente, modelcliente } = require('../../../domain/object/cliente/modelCliente.js'); 
const { CoreCliente } = require('../../../core/object/cliente/corecliente');
var router = express.Router();  


// GET
/**
 * @swagger
 * /operaciongetcliente:
 *   get:
 *     summary: Get all ModelCliente
 *     responses:
 *       200:
 *         description: List of ModelCliente
 */
router.get('/operaciongetcliente', async (req, res) => {
	try {
		const corecliente = new CoreCliente();
		const respuestacorecliente = await corecliente.consultarcliente();
		res.status(200).json(respuestacorecliente);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});


// Get by Id
/**
 * @swagger
 * /operaciongetclienteid/{id}:
 *   get:
 *     summary: Get ModelCliente by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelCliente
 */
router.get('/operaciongetclienteid/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const corecliente = new CoreCliente();
		const respuestacorecliente= await corecliente.consultarclienteid(id);
		res.status(200).json(respuestacorecliente);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});


// Get by Nombre
/**
 * @swagger
 * /operaciongetclientenombrecliente/{nombrecliente}:
 *   get:
 *     summary: Get ModelCliente by Nombrecliente
 *     parameters:
 *       - name: nombrecliente
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelCliente
 */
router.get('/operaciongetclientenombrecliente/:nombrecliente', async (req, res) => {
	try {
		const { nombrecliente } = req.params;
		const corecliente = new CoreCliente();
		const respuestacorecliente = await corecliente.consultarclientenombrecliente(nombrecliente);
		res.status(200).json(respuestacorecliente);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});





































// POST

/**
 * @swagger
 * /operacionpostcliente:
 *   post:
 *     summary: Create a new ModelCliente
 *     requestBody:
 *       required: true
 *       content:
 *         aplication/json:
 *           schema:
 *             type: object
 *             properties:
 *               idcliente:
 *                 type: string
 *               nombrecliente:
 *                 type: string
 *               iddocumento:
 *                 type: string
 *               descripciondocumento:
 *                 type: string
 *               idgenero:
 *                 type: string
 *               descripciongenero:
 *                 type: string
 *               idestadocivil:
 *                 type: string
 *               descripcionestadocivil:
 *                 type: string
 *     responses:
 *       201:
 *         description: ModelCliente creado
 */

router.post('/operacionpostcliente', async (req, res) => {
    const cliente = req.body;
    const result = await coreCliente.agregarCliente(cliente);
    res.status(201).json(result);
});

// PUT

/**
 * @swagger
 * /operacionputcliente/{parametro}:
 *   put:
 *     summary: Actualizar un ModelCliente existente
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
 *               idcliente:
 *                 type: string
 *               nombrecliente:
 *                 type: string
 *               iddocumento:
 *                 type: string
 *               descripciondocumento:
 *                 type: string
 *               idgenero:
 *                 type: string
 *               descripciongenero:
 *                 type: string
 *               idestadocivil:
 *                 type: string
 *               descripcionestadocivil:
 *                 type: string
 *     responses:
 *       200:
 *         description: ModelCliente actualizado
 */

router.put('/operacionputcliente/:id', async (req, res) => {
    const { id } = req.params;
    const nuevosDatos = req.body;
    const result = await coreCliente.actualizarCliente(id, nuevosDatos);
    res.json(result);
});

// DELETE

/**
 * @swagger
 * /operaciondeletecliente/{parametro}:
 *   delete:
 *     summary: Eliminar un ModelCliente
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       204:
 *         description: ModelCliente eliminado
 */

router.delete('/operaciondeletecliente/:id', async (req, res) => {
    const { id } = req.params;
    const result = await coreCliente.eliminarCliente(id);
    res.json(result);
});
module.exports = router;