exports.handler = (event, context, callback) => {
    
    const response = {
        status: '301',
        statusDescription: 'Found',
        headers: {
            location: [{
                key: 'Location',
                value: 'https://www.uexglobal.com',
            }],
        },
    };        
    callback(null, response);
};