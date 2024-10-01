// apisimple.js

const express = require('express');
const { ModelOrganizacion, modelorganizacion } = require('../../../domain/object/organizacion/modelOrganizacion');

var router = express.Router();

// GET
/**
 * @swagger
 * /operaciongetorganizacion:
 *   get:
 *     summary: Get all ModelOrganizacion
 *     responses:
 *       200:
 *         description: List of ModelOrganizacion
 */
router.get("/operaciongetorganizacion", (req, res) => {
    let Respuesta = ["vamos", "a", "hacer", "Prueba", "Get"];
    res.json(Respuesta);	
    //res.json(modelorganizacion);
});

// Get by Parametro
/**
 * @swagger
 * /operaciongetorganizacionparametro/{parametro}:
 *   get:
 *     summary: Get ModelOrganizacion by Parametro
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: ModelOrganizacion
 */
router.get('/operaciongetorganizacionparametro/:parametro', (req, res) => {
    const Parametro = req.params.parametro;
    let Respuesta = ["Esto", "Es", "Una", "Prueba", "Get", "Con", "Parametro:", Parametro];
    res.json(Respuesta);
    //res.json(modelorganizacion[Parametro]);
});


// POST
/**
 * @swagger
 * /operacionpostorganizacion:
 *   post:
 *     summary: Create a new ModelOrganizacion
 *     requestBody:
 *       required: true
 *       content:
 *         aplication/json:
 *           schema:
 *             type: object
 *             properties:
 *               idgimnasio:
 *                 type: string
 *               nombregimnasio:
 *                 type: string
 *               idsede:
 *                 type: string
 *               nombresede:
 *                 type: string
 *               idempleado:
 *                 type: string
 *               nombreempleado:
 *                 type: string
 *     responses:
 *       201:
 *         description: ModelOrganizacion created
 */

router.post('/operacionpostorganizacion', (req, res) => {
    const {idgimnasio, nombregimnasio, idsede, nombresede, idempleado, nombreempleado} = req.body;
    const newModelOrganizacion = new ModelOrganizacion(idgimnasio, nombregimnasio, idsede, nombresede, idempleado, nombreempleado);
    modelorganizacion.push(newModelOrganizacion);
    res.status(201).json(newModelOrganizacion);	
});

// PUT
/**
 * @swagger
 * /operacionputorganizacion/{parametro}: 
 *   put:
 *     summary: Update an existing ModelOrganizacion
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
 *               idgimnasio:
 *                 type: string
 *               nombregimnasio:
 *                 type: string
 *               idsede:
 *                 type: string
 *               nombresede:
 *                 type: string
 *               idempleado:
 *                 type: string
 *               nombreempleado:
 *                 type: string
 *     responses:
 *       200:
 *         description: ModelOrganizacion updated
 */
router.put('/operacionputorganizacion/:parametro', (req, res) => {
    const { idgimnasio, nombregimnasio, idsede, nombresede, idempleado, nombreempleado } = req.body;
    const Parametro = req.params.parametro;
    const newModelOrganizacion = new ModelOrganizacion(idgimnasio, nombregimnasio, idsede, nombresede, idempleado, nombreempleado);
    modelorganizacion[Parametro] = newModelOrganizacion;
    res.status(200).json(newModelOrganizacion);

});

// DELETE
/**
 * @swagger
 * /operaciondeleteorganizacion/{parametro}:
 *   delete:
 *     summary: Delete a ModelOrganizacion
 *     parameters:
 *       - name: parametro
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       204:
 *         description: ModelOrganizacion deleted
 */
router.delete('/operaciondeleteorganizacion/:parametro', (req, res) => {	
    const Parametro = req.params.parametro;
    let Respuesta = ["Esto", "Es", "Una", "Prueba", "Delete", "Con", "Parametro:", Parametro];
    res.status(200).json({ Message: 'Eliminado: ' + Parametro });
});

module.exports = router;