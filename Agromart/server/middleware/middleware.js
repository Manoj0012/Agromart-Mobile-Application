   
const User = require("../models/Usercredentials_Schema");
const jwt=require('jsonwebtoken');
const Auth=(req,res,next)=>{
const authHeader = req.headers["authorization"]; 
const token = authHeader && authHeader.split(" ")[1]; 
jwt.verify(token,'private key',async(err,data)=>{
    if(err){
    return res.status(401).json({message:"Invalid",success:false});
    }
        const userdata=await User.findOne({username:data.User})
        req.user=userdata
        next();
    })
}

module.exports={Auth}