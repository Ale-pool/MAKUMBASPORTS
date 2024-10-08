
// configCliente.js
const swaggerJSDoc = require('swagger-jsdoc');

const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Cliente API',
            version: '1.0.0',
            description: 'Cliente API'
        }
    },
    
    apis: ['./aplication/object/cliente/*.js']   
};

const swaggerSpec = swaggerJSDoc(options);
module.exports = swaggerSpec;