
// apisimple,js


const express = require('express');
const { CoreCliente } = require('../../../core/object/cliente/corecliente');
const { ModelCliente, modelcliente } = require('../../../domain/object/cliente/modelCliente');
var router = express.Router();  
const coreCliente = new CoreCliente();

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
router.get("/operaciongetcliente", async (req, res) => {
    const clientes = await coreCliente.consultarcliente();
    res.json(clientes);
});

// Get by Parametro
/**
 * @swagger
 * /operaciongetclienteparametro/{parametro}:
 *   get:
 *     summary: Get ModelCliente by Parametro
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Un Item de ModelCliente
 */
router.get('/operaciongetclienteparametro/:id', async (req, res) => {
    const { id } = req.params;
    const cliente = await coreCliente.consultarclienteporid(id);
    res.json(cliente);
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