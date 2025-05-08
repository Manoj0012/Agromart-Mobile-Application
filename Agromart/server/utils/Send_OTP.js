const nodemailer = require('nodemailer');
const bycrpt = require('bcryptjs');
const verifyOTP_schema = require('../models/VerifyOTP_Schema');
const { generateOTP } = require('./OTP_Generator');
const OTP_template = require('./OTP_template');

let transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: process.env.EMAIL, 
        pass: process.env.PASSWORD
    },
});

const sendOTP = async (email) => {
    try {
        const OTP = generateOTP();
        const hash_OTP = await bycrpt.hash(OTP, 10);
        let mailOptions = {
            from: process.env.EMAIL,
            to:email,
            subject: 'Your OTP Code',
            html: OTP_template.replace('{{OTP}}', OTP)
        };
         await verifyOTP_schema.deleteMany({ email: email});
        await new Promise((resolve, reject) => {
            
            transporter.sendMail(mailOptions, async (error) => {
              if (error) return reject(error);
              const verifyOTP = new verifyOTP_schema({
                email,
                OTP: hash_OTP,
                OnTime: Date.now(),
                ExpyTime: Date.now() + 10 * 60 * 1000,
              });
                try{
                    await verifyOTP.save();
                    resolve();
                }
                catch(error){
                    console.log(error);
                }
            });

          });
          return { success: true, message: `OTP successfully sent to ${email}` };
        }
        catch (err) {
            console.log(err)
            return {message:"OTP doesn't send",success:false};
        };
};

module.exports = { sendOTP };
