
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
 *             $ref: '#/components/schemas/ModelGimnasio'
 *     responses:
 *       201:
 *         description: Created ModelGimnasio
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
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ModelGimnasio'
 *     responses:
 *       200:
 *         description: Updated ModelGimnasio
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
 *     responses:
 *       200:
 *         description: Deleted ModelGimnasio
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
 * /operacionpostgimnasio:
 *   post:
 *     tags:
 *       - Sede
 *     summary: Create a new ModelGimnasio
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ModelGimnasio'
 *     responses:
 *       201:
 *         description: Created ModelGimnasio
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
 *       - Sede
 *     summary: Update an existing ModelGimnasio by Id
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
 *             $ref: '#/components/schemas/ModelGimnasio'
 *     responses:
 *       200:
 *         description: Updated ModelGimnasio
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
 *       - Sede
 *     summary: Delete a ModelGimnasio by Id
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Deleted ModelGimnasio
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
 *             $ref: '#/components/schemas/ModelGimnasio'
 *     responses:
 *       201:
 *         description: Created ModelGimnasio
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
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/ModelGimnasio'
 *     responses:
 *       200:
 *         description: Updated ModelGimnasio
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
 *     responses:
 *       200:
 *         description: Deleted ModelGimnasio
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

module.exports = router;
