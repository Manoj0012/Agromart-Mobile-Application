const crypto = require('crypto'); 


const generateOTP = () => {
    return crypto.randomInt(1000, 9999).toString();  
};

module.exports={generateOTP}