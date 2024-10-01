const express = require('express');
const bodyParser = require('body-parser');
const swaggerUi = require('swagger-ui-express');
const swaggerSpec = require('./swagger/object/organizacion/configOrganizacion');
const organizacionApi = require('./aplication/object/organizacion/apiOrganizacion');

var app = express();
app.use(bodyParser.json());

app.use('/api-doc', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.use(organizacionApi);

const PORT = process.env.PORT || 8067;

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
    console.log(`Swagger docs available at http://localhost:${PORT}/api-doc`);
    console.log(`Get operation available at http://localhost:${PORT}/operaciongetorganizacion`);
    console.log(`Get operation with parameter available at http://localhost:${PORT}/operaciongetorganizacionparametro/parametro`);
    console.log(`Post operation available at http://localhost:${PORT}/operacionpostorganizacion`);
    console.log(`Put operation available at http://localhost:${PORT}/operacionputorganizacion/parametro`);
    console.log(`Delete operation available at http://localhost:${PORT}/operaciondeleteorganizacion/parametro`);
});
