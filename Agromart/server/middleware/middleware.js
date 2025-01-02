   
const User = require("../models/Usercredentials_Schema");
const jwt=require('jsonwebtoken');
const Auth=(req,res,next)=>{
const token=req.header('Authorization')
jwt.verify(token,'private-key',async(err,data)=>{
    if(err){
    return res.status(401).send("Invalid");
    }
        const userdata=await User.findOne({username:data.User})
        req.user=userdata
        return res.send(userdata)
        next();
    })
}

module.exports={Auth}