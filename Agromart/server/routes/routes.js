const express = require("express");
const router = express.Router()
const {signup,Resend_OTP, VerifyOTP, Login, Userprofile}=require("../controller/User_Controller");
const { AddProduct, AllProduct, CategoriesProducts, ProductsDetails, MyProduct, EditProducts, DeleteProducts } = require("../controller/Product_Controller");
const { Auth } = require("../middleware/middleware");
 

router.post("/user/login",Login);

router.post("/user/resendotp",Resend_OTP);

router.post("/user/verifyotp",VerifyOTP);

router.post("/user/userprofile",Userprofile);

router.post("/product/addproduct",Auth,AddProduct);

router.get("/product/myproducts",MyProduct);

router.post("/product/editmyproduct",EditProducts);

router.post("/product/deletemyproduct",DeleteProducts);

router.get("/product/allproduct",AllProduct);

router.get("/product/categorieproducts",CategoriesProducts)

router.get("/product/productdetails",ProductsDetails)




module.exports=router;