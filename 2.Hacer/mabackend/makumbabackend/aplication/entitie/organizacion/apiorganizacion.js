
const express = require('express');

const {ModelGimnasio} = require('../../../domain/entitie/gimnasio/modelgimnasio')
const {CoreGimnasio} = require('../../../core/entitie/gimnasio/coregimnasio');

const {ModelSede} = require('../../../domain/entitie/sede/modelsede');
const {CoreSede} = require('../../../core/entitie/sede/coresede');


const {ModelEmpleado} = require('../../../domain/entitie/empleado/modelempleado');
const {CoreEmpleado} = require('../../../core/entitie/empleado/coreempleado');


var router = express.Router();


///////////////////////////////////////////////////////////////////////////////////////////////////

// GET
/**
 * @swagger
 * /operaciongetgimnasio:
 *   get:
 *     tags:
 *       - Gimnasio
 *     summary: Get all ModelGimnasio
 *     responses:
 *       200:
 *         description: List of ModelGimnasio
 */
router.get('/operaciongetgimnasio', async (req, res) => {
	try {
		const coregimnasio = new CoreGimnasio();
		const respuestacoregimnasio = await coregimnasio.consultargimnasio();
		res.status(200).json(respuestacoregimnasio);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Id
/**
 * @swagger
 * /operaciongetgimnasioid/{id}:
 *   get:
 *     tags:
 *       - Gimnasio
 *     summary: Get ModelGimnasio by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelGimnasio
 */
router.get('/operaciongetgimnasioid/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const coregimnasio = new CoreGimnasio();
		const respuestacoregimnasio = await coregimnasio.consultargimnasioid(id);
		res.status(200).json(respuestacoregimnasio);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Nombre
/**
 * @swagger
 * /operaciongetgimnasionombre/{nombregimnasio}:
 *   get:
 *     tags:
 *       - Gimnasio 
 *     summary: Get ModelGimnasio by NombreGimnasio
 *     parameters:
 *       - name: nombregimnasio
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelGimnasio
 */
router.get('/operaciongetgimnasionombre/:nombregimnasio', async (req, res) => {
	try {
		const { nombregimnasio } = req.params;
		const coregimnasio = new CoreGimnasio();
		const respuestacoregimnasio = await coregimnasio.consultargimnasionombre(nombregimnasio);
		res.status(200).json(respuestacoregimnasio);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});


// POST
/**
 * @swagger
 * /operacionpostgimnasio:
 *   post:
 *     tags:
 *       - Gimnasio
 *     summary: Create a new ModelGimnasio
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               idciudad:
 *                 type: string
 *                 description: ID de la ciudad
 *               nombre:
 *                 type: string
 *                 description: Nombre del gimnasio
 *               tipo:
 *                 type: string
 *                 description: Tipo de gimnasio
 *               nit:
 *                 type: string
 *                 description: Número de Identificación Tributaria (NIT)
 *               fechaapertura:
 *                 type: string
 *                 format: date
 *                 description: Fecha de apertura
 *               activo:
 *                 type: boolean
 *                 description: Estado activo del gimnasio
 *               actualizar:
 *                 type: boolean
 *                 description: Si se permite la actualización
 *               idsede:
 *                 type: string
 *                 description: ID de la sede
 *               idempleado:
 *                 type: string
 *                 description: ID del empleado encargado
 *     responses:
 *       201:
 *         description: Gimnasio creado con éxito
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Gimnasio creado con éxito
 *                 data:
 *                   $ref: '#/components/schemas/ModelGimnasio'
 */

router.post('/operacionpostgimnasio', async (req, res) => {
	try {
		const coregimnasio = new CoreGimnasio();
		const nuevoGimnasio = req.body;
		const respuestaCoreGimnasio = await coregimnasio.ingresargimnasio(nuevoGimnasio);
		res.status(201).json(respuestaCoreGimnasio);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// PUT
/**
 * @swagger
 * /operacionputgimnasio/{id}:
 *   put:
 *     tags:
 *       - Gimnasio
 *     summary: Update an existing ModelGimnasio by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           description: ID del gimnasio a actualizar
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               nombre:
 *                 type: string
 *                 description: Nombre actualizado del gimnasio
 *               tipo:
 *                 type: string
 *                 description: Tipo actualizado del gimnasio
 *               nit:
 *                 type: string
 *                 description: NIT actualizado
 *               fechaapertura:
 *                 type: string
 *                 format: date
 *                 description: Fecha de apertura actualizada
 *               activo:
 *                 type: boolean
 *                 description: Estado activo actualizado del gimnasio
 *               idsede:
 *                 type: string
 *                 description: ID actualizado de la sede
 *     responses:
 *       200:
 *         description: Gimnasio actualizado con éxito
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Gimnasio actualizado con éxito
 *                 data:
 *                   $ref: '#/components/schemas/ModelGimnasio'
 */

router.put('/operacionputgimnasio/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const datosActualizados = req.body;
		const coregimnasio = new CoreGimnasio();
		const respuestaCoreGimnasio = await coregimnasio.modificargimnasio(id, datosActualizados);
		res.status(200).json(respuestaCoreGimnasio);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// DELETE
/**
 * @swagger
 * /operaciondeletegimnasio/{id}:
 *   delete:
 *     tags:
 *       - Gimnasio
 *     summary: Delete a ModelGimnasio by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *           description: ID del gimnasio a eliminar
 *     responses:
 *       200:
 *         description: Gimnasio eliminado con éxito
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Gimnasio eliminado con éxito
 */

router.delete('/operaciondeletegimnasio/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const coregimnasio = new CoreGimnasio();
		const respuestaCoreGimnasio = await coregimnasio.eliminargimnasio(id);
		res.status(200).json(respuestaCoreGimnasio);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

///////////////////////////////////////////////////////////////////////////////////////////////////

// GET
/**
 * @swagger
 * /operaciongetsede:
 *   get:
 *     tags:
 *       - Sede 
 *     summary: Get all ModelSede
 *     responses:
 *       200:
 *         description: List of ModelSede
 */
router.get('/operaciongetsede', async (req, res) => {
	try {
		const coresede = new CoreSede();
		const respuestacoresede = await coresede.consultarsede();
		res.status(200).json(respuestacoresede);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Id
/**
 * @swagger
 * /operaciongetsedeid/{id}:
 *   get:
 *     tags:
 *       - Sede  
 *     summary: Get ModelSede by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelSede
 */
router.get('/operaciongetsedeid/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const coresede = new CoreSede();
		const respuestacoresede = await coresede.consultarsedeid(id);
		res.status(200).json(respuestacoresede);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Nombre
/**
 * @swagger
 * /operaciongetsedenombre/{nombresede}:
 *   get:
 *     tags:
 *       - Sede
 *     summary: Get ModelSede by NombreSede
 *     parameters:
 *       - name: nombresede
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelSede
 */
router.get('/operaciongetsedenombre/:nombresede', async (req, res) => {
	try {
		const { nombresede } = req.params;
		const coresede = new CoreSede();
		const respuestacoresede = await coresede.consultarsedenombre(nombresede);
		res.status(200).json(respuestacoresede);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});


// POST
/**
 * @swagger
 * /operacionpostsede:
 *   post:
 *     tags:
 *       - Sede
 *     summary: Create a new ModelSede
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ModelSede'
 *     responses:
 *       201:
 *         description: Created ModelSede
 */
router.post('/operacionpostsede', async (req, res) => {
	try {
		const coresede = new CoreSede();
		const nuevaSede = req.body;
		const respuestaCoreSede = await coresede.ingresarsede(nuevaSede);
		res.status(201).json(respuestaCoreSede);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// PUT
/**
 * @swagger
 * /operacionputsede/{id}:
 *   put:
 *     tags:
 *       - Sede
 *     summary: Update an existing ModelSede by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ModelSede'
 *     responses:
 *       200:
 *         description: Updated ModelSede
 */
router.put('/operacionputsede/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const datosActualizados = req.body;
		const coresede = new CoreSede();
		const respuestaCoreSede = await coresede.modificarsede(id, datosActualizados);
		res.status(200).json(respuestaCoreSede);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// DELETE
/**
 * @swagger
 * /operaciondeletesede/{id}:
 *   delete:
 *     tags:
 *       - Sede
 *     summary: Delete a ModelSede by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Deleted ModelSede
 */
router.delete('/operaciondeletesede/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const coresede = new CoreSede();
		const respuestaCoreSede = await coresede.eliminarsede(id);
		res.status(200).json(respuestaCoreSede);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

///////////////////////////////////////////////////////////////////////////////////////////////////

// GET
/**
 * @swagger
 * /operaciongetempleado:
 *   get:
 *     tags:
 *       - Empleado  
 *     summary: Get all ModelEmpleado
 *     responses:
 *       200:
 *         description: List of ModelEmpleado
 */
router.get('/operaciongetempleado', async (req, res) => {
	try {
		const coreempleado = new CoreEmpleado();
		const respuestacoreempleado = await coreempleado.consultarempleado();
		res.status(200).json(respuestacoreempleado);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Id
/**
 * @swagger
 * /operaciongetempleadoid/{id}:
 *   get:
 *     tags:
 *       - Empleado  
 *     summary: Get ModelEmpleado by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelEmpleado
 */
router.get('/operaciongetempleadoid/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const coreempleado = new CoreEmpleado();
		const respuestacoreempleado = await coreempleado.consultarempleadoid(id);
		res.status(200).json(respuestacoreempleado);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// Get by Nombre
/**
 * @swagger
 * /operaciongetempleadonombre/{nombreempleado}:
 *   get:
 *     tags:
 *       - Empleado  
 *     summary: Get ModelEmpleado by NombreEmpleado
 *     parameters:
 *       - name: nombreempleado
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: A Item of ModelEmpleado
 */
router.get('/operaciongetempleadonombre/:nombreempleado', async (req, res) => {
	try {
		const { nombreempleado } = req.params;
		const coreempleado= new CoreEmpleado();
		const respuestacoreempleado = await coreempleado.consultarempleadonombre(nombreempleado);
		res.status(200).json(respuestacoreempleado);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});


// POST
/**
 * @swagger
 * /operacionpostempleado:
 *   post:
 *     tags:
 *       - Empleado
 *     summary: Create a new ModelEmpleado
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ModelEmpleado'
 *     responses:
 *       201:
 *         description: Created ModelEmpleado
 */
router.post('/operacionpostempleado', async (req, res) => {
	try {
		const coreempleado = new CoreEmpleado();
		const nuevoEmpleado = req.body;
		const respuestaCoreEmpleado = await coreempleado.ingresarempleado(nuevoEmpleado);
		res.status(201).json(respuestaCoreEmpleado);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// PUT
/**
 * @swagger
 * /operacionputempleado/{id}:
 *   put:
 *     tags:
 *       - Empleado
 *     summary: Update an existing ModelEmpleado by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ModelEmpleado'
 *     responses:
 *       200:
 *         description: Updated ModelEmpleado
 */
router.put('/operacionputempleado/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const datosActualizados = req.body;
		const coreempleado = new CoreEmpleado();
		const respuestaCoreEmpleado = await coreempleado.modificarempleado(id, datosActualizados);
		res.status(200).json(respuestaCoreEmpleado);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});

// DELETE
/**
 * @swagger
 * /operaciondeleteempleado/{id}:
 *   delete:
 *     tags:
 *       - Empleado
 *     summary: Delete a ModelEmpleado by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Deleted ModelEmpleado
 */
router.delete('/operaciondeleteempleado/:id', async (req, res) => {
	try {
		const { id } = req.params;
		const coreempleado = new CoreEmpleado();
		const respuestaCoreEmpleado = await coreempleado.eliminarempleado(id);
		res.status(200).json(respuestaCoreEmpleado);
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
});


///////////////////////////////////////////////////////////////////////////////////////////////////

module.exports = router;
