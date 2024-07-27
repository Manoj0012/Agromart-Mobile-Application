// const express = require("express");

// const router = express.Router()



// router.get("/", (req, res) => {
//     res.send("user hello")
// });

router.post("/signup", async (req, res) => {
    try {
        const { username, email,password} = req.body;
        const bcrypt_pass=await bycrpt.hash(password,10);

        const Check = await User.findOne({
            email: email
        })
        if (Check) {
            return res.status(400).json({ error: "Email already exists" });
        }
        const Userdata = new User({
            username: username,
            email: email,
            password:bcrypt_pass
        })
        const result = await Userdata.save();
        res.status(201).json({ message: "User Sucessfully Register" });
        
    }
    catch (error) {
        if (error.code === 11000) { 
            res.status(400).json({ error: "Email already exists" });
        } else {
            console.error(error);
            res.status(500).json({ error: "An error occurred while adding user data" });
        }
    }
})

router.post("/signin", async (req, res) => {

})

// module.exports = router;