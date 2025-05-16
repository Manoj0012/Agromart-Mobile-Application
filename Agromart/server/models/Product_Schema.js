const mongoose=require("mongoose");

const Product_Schema=mongoose.Schema({
    owner:{type:String,required:true},
    Cropname:{type:String,required:true},
    CropType:{type:String,required:true},
    Avalibilty:{type:String,required:true},
    PricePerKG:{type:String,required:true},
    Location:{type:String,required:true},
    Description:{type:String,required:true},
})


module.exports= mongoose.model("Products",Product_Schema);