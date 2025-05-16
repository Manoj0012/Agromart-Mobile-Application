const mongoose=require("mongoose");
const Product=require("../models/Product_Schema");
const userprofile=require("../models/Userprofile_Schema");


const AddProduct=async(req,res)=>{
try{
    const {cropName,cropType,availability,pricePerKG,description}=req.body;
     const user=req.user
      const owner=user.userdata;
        const product=new Product({
            owner:owner._id,
            Cropname:cropName,
            CropType:cropType,
            Avalibilty:availability,
            PricePerKG:pricePerKG,
            Location:owner.Location,
            Description:description,
        })
        await product.save()
        .then(()=>{
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


const MyProduct=async(req,res)=>{
    try{
        const{owner_id}=req.body
    const product=await Product.find({owner:owner_id})
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

   const EditProducts=async(req,res)=>{
    try{
    const{id,avalibilty,priceperkg}=req.body
    const product=await Product.findByIdAndUpdate(  
        id,{PricePerKG:priceperkg,Avalibilty:avalibilty},
       { new: true })
       return res.status(200).json({message:"Product Data Updated Sucessfully",sucess:true,Product})
    .catch((error)=>{
       return res.status(500).json({message:"Product Data Not Retrived Sucessfully",sucess:false,error})
    })
    }
    catch(error){
    return res.status(500).json({message:"An error Occur",sucess:false})
    }
   }

   const DeleteProducts=async(req,res)=>{
    try{
    const{id}=req.body
    const product=await Product.deleteOne({_id:id})
       return res.status(200).json({message:"Product Data Deleted Sucessfully",sucess:true,product})
    .catch((error)=>{
       return res.status(500).json({message:"Product Data Not Deleted Sucessfully",sucess:false,error})
    })
    }
    catch(error){
    return res.status(500).json({message:"An error Occur",sucess:false})
    }
   }

const CategoriesProducts=async(req,res)=>{
    try{
    const crop=req.query.crop;
    const result=await Product.find({CropType:crop})
    if(result.length==0){
        return res.status(200).json({message:"Data Successfully Retrived",result,Data:false})  
    }
    res.status(200).json({message:"Data Successfully Retrived",result,Data:true})
    }
    catch(error){
        console.log(error)
        res.status(500).json({message:"An error occur"})
    }
}

const ProductsDetails=async(req,res)=>{
  try{
    const{id}=req.body;
    const result=await Product.findOne({_id:id})
    console.log(result.owner)
    const User=await userprofile.findOne({_id:result.owner})
    res.status(200).json({message:"Data Successfully Retrived",result,User})
  }
  catch(error){
    res.status(200).json({message:"An error Occur",error})
  }
}

module.exports={AddProduct,AllProduct,CategoriesProducts,ProductsDetails,MyProduct,EditProducts,DeleteProducts}