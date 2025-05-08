const bycrpt =require('bcryptjs');
const User = require("../models/Usercredentials_Schema");
const userprofile=require("../models/Userprofile_Schema")
const { sendOTP } = require('../utils/Send_OTP');
const verifyOTP_Schema=require('../models/VerifyOTP_Schema');
const jwt=require('jsonwebtoken')

const Resend_OTP=async(req,res)=>{
    const result=req.body;
    const valid=await verifyOTP_Schema.findOne({email:result.email});
    if(valid){
        await verifyOTP_Schema.deleteMany({email:result.email});
    }
    sendOTP(result,res);
}


const VerifyOTP=async(req,res)=>{
const {email,user_OTP}=req.body;
try{
const records=await verifyOTP_Schema.findOne({ email: email });
let user=await User.findOne({ email: email });
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
        if(!user){
            user = new User({
                           email: email,
                           verified:false
                       })
                       await user.save()
       }
        const token=jwt.sign(user.email,"private key");
        const verified=user.verified;
        await verifyOTP_Schema.deleteMany({ email: email})
        return res.status(200).json({ success: true,token:token, message: "OTP is valid",verified:verified});
    } else {
        await verifyOTP_Schema.deleteMany({ email: email})
        return res.status(500).json({ success: false,message: "OTP has expired",verified:verified});
    } 
}
}
catch(error){
    console.log(error);
    return res.status(500).json({ success: false, message: "An error occurred" });
}
}

const Login=async(req,res)=>{
    try{
        const email=req.body.email;
        const OTP_response=await sendOTP(email);
        if(!OTP_response.success){
            return res.status(534).json({email:email,message:OTP_response.message,success:OTP_response.success});
        }
        return res.status(200).json({email:email,message:OTP_response.message,success:OTP_response.success});
    }
    catch(error){
        console.log("An error occur",error);
        res.status(500).json({message:"Internal server error",success:false})
    }
}


const Userprofile=async(req,res)=>{
    try{
        const{firstname,lastname,emailAddress,phonenumber,longitude,latitude,location}=req.body;
        const user=await User.findOne({email:emailAddress});
        if(user){
         const userprofiledata=new userprofile({
            email:emailAddress,
            Firstname:firstname,
            Lastname:lastname,
            Phonenumber:phonenumber,
            longitude:longitude,
            latitude:latitude,
            Location:location
         })
         await userprofiledata.save();
         await User.findByIdAndUpdate(  
             user._id,{ verified: true },
            { new: true });
         return res.status(200).json({ message: "User Profile Successfully Stored",sucess:true});
        }
        else{
            return res.status(500).json({ message: "User doesn't There",success:false});
        }
    }
    catch(error){
     console.log(error);
    res.status(500).json({ error: "An error occurred while signing in" });
    }
};

module.exports = {Login,Resend_OTP,VerifyOTP,Userprofile};