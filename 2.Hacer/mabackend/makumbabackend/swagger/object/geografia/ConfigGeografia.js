const swaggerJSDoc = require('swagger-jsdoc');


const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Geografia Alex API',
            version: '1.0.0',
            description: 'Geografia API'
        }
    },
    apis: ['./aplication/object/geografia/*.js']
};


const swaggerSpec = swaggerJSDoc(options);
module.exports = swaggerSpec;