const express = require('express');
const bodyParser = require('body-parser');
const swaggerUi = require('swagger-ui-express');

const swaggerSpec = require('./swagger/object/organizacion/configOrganizacion');
const organizacionApi = require('./aplication/object/organizacion/apiOrganizacion');

const app = express();
app.use(bodyParser.json());

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

app.use(organizacionApi);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {    
    console.log('Server Runnig')
})  
