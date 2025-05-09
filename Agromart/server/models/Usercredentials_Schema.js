const mongoose=require("mongoose");

const UserSchema=mongoose.Schema({
email:{type:String,required:true,lowercase: true, unique: true},
verified:{type:Boolean,require:true}
})

module.exports=mongoose.model('UserCredential',UserSchema);