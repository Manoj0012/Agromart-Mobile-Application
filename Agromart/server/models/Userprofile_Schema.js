const mongoose=require("mongoose");
const mongooseDouble = require("mongoose-double");
const SchemaType = mongoose.Schema.Types;
require('mongoose-double')(mongoose); 
const Userprofile_Schema=mongoose.Schema({
email:{type:String,required:true,lowercase: true, unique: true},
Firstname:{type:String,required:true},
Lastname:{type:String,required:true},
Phonenumber:{type:String,required:true},
latitude:{type:SchemaType.Double,required:true},
longitude:{type:SchemaType.Double,required:true},
Location:{type:String,required:false},
})

module.exports=mongoose.model('UserDatas',Userprofile_Schema);