const express = require('express');
const bodyParser = require('body-parser');
const swaggerUi = require('swagger-ui-express');

const swaggerSpec = require('./swagger/object/cliente/configCliente');
const clienteApi = require('./aplication/object/cliente/apiCliente');

var app = express();
app.use(bodyParser.json());

app.use('/api-doc', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.use(clienteApi);

const PORT = process.env.PORT || 8067;

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
	console.log(`Swagger docs available at http://localhost:${PORT}/api-doc`);
    
    // Rutas para la entidad Cliente
    console.log(`Get operation available at http://localhost:${PORT}/operaciongetcliente`);
    console.log(`Get operation with parameter available at http://localhost:${PORT}/operaciongetclienteparametro/parametro`);
	console.log(`Post operation available at http://localhost:${PORT}/operacionpostcliente`);
	console.log(`Put operation available at http://localhost:${PORT}/operacionputcliente/parametro`);
	console.log(`Delete operation available at http://localhost:${PORT}/operaciondeletecliente/parametro`);
});


