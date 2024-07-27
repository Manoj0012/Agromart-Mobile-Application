
const express=require("express")
const bodyparser=require("body-parser")
const bycrpt =require('bcrypt');
const mongoose = require('mongoose');

const Port=process.env.PORT||8080;
// const Mongodb_url=process.env.MONGODB_URL;
require('dotenv').config();

const app=express();
app.use(express.json());
app.use(bodyparser.urlencoded({extended:false}))
app.use("/api",require('./routes/routes'))


app.get("/",(req,res)=>{
    res.send("Sever.js")
    res.end();
})

app.listen(Port, () => {
    console.log(`server running:http://localhost:${Port}`);
});

mongoose.connect(process.env.MONGODB_URL)
.then(()=>{console.log("Database_Connected....")})
.catch((err)=>{console.log("Database-NotConnected...")})