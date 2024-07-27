const express = require("express");
const router = express.Router()
const {signup,Resend_OTP, VerifyOTP}=require("../controller/usercontroller");
 
router.get("/user",signup);

router.get("/user/resendotp",Resend_OTP);

router.get("/user/verifyotp",VerifyOTP);



module.exports=router;