
// swaggerspecification.js

const swaggerJSDoc = require('swagger-jsdoc');

const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Organizacion API',
            version: '1.0.0',
            description: 'BackEnd Swagger Onion Project'
        }
    },
    // apis: ['./aplication/entitie/geografia/*.js'], 
    apis: ['./aplication/entitie/organizacion/*.js'], 
};

const swaggerSpec = swaggerJSDoc(options);

module.exports = swaggerSpec;
