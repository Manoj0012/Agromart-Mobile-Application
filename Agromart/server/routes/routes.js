const express = require("express");
const router = express.Router()
const {signup,Resend_OTP, VerifyOTP, Login, Userprofile}=require("../controller/User_Controller");
const { AddProduct, AllProduct } = require("../controller/Product_Controller");
 
router.post("/user/signup",signup);

router.post("/user/login",Login);

router.post("/user/resendotp",Resend_OTP);

router.post("/user/verifyotp",VerifyOTP);

router.post("/user/userprofile",Userprofile);

router.post("/product/addproduct",AddProduct);

router.post("/product/allproduct",AllProduct);




module.exports=router;