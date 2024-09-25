exports.handler = (event, context, callback) => {
    
    const response = {
        status: '302',
        statusDescription: 'Found',
        headers: {
            location: [{
                key: 'Location',
                value: 'https://axa.uexglobal.com',
            }],
        },
    };        
    callback(null, response);
};