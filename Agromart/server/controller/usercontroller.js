const bycrpt =require('bcrypt');
const User = require("../models/userschema");
const nodemailer = require('nodemailer'); 
const { generateOTP } = require('../utils/OTP_Generator');
const { sendOTP } = require('../utils/Send_OTP');
const verifyOTP_Schema=require('../models/verifyOTP_Schema')
const { response } = require('express');
const { checkPrime } = require('crypto');




const signup = async (req,res) => {
    try {
        const { username, email, password } = req.body;
        const bcrypt_pass = await bycrpt.hash(password, 10);
        var OTP_response={}

        const Check = await User.findOne({
            email: email
        })
        if (Check) {
            return res.status(400).json({ error: "Email already exists" });
        }
        const Userdata = new User({
            username: username,
            email: email,
            password: bcrypt_pass
        })
         await Userdata.save()
         .then((result)=>{
            OTP_response=sendOTP(result,res);
         })
         .catch((err)=>{console.log(err)})
         

    }
    catch (error) {
        if (error.code === 11000) {
            res.status(400).json({ error: "Email already exists" });
        } else {
            console.error(error);
            res.status(500).json({ error: "An error occurred while adding user data" });
        }
    }
}

const Resend_OTP=(req,res)=>{
    const result=req.body
    sendOTP(result,res)
}

const VerifyOTP=async(req,res)=>{
const {email,user_OTP}=req.body;
try{
const records=await verifyOTP_Schema.findOne({ email: email });
if(!records){
    return res.status(400).json({ success: false, message: "OTP not found" });
}
const Vaild_OTP=await bycrpt.compare(user_OTP,records.OTP)
if(!Vaild_OTP){
    return res.status(500).json({ success: false, message: "Invalid OTP" });
}
else{
    const currentTime = Date.now();
    if (currentTime < records.ExpyTime) {
        await verifyOTP_Schema.deleteMany({ email: email})
        return res.status(200).json({ success: true, message: "OTP is valid" });
    } else {
        await verifyOTP_Schema.deleteMany({ email: email})
        return res.status(500).json({ success: false, message: "OTP has expired" });
    }
   
}

}
catch(error){
    console.log(error);
    return res.status(500).json({ success: false, message: "An error occurred" });
}
}

module.exports = { signup,Resend_OTP,VerifyOTP};