const bycrpt =require('bcrypt');
const User = require("../models/User_Schema");
const userprofile=require("../models/Userprofile_Schema")
const { sendOTP } = require('../utils/Send_OTP');
const verifyOTP_Schema=require('../models/VerifyOTP_Schema');


const signup = async (req,res) => {
    try {
        const { email, password } = req.body;
        const bcrypt_pass = await bycrpt.hash(password, 10);
        var OTP_response={}

        const Check = await User.findOne({
            email: email
        })
        if (Check) {
            return res.status(400).json({ error: "Email already exists" });
        }
        const Userdata = new User({
            email: email,
            password: bcrypt_pass,
            verified:false
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
const user=await User.findOne({ email: email });
// console.log(user);
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
        await User.findByIdAndUpdate(  
             user._id,{ verified: true },
            { new: true });
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

const Login=async(req,res)=>{
    try {
        const {email, password } = req.body;
        const user = await User.findOne({
            email: email
        })
        if (!user) {
            return res.status(400).json({ error: "User doesn't There" })
        }
        const Valid_User = await bycrpt.compare(password,user.password);
        if (!Valid_User) {
            return res.status(400).json({ error: "Invalid password" });
        }
        else{
            const Check_verified=user.verified;
            if(Check_verified){
                res.status(200).json({ message: "User Successfully Loggedin",verify:true});
            }
            else{
                res.status(200).json({ message: "User Successfully Loggedin",verify:false});
            }
            
        }
    }
    catch (error) {
        console.log(error);
        res.status(500).json({ error: "An error occurred while signing in" });
    }

}


const Userprofile=async(req,res)=>{
    try{
        const{email,Firstname,Lastname,Phonenumber,Location}=req.body;
        const user=await User.findOne({email:email});
        if(user){
         const userprofiledata=new userprofile({
            email:email,
            Firstname:Firstname,
            Lastname:Lastname,
            Phonenumber:Phonenumber,
            Location:Location
         })
         await userprofiledata.save();
         return res.status(200).json({ message: "User Profile Successfully Stored",success:true});
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

module.exports = { signup,Login,Resend_OTP,VerifyOTP,Userprofile};