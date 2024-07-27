const mongoose=require("mongoose");
const Product=require("../models/Product_Schema");
const userprofile=require("../models/Userprofile_Schema")


const AddProduct=async(req,res)=>{

try{
    const {email,cropname,croptype,cropcolor,
        cropcategories,avalibilty,priceperkg,
        location,description}=req.body;
        
        const user=await userprofile.findOne({email:email})
        const product=new Product({
            owner:user._id,
            Cropname:cropname,
            CropType:croptype,
            CropColor:cropcolor,
            CropCategories:cropcategories,
            Avalibilty:avalibilty,
            PricePerKG:priceperkg,
            Location:location,
            Description:description,
        })

        await product.save()
        .then((result)=>{
            return res.status(200).json({message:"Product Data Sucessfully stored",sucess:true})
        })
        .catch((error)=>{
            return res.status(500).json({message:"Product Data Not stored",sucess:false,error})
        })
}
catch(error){
    return res.status(500).json({message:"An error Occur",sucess:false})
}

}


const AllProduct=async(req,res)=>{
 try{
 const product=await Product.find()
 .then((result)=>{
    if(!result||result.length==0){
        return res.status(200).json({message:"Product Data Retrived Sucessfully But No data found",sucess:true,Data:false})
    }
    return res.status(200).json({message:"Product Data Retrived Sucessfully",sucess:true,Data:true,result})
 })
 .catch((error)=>{
    return res.status(500).json({message:"Product Data Not Retrived Sucessfully",sucess:false,error})
 })
 }
 catch(error){
 return res.status(500).json({message:"An error Occur",sucess:false})
 }
}

module.exports={AddProduct,AllProduct}