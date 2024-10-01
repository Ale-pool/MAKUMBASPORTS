const swaggerJSDoc = require('swagger-jsdoc');

const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Organizacion API',
            version: '1.0.0',
            description: 'Organizacion API'
        }
    },
    apis: ['./aplication/object/organizacion/*.js']
};

const swaggerSpec = swaggerJSDoc(options);
module.exports = swaggerSpec;