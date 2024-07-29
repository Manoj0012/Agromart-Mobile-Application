const nodemailer = require('nodemailer');
const bycrpt = require('bcrypt');
const verifyOTP_schema = require('../models/VerifyOTP_Schema');
const { generateOTP } = require('./OTP_Generator');

let transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
        user: process.env.EMAIL, 
        pass: process.env.PASSWORD 
    }
});

const sendOTP = async (result, res) => {
    try {
        const OTP = generateOTP();
        console.log(OTP)

        let mailOptions = {
            from: process.env.EMAIL,
            to: "anoj9626@gmail.com",
            subject: 'Your OTP Code',
            text: `Your OTP code is ${OTP}`
        };
        transporter.sendMail(mailOptions, async (error, info) => {
            if (error) {
                return res.status(500).json({ message: "User Sucessfully Register", sucess: `OTP Not Sended to ${result.email}` })
            }
            else {
                const hash_OTP = await bycrpt.hash(OTP, 10);
                const verifyOTP = new verifyOTP_schema({
                    email: result.email,
                    OTP: hash_OTP,
                    OnTime: Date.now(),
                    ExpyTime: Date.now() + 10 * 60 * 1000
                })
                await verifyOTP.save()
                    .catch((err) => { console.log(err) });
                return res.status(201).json({ message: "User Sucessfully Register", sucess: `OTP Sucessfully Sended to ${result.email}`,info:result.email})
            }
        })
    }
    catch (err) {
        console.log(err);
    };

};

module.exports = { sendOTP };
