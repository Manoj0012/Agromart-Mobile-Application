
const express=require("express")
const bodyparser=require("body-parser")
const mongoose = require('mongoose');

require('dotenv').config();

const app=express();
app.use(express.json());
app.use(bodyparser.urlencoded({extended:false}))

const Port=process.env.PORT||3060;
const Mongodb_url=process.env.MONGODB_URL;

app.use("/user",require("./routes/userroutes"))
app.get("/",(req,res)=>{
    res.send("hello")
    res.end();
})

app.listen(9000, () => {
    console.log(`server running:http://localhost:${Port}`);
});
console.log(Mongodb_url)
mongoose.connect(Mongodb_url)
.then(()=>{console.log("Database_Connected....")})
.catch((err)=>{console.log("Database-NotConnected...")})