   
const Usercredentials_Schema = require("../models/Usercredentials_Schema");
const User = require("../models/Usercredentials_Schema");
const UserData=require("../models/Userprofile_Schema")
const jwt=require('jsonwebtoken');
const Auth=(req,res,next)=>{
const authHeader = req.headers["authorization"]; 
const token = authHeader && authHeader.split(" ")[1]; 
jwt.verify(token,'private key',async(err,data)=>{
    if(err){
    return res.status(401).json({message:"Invalid",success:false});
    }
        const userdata=await User.findOne({email:data})
        if(!userdata.verified){
            req.user={
                Usercredentials:userdata,
                userdata:{}
            };
        }
        req.user={
            Usercredentials:{verified:true},
            userdata:await  UserData.findOne({email:userdata.email})
        };
        next();
    })
}

module.exports={Auth}