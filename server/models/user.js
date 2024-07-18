// const mongoose =require("mongoose");
// const userSchema =mongoose.Schema({
//     name:{
//         required: true,
//         type:String,
//         trim: true,
//     },
//     email:{
//         required:true,
//         type:String,
//         trim:true,
//         validate:{
//             validator: (value)=>{
//               const re= /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
//               return value.match(re);
//             },
//             message:"Please Enter a valid email address",

//         },
//     },
//     password:{
//         required:true,
//         type:String,
//     },
//     address:{
//         type:String,
//         default:"",
//     },
//     type:{
//         type:String,
//         default:"user",
//     },
//     //cart
// });

// const User=mongoose.model("User",userSchema);
// module.exports=User;


//new
// const express = require("express");
// const userRouter = express.Router();
// const auth = require("../middlewares/auth");
// const Order = require("../models/order");
// const { Product } = require("../models/product");
// const User = require("../models/user");

// userRouter.post("/api/add-to-cart", auth, async (req, res) => {
//   try {
//     const { id } = req.body;
//     const product = await Product.findById(id);
//     let user = await User.findById(req.user);

//     if (user.cart.length == 0) {
//       user.cart.push({ product, quantity: 1 });
//     } else {
//       let isProductFound = false;
//       for (let i = 0; i < user.cart.length; i++) {
//         if (user.cart[i].product._id.equals(product._id)) {
//           isProductFound = true;
//         }
//       }

//       if (isProductFound) {
//         let producttt = user.cart.find((productt) =>
//           productt.product._id.equals(product._id)
//         );
//         producttt.quantity += 1;
//       } else {
//         user.cart.push({ product, quantity: 1 });
//       }
//     }
//     user = await user.save();
//     res.json(user);
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });

// userRouter.delete("/api/remove-from-cart/:id", auth, async (req, res) => {
//   try {
//     const { id } = req.params;
//     const product = await Product.findById(id);
//     let user = await User.findById(req.user);

//     for (let i = 0; i < user.cart.length; i++) {
//       if (user.cart[i].product._id.equals(product._id)) {
//         if (user.cart[i].quantity == 1) {
//           user.cart.splice(i, 1);
//         } else {
//           user.cart[i].quantity -= 1;
//         }
//       }
//     }
//     user = await user.save();
//     res.json(user);
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });

// // save user address
// userRouter.post("/api/save-user-address", auth, async (req, res) => {
//   try {
//     const { address } = req.body;
//     let user = await User.findById(req.user);
//     user.address = address;
//     user = await user.save();
//     res.json(user);
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });

// // order product
// userRouter.post("/api/order", auth, async (req, res) => {
//   try {
//     const { cart, totalPrice, address } = req.body;
//     let products = [];

//     for (let i = 0; i < cart.length; i++) {
//       let product = await Product.findById(cart[i].product._id);
//       if (product.quantity >= cart[i].quantity) {
//         product.quantity -= cart[i].quantity;
//         products.push({ product, quantity: cart[i].quantity });
//         await product.save();
//       } else {
//         return res
//           .status(400)
//           .json({ msg: `${product.name} is out of stock!` });
//       }
//     }

//     let user = await User.findById(req.user);
//     user.cart = [];
//     user = await user.save();

//     let order = new Order({
//       products,
//       totalPrice,
//       address,
//       userId: req.user,
//       orderedAt: new Date().getTime(),
//     });
//     order = await order.save();
//     res.json(order);
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });

// userRouter.get("/api/orders/me", auth, async (req, res) => {
//   try {
//     const orders = await Order.find({ userId: req.user });
//     res.json(orders);
//   } catch (e) {
//     res.status(500).json({ error: e.message });
//   }
// });

// module.exports = userRouter;


//new code 1

const mongoose = require("mongoose");
const { productSchema } = require("./product");

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    required: true,
    type: String,
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
  cart: [
    {
      product: productSchema,
      quantity: {
        type: Number,
        required: true,
      },
    },
  ],
});

const User = mongoose.model("User", userSchema);
module.exports = User;

