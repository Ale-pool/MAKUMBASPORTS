
// apisimple,js


const express = require('express');
const { ModelCliente, modelcliente } = require('../../../domain/object/cliente/modelCliente');
var router = express.Router();  

// GET
/**
 * @swagger
 * /operaciongetcliente:
 *   get:
 *     summary: Obtener todos los ModelCliente
 *     responses:
 *       200:
 *         description: Lista de ModelCliente
 */
router.get("/operaciongetgeografia", (req, res) => {
    let Respuesta = ["vamos", "a", "hacer", "Prueba", "Get"];
    res.json(Respuesta);  
    //res.json(modelcliente);
});

// Get by Parametro
/**
 * @swagger
 * /operaciongetclienteparametro/{parametro}:
 *   get:
 *     summary: Obtener ModelCliente por Parametro
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
router.get('/operaciongetclienteparametro/:parametro', (req, res) => {
    const Parametro = req.params.parametro;
    let Respuesta = ["Esto", "Es", "Una", "Prueba", "Get", "Con", "Parametro:", Parametro];

    res.status(201).json(Respuesta);
});

// POST

/**
 * @swagger
 * /operacionpostcliente:
 *   post:
 *     summary: Crear un ModelCliente
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

router.post('/operacionpostcliente', (req, res) => {
    const { idcliente, nombrecliente, iddocumento, descripciondocumento, idgenero, descripciongenero, idestadocivil, descripcionestadocivil } = req.body;
    const newModeloCliente = new ModelCliente(idcliente, nombrecliente, iddocumento, descripciondocumento, idgenero, descripciongenero, idestadocivil, descripcionestadocivil);
    modelcliente.push(newModeloCliente);
    res.status(201).json(newModeloCliente);
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
 *         application/json:
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

router.put('/operacionputcliente/:parametro', (req, res) => {
    const { idcliente, nombrecliente, iddocumento, descripciondocumento, idgenero, descripciongenero, idestadocivil, descripcionestadocivil } = req.body;
    const newModeloCliente = new ModelCliente(idcliente, nombrecliente, iddocumento, descripciondocumento, idgenero, descripciongenero, idestadocivil, descripcionestadocivil);

    newModeloCliente.idcliente = idcliente;
    newModeloCliente.nombrecliente = nombrecliente;
    newModeloCliente.iddocumento = iddocumento;
    newModeloCliente.descripciondocumento = descripciondocumento;
    newModeloCliente.idgenero = idgenero;
    newModeloCliente.descripciongenero = descripciongenero;
    newModeloCliente.idestadocivil = idestadocivil;
    newModeloCliente.descripcionestadocivil = descripcionestadocivil;
    res.status(200).json(newModeloCliente);
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

router.delete('/operaciondeletecliente/:parametro', (req, res) => {
    const Parametro = req.params.parametro;
    let Respuesta = ["Esto", "Es", "Una", "Prueba", "Delete", "Con", "Parametro:", Parametro];

    res.status(200).json({ Message: 'Eliminado: ' + Parametro });
});

module.exports = router;


