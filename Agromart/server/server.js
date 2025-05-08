
const express=require("express")
const bodyparser=require("body-parser")
const bycrpt =require('bcryptjs');
const mongoose = require('mongoose');
const { Auth } = require("./middleware/middleware");

const Port=process.env.PORT||8080;
// const Mongodb_url=process.env.MONGODB_URL;
require('dotenv').config();

const app=express();
app.use(express.json());
app.use(bodyparser.urlencoded({extended:false}))
app.use("/api",require('./routes/routes'))


app.get("/api",Auth,(req,res)=>{
    const userdata=req.user;
    return res.status(200).json({message:"valid",user:userdata,sucess:true})
})

app.listen(Port, () => {
    console.log(`server running:http://localhost:${Port}`);
});

mongoose.connect(process.env.MONGODB_URL)
.then(()=>{console.log("Database_Connected....")})
.catch((err)=>{console.log("Database-NotConnected...")})