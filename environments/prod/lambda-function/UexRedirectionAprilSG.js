exports.handler = (event, context, callback) => {
    
    const response = {
        status: '301',
        statusDescription: 'Found',
        headers: {
            location: [{
                key: 'Location',
                value: 'https://myhealth-sg.april.asia',
            }],
        },
    };        
    callback(null, response);
};