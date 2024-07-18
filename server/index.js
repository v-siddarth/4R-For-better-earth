// const express=require("express");
// const mongoose=require("mongoose");
// const authRouter=require("./routes/auth");

// //INIT
// const PORT = 3000;
// const app=express();
// const DB="mongodb+srv://siddarth:vijay207@cluster0.bh0ilaa.mongodb.net/?retryWrites=true&w=majority";

// //client ->middleware-> server->client
// app.use(express.json());
// app.use(authRouter);


// //connections
// mongoose
//     .connect(DB)
//         .then(()=>{
//             console.log("connection successfull");
//             })
//             .catch((e)=>{
//                         console.log(e);
//                         });

// app.listen(PORT, "0.0.0.0",()=>{
//     console.log(`connected at port ${PORT}`);
// });



//new code
// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

// INIT
const PORT = process.env.PORT || 3000;
// const PORT = process.env.PORT || 5500;

const app = express();
const DB ="mongodb+srv://siddarth:vijay207@cluster0.bh0ilaa.mongodb.net/?retryWrites=true&w=majority";
// const DB ="mongodb+srv://tusharbhabal73:tushar97@cluster0.fhhp7ph.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
