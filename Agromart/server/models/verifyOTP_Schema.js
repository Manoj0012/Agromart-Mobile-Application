const mongoose=require("mongoose");

const verifyOTP_schema=new mongoose.Schema({
 email:{type:String,required:true},
 OTP:{type:String,required:true},
 OnTime:{type:String,required:true},
 ExpyTime:{type:String,required:true}
})


module.exports=mongoose.model("UserOTPs",verifyOTP_schema);