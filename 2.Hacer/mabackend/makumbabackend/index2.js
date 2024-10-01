const express = require('express');
const bodyParser = require('body-parser');
const swaggerUi = require('swagger-ui-express');
const swaggerSpec = require('./swagger/object/geografia/configGeografia');
const geografiaApi = require('./aplication/object/geografia/apiGeografia');


var app = express();

app.use(bodyParser.json());

app.use('/api-doc', swaggerUi.serve, swaggerUi.setup(swaggerSpec));


app.use(geografiaApi);

const PORT = process.env.PORT || 8067;

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
	console.log(`Swagger docs available at http://localhost:${PORT}/api-doc`);
    console.log(`Get operation available at http://localhost:${PORT}/operaciongetgeografia`);
    console.log(`Get operation available at http://localhost:${PORT}/operaciongetgeografiaparametro/parametro`);	
	console.log(`Post operation available at http://localhost:${PORT}/operacionpostgeografia`);
	console.log(`Put operation available at http://localhost:${PORT}/operacionputgeografia/parametro`);
	console.log(`Delete operation available at http://localhost:${PORT}/operaciondeletegeografiaparametro/parametro`);
});

